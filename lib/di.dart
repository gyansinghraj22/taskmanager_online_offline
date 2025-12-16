// import 'package:get_it/get_it.dart';
// import 'features/tasks/data/datasources/task_local_datasource.dart';
// import 'features/tasks/data/datasources/task_remote_datasource.dart';
// import 'features/tasks/data/repositories/task_repository_impl.dart';
// import 'features/tasks/domain/repositories/task_repository.dart';
// import 'features/tasks/domain/usecases/add_task.dart';
// import 'features/tasks/domain/usecases/get_tasks.dart';
// import 'features/tasks/domain/usecases/sync_tasks.dart';
// import 'features/tasks/presentation/bloc/task_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Bloc
//   sl.registerFactory(() => TaskBloc(
//       getTasks: sl(),
//       addTask: sl(),
//       syncTasks: sl()
//   ));

//   // Use Cases
//   sl.registerLazySingleton(() => GetTasks(sl()));
//   sl.registerLazySingleton(() => AddTask(sl()));
//   sl.registerLazySingleton(() => SyncTasks(sl()));

//   // Repository
//   sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(
//       local: sl(),
//       remote: sl()
//   ));

//   // Data sources
//   final taskBox = await Hive.openBox('tasks');
//   sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSourceImpl(taskBox));
//   sl.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSourceImpl());

//   // Core
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
// }
