import 'package:hive/hive.dart';
import 'package:taskmanager/features/data/model/task_model.dart';

class TaskLocalDataSource {
  final Box<TaskModel> taskBox;

  TaskLocalDataSource(this.taskBox);

  Future<List<TaskModel>> getTasks() async => taskBox.values.toList();

  Future<void> addTask(TaskModel task) async => await taskBox.put(task.id, task);

  Future<void> updateTask(TaskModel task) async => await task.save();

  Future<void> deleteTask(String id) async => await taskBox.delete(id);
}
