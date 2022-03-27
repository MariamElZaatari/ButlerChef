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

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
