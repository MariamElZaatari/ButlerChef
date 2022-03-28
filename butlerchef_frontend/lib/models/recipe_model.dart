import 'dart:convert';

import 'package:butler_chef/models/user_model.dart';

class RecipeModel {
  RecipeModel({
    this.id,
    this.name,
    this.rate,
    this.level,
    this.time,
    this.user,
    this.serving,
    this.imageUrl,
    this.visibility,
  });

  int? id;
  String? name;
  double? rate;
  String? level;
  String? time;
  String? serving;
  String? imageUrl;
  int? visibility;
  User? user;

  static List<RecipeModel> fromJsonList(String str) => List<RecipeModel>.from(
      json.decode(str).map((x) => RecipeModel.fromJson(x)));

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
      };
}
