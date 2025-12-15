// // In main.dart or DI container
// final sl = GetIt.instance;

// void init() {
//   // Data sources
//   sl.registerLazySingleton(() => TaskLocalDataSource());
//   sl.registerLazySingleton(() => TaskRemoteDataSource());
//   sl.registerLazySingleton(() => SyncManager());

//   // Repository
//   sl.registerLazySingleton<TaskRepository>(
//     () => TaskRepositoryImpl(
//       sl(),
//       sl(),
//       sl(),
//     ),
//   );

//   // Use cases
//   sl.registerLazySingleton(() => GetTasks(sl()));
//   sl.registerLazySingleton(() => AddTask(sl()));
//   sl.registerLazySingleton(() => UpdateTask(sl()));
//   sl.registerLazySingleton(() => DeleteTask(sl()));
// }
