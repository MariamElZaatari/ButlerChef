import 'package:butler_chef/models/measurement_quantity_model.dart';

class Measurement {
  int? id;
  String? value;

  Measurement({
    required this.id,
    required this.value,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };

  factory Measurement.fromMeasurementWithQuantity(
      MeasurementWithQuantities? measurementWithQuantity)  => Measurement(
    id: measurementWithQuantity?.id,
    value: measurementWithQuantity?.value,
  );
}
