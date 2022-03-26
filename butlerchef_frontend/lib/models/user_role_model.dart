class UserRole {
  UserRole({
    required this.id,
    required this.role,
  });

  int id;
  String role;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
    id: json["id"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
  };
}