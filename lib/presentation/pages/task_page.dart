// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/task_bloc.dart';
// import '../bloc/task_event.dart';
// import '../bloc/task_state.dart';
// import 'task_form_page.dart';

// class TaskPage extends StatelessWidget {
//   const TaskPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tasks')),
//       body: BlocBuilder<TaskBloc, TaskState>(
//         builder: (context, state) {
//           if (state is TaskLoading) return Center(child: CircularProgressIndicator());
//           if (state is TaskLoaded) {
//             if (state.tasks.isEmpty) return Center(child: Text('No Tasks'));
//             return ListView.builder(
//               itemCount: state.tasks.length,
//               itemBuilder: (context, index) {
//                 final task = state.tasks[index];
//                 return ListTile(
//                   title: Text(task.title),
//                   leading: Checkbox(
//                     value: task.completed,
//                     onChanged: (val) {
//                       BlocProvider.of<TaskBloc>(context).add(
//                         UpdateTaskEvent(task.copyWith(completed: val!)),
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           }
//           if (state is TaskError) return Center(child: Text(state.message));
//           return SizedBox();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => TaskFormPage()),
//           );
//         },
//       ),
//     );
//   }
// }
