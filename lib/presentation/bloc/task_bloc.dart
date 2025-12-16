// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taskmanager/features/domain/usecases/add_tasks.dart';
// import 'package:taskmanager/features/domain/usecases/get_tasks.dart';

// import 'task_event.dart';
// import 'task_state.dart';

// class TaskBloc extends Bloc<TaskEvent, TaskState> {
//   final GetAllTasksUseCase getTasks;
//   final CreateTaskUseCase addTask;

//   TaskBloc({required this.getTasks, required this.addTask})
//       : super(TaskInitial()) {
//     on<LoadTasksEvent>((event, emit) async {
//       emit(TaskLoading());
//       final result = await getTasks();
//       result.fold(
//         (failure) => emit(TaskError(failure.message)),
//         (tasks) => emit(TaskLoaded(tasks)),
//       );
//     });

//     on<AddTaskEvent>((event, emit) async {
//       final result = await addTask(event.task);
//       result.fold(
//         (failure) => emit(TaskError(failure.toString())),
//         (_) => add(LoadTasksEvent()),
//       );
//     });
//   }
// }
