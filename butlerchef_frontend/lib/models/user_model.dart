class User {
  User({
    required this.id,
    // required this.password,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    this.email = "",
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    // password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "imageUrl": imageUrl,
  };
}