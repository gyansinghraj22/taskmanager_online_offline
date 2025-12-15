// lib/presentation/bloc/task_state.dart
import 'package:equatable/equatable.dart';
import 'package:taskmanager/features/domain/entities/task.dart';

abstract class TaskState extends Equatable {
  const TaskState();
  @override List<Object> get props => [];
}

class TaskInitial extends TaskState {}
class TaskLoading extends TaskState {}
class TaskLoaded extends TaskState {
  final List<Task> tasks;
  final int pendingSync;
  const TaskLoaded(this.tasks, [this.pendingSync = 0]);
  @override List<Object> get props => [tasks, pendingSync];
}
class TaskError extends TaskState {
  final String message;
  const TaskError(this.message);
  @override List<Object> get props => [message];
}
