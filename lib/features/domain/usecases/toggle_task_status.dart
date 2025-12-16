// // domain/usecases/toggle_task_status.dart
// import 'package:taskmanager/features/domain/entities/task.dart';
// import 'package:taskmanager/features/domain/repositories/task_repository.dart';

// class ToggleTaskStatusParams {
//   final String id;
//   ToggleTaskStatusParams(this.id);
// }

// class ToggleTaskStatusUseCase {
//   final TaskRepository repository;

//   ToggleTaskStatusUseCase(this.repository);

//   Future<void> call(ToggleTaskStatusParams params) async {
//     // 1. Fetch the existing task
//     TaskEntity existingTask = await repository.getTaskById(params.id);

//     // 2. Apply business logic (invert status)
//     final updatedTask = existingTask.copyWith(
//       isCompleted: !existingTask.isCompleted,
//     );

//     // 3. Persist the updated entity
//     await repository.updateTask(updatedTask);
//   }
// }