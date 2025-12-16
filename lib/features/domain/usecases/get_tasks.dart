import 'package:taskmanager/features/domain/entities/task.dart';
import 'package:taskmanager/features/domain/repositories/task_repository.dart';

class GetAllTasksUseCase {
  final TaskRepository repository;

  GetAllTasksUseCase(this.repository);

  // The 'call' method makes the Use Case class callable like a function
  Future<List<TaskEntity>> call() async {
    // Application business logic goes here (e.g., checking sync status,
    // merging local/remote data, filtering based on complexity)

    return await repository.getAllTasks();
  }
}
