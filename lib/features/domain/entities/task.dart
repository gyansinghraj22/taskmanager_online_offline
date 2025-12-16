// domain/entities/task_entity.dart
class TaskEntity {
  final String id;
  final String title;
  final bool isCompleted;
  final bool isSynced;
  final String description;

  TaskEntity({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.isSynced,
    required this.description,
  });

  // Method to easily create an updated copy
  TaskEntity copyWith({
    String? id,
    String? title,
    bool? isCompleted,
    bool? isSynced,
    String? description,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      isSynced: isSynced ?? this.isSynced,
      description: description ?? this.description,
    );
  }
}
