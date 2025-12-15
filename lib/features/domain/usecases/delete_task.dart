// lib/domain/usecases/delete_task.dart
import 'package:dartz/dartz.dart';
import '../repositories/task_repository.dart';
import 'package:taskmanager/core/error/failures.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<Either<Failure, Unit>> execute(String id) async {
    await repository.deleteTask(id);
    return const Right(unit);
  }
}
