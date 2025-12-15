// lib/domain/usecases/update_task.dart
import 'package:dartz/dartz.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';
import 'package:taskmanager/core/error/failures.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<Either<Failure, Unit>> execute(Task task) async {
    await repository.updateTask(task);
    return const Right(unit);
  }
}
