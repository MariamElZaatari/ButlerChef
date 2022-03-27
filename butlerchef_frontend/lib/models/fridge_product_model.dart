import 'dart:convert';
import 'package:butler_chef/models/quantity_model.dart';
import 'package:butler_chef/models/measurement_model.dart';

FridgeProductResponse welcomeFromJson(String str) =>
    FridgeProductResponse.fromJson(json.decode(str));

class FridgeProductResponse {
  FridgeProductResponse({
    required this.data,
    required this.status,
  });

  List<FridgeProduct> data;
  int status;

  static FridgeProductResponse fridgeProductResponseFromJson(String str) =>
      FridgeProductResponse.fromJson(json.decode(str));

  factory FridgeProductResponse.fromJson(Map<String, dynamic> json) =>
      FridgeProductResponse(
        data: List<FridgeProduct>.from(
            json["data"].map((x) => FridgeProduct.fromJson(x))),
        status: json["status"],
      );
}

class FridgeProduct {
  FridgeProduct({
    required this.id,
    required this.user,
    required this.quantity,
    required this.measurement,
    required this.name,
  });

  int id;
  FridgeProductUser user;
  Quantity quantity;
  Measurement measurement;
  String name;

  factory FridgeProduct.fromJson(Map<String, dynamic> json) => FridgeProduct(
        id: json["id"],
        user: FridgeProductUser.fromJson(json["user"]),
        quantity: Quantity.fromJson(json["quantity"]),
        measurement: Measurement.fromJson(json["measurement"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "quantity": quantity.toJson(),
        "measurement": measurement.toJson(),
        "name": name,
      };
}

class FridgeProductUser {
  FridgeProductUser({
    required this.id,
  });

  int id;

  factory FridgeProductUser.fromJson(Map<String, dynamic> json) =>
      FridgeProductUser(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
