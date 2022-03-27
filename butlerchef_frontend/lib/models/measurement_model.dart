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

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
