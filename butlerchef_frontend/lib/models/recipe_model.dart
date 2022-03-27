import 'dart:convert';

import 'package:butler_chef/models/user_model.dart';

class RecipeModel {
  RecipeModel({
    required this.id,
    required this.name,
    required this.rate,
    required this.level,
    required this.time,
    required this.user,
    required this.serving,
    required this.imageUrl,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  double rate;
  String level;
  String time;
  String serving;
  String imageUrl;
  int visibility;
  User user;
  DateTime createdAt;
  DateTime updatedAt;

  static List<RecipeModel> fromJsonList(String str) =>
      List<RecipeModel>.from(json.decode(str).map((x) => RecipeModel.fromJson(x)));

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    id: json["id"],
    name: json["name"],
    rate: json["rate"],
    level: json["level"],
    time: json["time"],
    serving: json["serving"],
    imageUrl: json["imageUrl"],
    visibility: json["visibility"],
    user: User.fromJson(json["user"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "rate": rate,
    "level": level,
    "time": time,
    "serving": serving,
    "imageUrl": imageUrl,
    "visibility": visibility,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}