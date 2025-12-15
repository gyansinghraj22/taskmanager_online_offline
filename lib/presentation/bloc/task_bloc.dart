// lib/presentation/bloc/task_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/features/domain/usecases/add_tasks.dart';
import 'package:taskmanager/features/domain/usecases/delete_task.dart';
import 'package:taskmanager/features/domain/usecases/get_tasks.dart';
import 'package:taskmanager/features/domain/usecases/update_task.dart';
import 'package:taskmanager/presentation/bloc/task_event.dart';
import 'package:taskmanager/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks _getTasks;
  final AddTask _addTask;
  final UpdateTask _updateTask;
  final DeleteTask _deleteTask;

  TaskBloc(
    this._getTasks,
    this._addTask,
    this._updateTask,
    this._deleteTask,
  ) : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    try {
      final tasks = await _getTasks();
      emit(TaskLoaded(tasks, 0)); // Update pendingSync from repo
    } catch (e) {
      emit(TaskError('Failed to load tasks'));
    }
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    await _addTask(event.title);
    add(LoadTasks());
  }

  Future<void> _onUpdateTask(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    await _updateTask(event.task);
    add(LoadTasks());
  }

  Future<void> _onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    await _deleteTask(event.id);
    add(LoadTasks());
  }
}
