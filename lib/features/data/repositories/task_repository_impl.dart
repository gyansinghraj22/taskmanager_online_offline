// import 'package:taskmanager/core/network/network_info.dart';
// import 'package:taskmanager/features/data/datasources/task_remote_datasources.dart';
// import 'package:taskmanager/features/data/model/task_model.dart';

// import '../../domain/entities/task.dart';
// import '../../domain/repositories/task_repository.dart';
// import '../datasources/task_local_datasource.dart';

// class TaskRepositoryImpl implements TaskRepository {
//   final TaskLocalDataSource local;
//   final TaskRemoteDataSource remote;
//   final NetworkInfo networkInfo;

//   TaskRepositoryImpl({
//     required this.local,
//     required this.remote,
//     required this.networkInfo,
//   });

//   @override
//   Future<void> createTask(TaskEntity task) async {
//     await local.addTask(TaskModel.fromEntity(task));
//     if (await networkInfo.isConnected) {
//       await remote.uploadTask(TaskModel.fromEntity(task));
//     }
//   }

//   @override
//   Future<List<TaskEntity>> getAllTasks() async {
//     if (await networkInfo.isConnected) {
//       final remoteTasks = await remote.getTasks();
//       // Optional: Update local DB with remote tasks
//       for (var task in remoteTasks) {
//         await local.addTask(task);
//       }
//     }
//     final localTasks = await local.getTasks();
//     return localTasks.map((e) => e.toEntity()).toList();
//   }

//   @override
//   Future<void> updateTask(TaskEntity task) async {
//     await local.updateTask(TaskModel.fromEntity(task));
//     if (await networkInfo.isConnected) {
//       await remote.uploadTask(TaskModel.fromEntity(task));
//     }
//   }

//   @override
//   Future<void> deleteTask(String id) async {
//     await local.deleteTask(id);
//     // Optionally delete from remote
//   }

//   Future<void> syncTasks() async {
//     if (await networkInfo.isConnected) {
//       final unsyncedTasks = (await local.getTasks()).where((t) => !t.isSynced);
//       for (var task in unsyncedTasks) {
//         await remote.uploadTask(task);
//         task.isSynced = true;
//         await local.updateTask(task);
//       }
//     }
//   }
// }
