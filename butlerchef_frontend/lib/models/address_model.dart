import 'dart:convert';

class AddressResponse {
  AddressResponse({
    required this.data,
    required this.status,
  });

  List<Address> data;
  int status;

  static AddressResponse shopProductResponseFromJson(String str) =>
      AddressResponse.fromJson(json.decode(str));

  factory AddressResponse.fromJson(Map<String, dynamic> json) => AddressResponse(
    data: List<Address>.from(json["data"].map((x) => Address.fromJson(x))),
    status: json["status"],
  );

}

class Address {
  Address({
    this.id,
    this.title,
    this.user,
    this.street,
    this.city,
    this.phone,
  });

  int? id;
  String? title;
  _User? user;
  String? street;
  String? city;
  String? phone;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    title: json["title"],
    user: _User.fromJson(json["user"]),
    street: json["street"],
    city: json["city"],
    phone: json["phone"],
  );

}

class _User {
  _User({
    required this.id
  });

  int id;

  factory _User.fromJson(Map<String, dynamic> json) => _User(
      id: json["id"]
  );

}