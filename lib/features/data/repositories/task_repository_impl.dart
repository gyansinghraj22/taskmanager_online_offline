// lib/data/repositories/task_repository_impl.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:taskmanager/core/utils/sync_manager.dart';
import 'package:taskmanager/features/data/datasources/remote/task_remote_datasources.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/local/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _local;
  final TaskRemoteDataSource _remote;
  final SyncManager _syncManager;

  TaskRepositoryImpl(this._local, this._remote, this._syncManager);

  @override
  Stream<List<Task>> getTasks() => _local.watchTasks();

  @override
  Future<void> addTask(String title) async {
    final task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      updatedAt: DateTime.now(),
    );
    await _local.saveTask(task);
    _syncManager.checkPendingSync(); // Trigger sync check
  }

  @override
  Future<void> updateTask(Task task) async {
    final updatedTask = task.copyWith(
      updatedAt: DateTime.now(), 
      isSynced: false
    );
    await _local.saveTask(updatedTask);
    _syncManager.checkPendingSync(); // Consistent with addTask
  }

  @override
  Future<void> deleteTask(String id) async {
    await _local.deleteTask(id);
    _syncManager.checkPendingSync(); // Consistent sync trigger
  }

  // Helper method to check connectivity
  Future<bool> _isConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Optional: Manual sync trigger (can be called from UI)
  Future<void> forceSync() async {
    final isConnected = await _isConnected();
    if (isConnected) {
      await _performSync();
    }
  }

  // Internal sync implementation (used by SyncManager or forceSync)
  Future<void> _performSync() async {
    final pending = _local.getPendingSync();
    if (pending.isEmpty) return;

    for (final operation in pending) {
      try {
        final type = operation['type'] as String;
        final data = operation['data'] as Map<String, dynamic>;
        final key = operation['key'] as String?;

        switch (type) {
          case 'create':
          case 'update':
            final taskData = data['data'] as Map<String, dynamic>? ?? data;
            final task = Task.fromJson(taskData);
            await _remote.syncTask(task);
            break;
          case 'delete':
            final taskId = data['id'] as String;
            await _remote.deleteTask(taskId);
            break;
        }

        // Clear synced operation from queue
        if (key != null) {
          await _local.clearSyncItem(key);
        }
      } catch (e) {
        print('Sync operation failed: $e');
        // Don't break - continue with next operations
        continue;
      }
    }
    
    // Update sync status
    _syncManager.checkPendingSync();
  }
}
