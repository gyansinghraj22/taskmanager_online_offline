// // domain/usecases/get_task_by_id.dart
// // You often use a simple wrapper class for single, clean parameters
// import 'package:taskmanager/features/domain/entities/task.dart';
// import 'package:taskmanager/features/domain/repositories/task_repository.dart';

// class GetTaskByIdParams {
//   final String id;
//   GetTaskByIdParams(this.id);
// }

// class GetTaskByIdUseCase {
//   final TaskRepository repository;

//   GetTaskByIdUseCase(this.repository);

//   Future<TaskEntity> call(GetTaskByIdParams params) async {
//     return await repository.getTaskById(params.id);
//   }
// }