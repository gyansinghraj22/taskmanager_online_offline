// // domain/usecases/update_task_details.dart
// class UpdateTaskDetailsParams {
//   final String id;
//   final String? title;
//   final String? description;
//   UpdateTaskDetailsParams({required this.id, this.title, this.description});
// }

// class UpdateTaskDetailsUseCase {
//   final TaskRepository repository;

//   UpdateTaskDetailsUseCase(this.repository);

//   Future<void> call(UpdateTaskDetailsParams params) async {
//     // 1. Fetch the existing task
//     TaskEntity existingTask = await repository.getTaskById(params.id);

//     // 2. Update properties using the copyWith method
//     final updatedTask = existingTask.copyWith(
//       title: params.title,
//       description: params.description,
//     );

//     // 3. Persist the updated entity
//     await repository.updateTask(updatedTask);
//   }
// }