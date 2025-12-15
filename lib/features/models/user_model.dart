
// class User {
//   final String id;
//   final String username;
//   final String email;
//   final String password;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.password,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   // Convert User to Map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'username': username,
//       'email': email,
//       'password': password,
//       'createdAt': createdAt.toIso8601String(),
//       'updatedAt': updatedAt.toIso8601String(),
//     };
//   }

//   // Convert Map to User
//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['id'],
//       username: map['username'],
//       email: map['email'],
//       password: map['password'],
//       createdAt: DateTime.parse(map['createdAt']),
//       updatedAt: DateTime.parse(map['updatedAt']),
//     );
//   }
// }