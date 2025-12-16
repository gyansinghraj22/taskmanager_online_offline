// // lib/presentation/widgets/task_list.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taskmanager/presentation/bloc/task_event.dart';
// import '../../features/domain/entities/task.dart';
// import '../bloc/task_bloc.dart';

// class TaskList extends StatelessWidget {
//   final List<Task> tasks;
//   const TaskList({required this.tasks});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: tasks.length,
//       itemBuilder: (context, index) {
//         final task = tasks[index];
//         return ListTile(
//           leading: Checkbox(
//             value: task.completed,
//             onChanged: (_) => context.read<TaskBloc>().add(UpdateTaskEvent(task.copyWith(completed: !task.completed))),
//           ),
//           title: Text(task.title, style: TextStyle(decoration: task.completed ? TextDecoration.lineThrough : null)),
//           trailing: IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () => context.read<TaskBloc>().add(DeleteTaskEvent(task.id)),
//           ),
//         );
//       },
//     );
//   }
// }
