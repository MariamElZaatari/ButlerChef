class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.email = "",
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
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