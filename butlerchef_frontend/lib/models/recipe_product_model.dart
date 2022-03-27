import 'package:butler_chef/models/quantity_model.dart';
import 'package:butler_chef/models/measurement_model.dart';

class RecipeProduct {
  RecipeProduct({
    required this.id,
    required this.quantity,
    required this.measurement,
    required this.name,
  });

  int id;
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