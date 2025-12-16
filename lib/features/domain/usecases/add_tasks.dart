// // domain/usecases/create_task.dart
// import 'package:taskmanager/features/domain/entities/task.dart';
// import 'package:taskmanager/features/domain/repositories/task_repository.dart';

// class CreateTaskParams {
//   final String title;
//   final String description;
//   CreateTaskParams({required this.title, required this.description});
// }

// class CreateTaskUseCase {
//   final TaskRepository repository;

//   CreateTaskUseCase(this.repository);

//   Future<void> call(CreateTaskParams params) async {
//     // 1. Application Logic: Generate a unique ID (Domain Layer responsibility)
//     final newId = DateTime.now().microsecondsSinceEpoch.toString(); 

//     // 2. Create the Entity
//     final newTask = TaskEntity(
//       id: newId,
//       title: params.title,
//       description: params.description,
//       isCompleted: false, // Default value set in the Use Case
//     );

//     // 3. Persist the Entity
//     await repository.createTask(newTask);
//   }
// }