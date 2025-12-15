// lib/core/utils/sync_manager.dart
import 'dart:async';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:taskmanager/features/data/datasources/local/task_local_datasource.dart';
import 'package:taskmanager/features/data/datasources/remote/task_remote_datasources.dart';
import '../../features/domain/entities/task.dart';

class SyncManager {
  static final SyncManager _instance = SyncManager._internal();
  factory SyncManager() => _instance;
  SyncManager._internal();

  final TaskLocalDataSource _local = TaskLocalDataSource();
  final TaskRemoteDataSource _remote = TaskRemoteDataSource();
  final Connectivity _connectivity = Connectivity();

  StreamController<int> _pendingSyncController =
      StreamController<int>.broadcast();
  Timer? _retryTimer;
  int _retryCount = 0;
  static const int _maxRetries = 5;
  static const Duration _baseDelay = Duration(seconds: 2);

  Stream<int> get pendingSyncStream => _pendingSyncController.stream;

  Future<void> init() async {
    await _local.init();
    _listenToConnectivity();
    checkPendingSync();
  }

  void _listenToConnectivity() {
    _connectivity.onConnectivityChanged.listen(( result) {
      if (result != ConnectivityResult.none) {
        _performSync();
      }
    });
  }

  Future<void> checkPendingSync() async {
    final pendingCount = _local.getPendingSync().length;
    _pendingSyncController.add(pendingCount);
  }

  Future<void> _performSync() async {
    if (_retryTimer?.isActive ?? false) return;

    final pending = _local.getPendingSync();
    if (pending.isEmpty) {
      _pendingSyncController.add(0);
      _resetRetry();
      return;
    }

    try {
      for (final operation in pending) {
        await _processOperation(operation);
        await Future.delayed(Duration(milliseconds: 100)); // Rate limiting
      }
      _pendingSyncController.add(0);
      _resetRetry();
    } catch (e) {
      _scheduleRetry();
    }
  }

  Future<void> _processOperation(Map<String, dynamic> operation) async {
    final type = operation['type'] as String;
    final data = operation['data'] as Map<String, dynamic>;
    final key = operation['key'] as String?;

    switch (type) {
      case 'create':
      case 'update':
        final task = Task.fromJson(data);
        await _remote.syncTask(task);
        // Mark local task as synced
        final localTask =
            await _local.getTasks().firstWhere((t) => t.id == task.id);
        if (localTask != null) {
          await _local.saveTask(localTask.copyWith(isSynced: true));
        }
        break;
      case 'delete':
        await _remote.deleteTask(data['id']);
        break;
    }

    if (key != null) {
      await _local.clearSyncItem(key);
    }

    await checkPendingSync();
  }

  void _scheduleRetry() {
    _retryCount++;
    final delay = _baseDelay * pow(2, _retryCount).toInt();
    final jitter = Duration(milliseconds: Random().nextInt(1000));

    _retryTimer = Timer(delay + jitter, () async {
      await _performSync();
    });
  }

  void _resetRetry() {
    _retryCount = 0;
    _retryTimer?.cancel();
  }

  Future<void> forceSync() async {
    _resetRetry();
    await _performSync();
  }

  void dispose() {
    _retryTimer?.cancel();
    _pendingSyncController.close();
  }
}
