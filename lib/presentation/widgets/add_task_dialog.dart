// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../domain/entities/task.dart';
// import '../bloc/task_bloc.dart';
// import '../bloc/task_event.dart';

// class TaskFormPage extends StatefulWidget {
//   const TaskFormPage({Key? key}) : super(key: key);

//   @override
//   State<TaskFormPage> createState() => _TaskFormPageState();
// }

// class _TaskFormPageState extends State<TaskFormPage> {
//   final _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Add Task')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(labelText: 'Task title'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final task = Task(
//                   id: DateTime.now().millisecondsSinceEpoch.toString(),
//                   title: _controller.text,
//                   completed: false,
//                   updatedAt: DateTime.now(),
//                   isSynced: false,
//                 );
//                 BlocProvider.of<TaskBloc>(context).add(AddTaskEvent(task));
//                 Navigator.pop(context);
//               },
//               child: Text('Add Task'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
