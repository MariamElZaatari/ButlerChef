import 'dart:convert';

import 'package:butler_chef/models/quantity_model.dart';
import 'package:butler_chef/models/measurement_model.dart';

class RecipeProductResponse {
  RecipeProductResponse({
    required this.data,
    required this.status,
  });

  List<RecipeProduct> data;
  int status;

  static RecipeProductResponse welcomeFromJson(String str) =>
      RecipeProductResponse.fromJson(json.decode(str));

  static String welcomeToJson(RecipeProductResponse data) =>
      json.encode(data.toJson());

  factory RecipeProductResponse.fromJson(Map<String, dynamic> json) => RecipeProductResponse(
    data: List<RecipeProduct>.from(json["data"].map((x) => RecipeProduct.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

class RecipeProduct {
  RecipeProduct({
    this.id,
    required this.quantity,
    required this.measurement,
    required this.name,
  });

  int? id;
  Quantity quantity;
  Measurement measurement;
  String name;


  factory RecipeProduct.fromJson(Map<String, dynamic> json) => RecipeProduct(
    id: json["id"],
    quantity: Quantity.fromJson(json["quantity"]),
    measurement: Measurement.fromJson(json["measurement"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity.toJson(),
    "measurement": measurement.toJson(),
    "name": name,
  };

}