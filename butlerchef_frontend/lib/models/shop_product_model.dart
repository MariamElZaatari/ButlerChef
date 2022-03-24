import 'dart:convert';

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
  int price;
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

class Measurement {
  int id;
  String value;

  Measurement({
    required this.id,
    required this.value,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    value: json["value"],
  );

}

class Quantity {
  int id;
  String value;

  Quantity({
    required this.id,
    required this.value,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
    id: json["id"],
    value: json["value"],
  );

}