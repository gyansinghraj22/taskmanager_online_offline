// domain/usecases/delete_task.dart
import 'package:taskmanager/features/domain/repositories/task_repository.dart';

class DeleteTaskParams {
  final String id;
  DeleteTaskParams(this.id);
}

class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<void> call(DeleteTaskParams params) async {
    // Optional: Add logic like permission checks or cascade deletion here.

    await repository.deleteTask(params.id);
  }
}
