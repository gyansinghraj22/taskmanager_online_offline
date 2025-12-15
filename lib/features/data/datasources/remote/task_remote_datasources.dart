// lib/data/datasources/remote/task_remote_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanager/features/domain/entities/task.dart';

class TaskRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collection = 'tasks';

  Future<void> syncTask(Task task) async {
    await _firestore.collection(_collection).doc(task.id).set(task.toJson());
  }

  Future<void> deleteTask(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  Future<List<Task>> getRemoteTasks() async {
    final snapshot = await _firestore.collection(_collection).get();
    return snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList();
  }

  Stream<List<Task>> watchRemoteTasks() {
    return _firestore.collection(_collection).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Task.fromJson(doc.data())).toList());
  }
}
