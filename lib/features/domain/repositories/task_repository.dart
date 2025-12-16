// domain/repositories/task_repository.dart
import 'package:taskmanager/features/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getAllTasks();
  // Future<TaskEntity> getTaskById(String taskId);
  Future<void> createTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String taskId);
}