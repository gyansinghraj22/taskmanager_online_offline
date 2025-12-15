// lib/domain/repositories/task_repository.dart
import '../entities/task.dart';

abstract class TaskRepository {
  Stream<List<Task>> getTasks();
  Future<void> addTask(String title);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}
