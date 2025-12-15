// class Task {
//   final String id;
//   final String uid;
//   final String title;
//   final String description;
//   final String color;
//   final DateTime dueAt;
//   final bool isSynced;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Task({
//     required this.id,
//     required this.uid,
//     required this.title,
//     required this.description,
//     required this.color,
//     required this.dueAt,
//     required this.isSynced,
//     required this.createdAt,
//     required this.updatedAt,
//   });
// }
// lib/domain/entities/task.dart
class Task {
  final String id;
  final String title;
  final bool completed;
  final DateTime updatedAt;
  final bool isSynced;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
    required this.updatedAt,
    this.isSynced = false,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? updatedAt,
    bool? isSynced,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'completed': completed,
    'updatedAt': updatedAt.millisecondsSinceEpoch,
    'isSynced': isSynced,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    completed: json['completed'] ?? false,
    updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
    isSynced: json['isSynced'] ?? false,
  );
}
