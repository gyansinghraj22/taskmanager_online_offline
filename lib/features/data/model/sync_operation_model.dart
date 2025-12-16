// import 'package:hive/hive.dart';

// part 'sync_operation_model.g.dart';

// /// Represents a queued offline operation that must be synced
// /// with the remote backend once connectivity is available.
// ///
// /// type:
// ///   - create
// ///   - update
// ///   - delete
// @HiveType(typeId: 1)
// class SyncOperationModel extends HiveObject {
//   /// Unique ID for this sync operation (Hive key may differ)
//   @HiveField(0)
//   final String id;

//   /// Operation type: create | update | delete
//   @HiveField(1)
//   final String type;

//   /// Target task ID
//   @HiveField(2)
//   final String taskId;

//   /// Optional fields (used for create/update)
//   @HiveField(3)
//   final String? title;

//   @HiveField(4)
//   final bool? completed;

//   @HiveField(5)
//   final int? updatedAt;

//   @HiveField(6)
//   final bool? isSynced;

//   /// When this operation was queued (millisecondsSinceEpoch)
//   @HiveField(7)
//   final int timestamp;

//   SyncOperationModel({
//     required this.id,
//     required this.type,
//     required this.taskId,
//     this.title,
//     this.completed,
//     this.updatedAt,
//     this.isSynced,
//     required this.timestamp,
//   });
// }
