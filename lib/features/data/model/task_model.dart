import 'package:hive/hive.dart';
import 'package:taskmanager/features/domain/entities/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool completed;

  @HiveField(3)
  int updatedAt;

  @HiveField(4)
  bool isSynced;

  TaskModel({
    required this.id,
    required this.title,
    required this.completed,
    required this.updatedAt,
    required this.isSynced,
  });

  Task toDomain() => Task(
        id: id,
        title: title,
        completed: completed,
        updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
        isSynced: isSynced,
      );

  static TaskModel fromDomain(Task task) => TaskModel(
        id: task.id,
        title: task.title,
        completed: task.completed,
        updatedAt: task.updatedAt.millisecondsSinceEpoch,
        isSynced: task.isSynced,
      );
}
