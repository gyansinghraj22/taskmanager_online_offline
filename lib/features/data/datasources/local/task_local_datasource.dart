// lib/data/datasources/local/task_local_datasource.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmanager/features/data/model/task_model.dart';
import 'package:taskmanager/features/domain/entities/task.dart';
import 'package:uuid/uuid.dart';

class TaskLocalDataSource {
  static const String _boxName = 'tasks';
  static const String _queueBoxName = 'syncQueue';
  late Box<TaskModel> _tasksBox;
  late Box<Map<String, dynamic>> _queueBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModelAdapter());
    _tasksBox = await Hive.openBox<TaskModel>(_boxName);
    _queueBox = await Hive.openBox(_queueBoxName);
  }

  Stream<List<Task>> watchTasks() {
    return _tasksBox.watch().map((_) => getTasks());
  }

  List<Task> getTasks() {
    return _tasksBox.values.map((model) => model.toDomain()).toList();
  }

  Future<void> saveTask(Task task) async {
    final model = TaskModel.fromDomain(task);
    await _tasksBox.put(task.id, model);

    if (!task.isSynced) {
      _enqueueSync('update', task as Map<String, dynamic>);
    }
  }

  Future<void> deleteTask(String id) async {
    await _tasksBox.delete(id);
    _enqueueSync('delete', {'id': id});
  }

  List<Map<String, dynamic>> getPendingSync() => _queueBox.values.toList();

  Future<void> clearSyncItem(String key) => _queueBox.delete(key);

  void _enqueueSync(String type, Map<String, dynamic> data) {
    final operation = {
      'type': type,
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    };
    final key = Uuid().v4();
    _queueBox.put(key, operation);
  }
}
