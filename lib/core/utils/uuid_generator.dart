import 'package:uuid/uuid.dart';

class UuidGenerator {
  final Uuid _uuid = Uuid();
  String generate() => _uuid.v4();
}
