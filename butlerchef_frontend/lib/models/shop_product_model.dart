import 'dart:convert';

import 'package:butler_chef/models/quantity_model.dart';
import 'package:butler_chef/models/measurement_model.dart';

ShopProductResponse shopProductResponseFromJson(String str) => ShopProductResponse.fromJson(json.decode(str));

class ShopProductResponse {
  ShopProductResponse({
    required this.data,
    required this.status,
  });

  List<ShopProductModel> data;
  int status;

  factory ShopProductResponse.fromJson(Map<String, dynamic> json) => ShopProductResponse(
    data: List<ShopProductModel>.from(json["data"].map((x) => ShopProductModel.fromJson(x))),
    status: json["status"],
  );

}

class ShopProductModel {
  ShopProductModel({
    required this.id,
    required this.quantity,
    required this.measurement,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  Quantity quantity;
  Measurement measurement;
  String name;
  double price;
  String imageUrl;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;

  factory ShopProductModel.fromJson(Map<String, dynamic> json) => ShopProductModel(
    id: json["id"],
    quantity: Quantity.fromJson(json["quantity"]),
    measurement: Measurement.fromJson(json["measurement"]),
    name: json["name"],
    price: json["price"],
    imageUrl: json["imageUrl"],
    stock: json["stock"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

}