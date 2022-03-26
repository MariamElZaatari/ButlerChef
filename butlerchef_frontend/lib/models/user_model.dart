import 'package:butler_chef/models/user_role_model.dart';

class User {
  User({
    required this.id,
    required this.email,
    // required this.password,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.userRole,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String email;
  // String password;
  String firstName;
  String lastName;
  String imageUrl;
  UserRole userRole;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    // password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    imageUrl: json["imageUrl"],
    userRole: UserRole.fromJson(json["userRole"]),
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    // "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "imageUrl": imageUrl,
    "userRole": userRole.toJson(),
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
  };
}