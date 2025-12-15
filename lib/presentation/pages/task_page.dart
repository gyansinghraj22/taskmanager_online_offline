// lib/presentation/pages/task_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/presentation/bloc/task_event.dart';
import 'package:taskmanager/presentation/bloc/task_state.dart';
import 'package:taskmanager/presentation/widgets/add_task_dialog.dart';
import '../bloc/task_bloc.dart';
import '../widgets/task_list.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<TaskBloc>()..add(LoadTasks()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
          actions: [
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoaded) {
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: state.pendingSync > 0
                        ? Stack(
                            children: [
                              Icon(Icons.sync),
                              if (state.pendingSync > 0)
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                                    child: Text('${state.pendingSync}', style: TextStyle(color: Colors.white, fontSize: 12)),
                                  ),
                                )
                            ],
                          )
                        : Icon(Icons.sync),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) return Center(child: CircularProgressIndicator());
            if (state is TaskLoaded) return TaskList(tasks: state.tasks);
            if (state is TaskError) return Center(child: Text(state.message));
            return Center(child: Text('No tasks'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(context: context, builder: (_) => AddTaskDialog()),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
