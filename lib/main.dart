// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'core/network/network_info.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:http/http.dart' as http;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   Hive.registerAdapter(TaskModelAdapter());
//   final taskBox = await Hive.openBox<TaskModel>('tasks');

//   final localDataSource = TaskLocalDataSource(taskBox);
//   final remoteDataSource = TaskRemoteDataSource(client: http.Client(), baseUrl: 'https://yourapi.com');
//   final networkInfo = NetworkInfoImpl(Connectivity());

//   final repository = TaskRepositoryImpl(
//     local: localDataSource,
//     remote: remoteDataSource,
//     networkInfo: networkInfo,
//   );

//   runApp(MyApp(
//     repository: repository,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final TaskRepositoryImpl repository;
//   const MyApp({Key? key, required this.repository}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<TaskBloc>(
//           create: (_) => TaskBloc(
//             getTasks: GetTasks(repository),
//             addTask: AddTask(repository),
//           )..add(LoadTasksEvent()),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TaskPage(),
//       ),
//     );
//   }
// }
