import 'dart:convert';

import 'package:butler_chef/models/quantity_model.dart';

class MeasurementResponse {
  MeasurementResponse({
    required this.measurement,
    this.status,
  });

  List<MeasurementWithQuantities> measurement;
  int? status;

  // static MeasurementResponse welcomeFromJson(String str) =>
  //     MeasurementResponse.fromJson(json.decode(str));
  //
  // static String welcomeToJson(MeasurementResponse data) =>
  //     json.encode(data.toJson());

  factory MeasurementResponse.fromJson(Map<String, dynamic> json) => MeasurementResponse(
    measurement: List<MeasurementWithQuantities>.from(json["measurement"].map((x) => MeasurementWithQuantities.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "measurement": List<dynamic>.from(measurement.map((x) => x.toJson())),
    "status": status,
  };
}

class MeasurementWithQuantities {
  MeasurementWithQuantities({
    this.id,
    this.value,
    required this.quantities,
  });

  int? id;
  List<Quantity> quantities;
  String? value;

  factory MeasurementWithQuantities.fromJson(Map<String, dynamic> json) => MeasurementWithQuantities(
    id: json["id"],
    value: json["value"],
    quantities: List<Quantity>.from(json["quantities"].map((x) => Quantity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "quantities": List<dynamic>.from(quantities.map((x) => x.toJson())),
  };
}
