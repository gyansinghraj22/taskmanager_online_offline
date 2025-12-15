// lib/domain/usecases/get_tasks.dart
import 'package:dartz/dartz.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';
import 'package:taskmanager/core/error/failures.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Stream<List<Task>> execute() {
    return repository.getTasks();
  }
}
