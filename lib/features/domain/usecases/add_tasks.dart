// lib/domain/usecases/add_task.dart
import 'package:dartz/dartz.dart';
import 'package:taskmanager/core/error/failures.dart';
import '../repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<Either<Failure, Unit>> execute(String title) async {
    await repository.addTask(title);
    return const Right(unit);
  }
}
