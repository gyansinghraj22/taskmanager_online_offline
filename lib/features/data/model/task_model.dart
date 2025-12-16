import 'package:hive/hive.dart';
import 'package:taskmanager/features/domain/entities/task.dart';
// Note: Ensure this path is correct for your project structure

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  bool isCompleted; // Renamed from 'completed' to match entity
  @HiveField(3)
  DateTime updatedAt; // Crucial for sync logic
  @HiveField(4)
  bool isSynced;
  @HiveField(5)
  String description;

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.updatedAt,
    required this.isSynced,
    required this.description,
  });

  /// Converts the Data Layer Model to the Domain Layer Entity
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
      isSynced: isSynced,
      description: description,
    );
  }

  /// Creates a Data Layer Model from the Domain Layer Entity
  static TaskModel fromEntity(TaskEntity task) {
    // When creating the model from the entity, we must supply the
    // missing updatedAt field. If this model is for a brand new task,
    // we use DateTime.now().
    return TaskModel(
      id: task.id,
      title: task.title,
      isCompleted: task.isCompleted,
      // You must decide where 'updatedAt' gets its initial value.
      // Often, this is set upon creation/update in the Use Case or Repository.
      // For simplicity here, we initialize it on conversion.
      updatedAt: DateTime.now(),
      isSynced: task.isSynced,
      description: task.description,
    );
  }
}
