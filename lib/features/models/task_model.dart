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

//   // Convert Task to Map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'uid': uid,
//       'title': title,
//       'description': description,
//       'color': color,
//       'dueAt': dueAt.toIso8601String(),
//       'isSynced': isSynced ? 1 : 0,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }

//   // Convert Map to Task
//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task(
//       id: map['id'],
//       uid: map['uid'],
//       title: map['title'],
//       description: map['description'],
//       color: map['color'],
//       dueAt: DateTime.parse(map['dueAt']),
//       isSynced: map['isSynced'] == 1,
//       createdAt: DateTime.parse(map['createdAt']),
//       updatedAt: DateTime.parse(map['updatedAt']),
//     );
//   }
// }
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';


@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  bool completed;
  @HiveField(3)
  DateTime updatedAt;
  @HiveField(4)
  bool isSynced;

  Task({
    String? id,
    required this.title,
    this.completed = false,
    required this.updatedAt,
    this.isSynced = false,
  }) : id = id ?? Uuid().v4();

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
        completed: json['completed'],
        updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
        isSynced: json['isSynced'] ?? false,
      );
}
