import 'dart:convert';

import 'package:butler_chef/models/user_model.dart';

class RecipeCardModel {
  RecipeCardModel({
    this.total,
    this.recipe,
    this.favorite,
    this.fridge,
    this.cooked,
  });

  int? total;
  RecipeModel? recipe;
  int? favorite;
  int? fridge;
  int? cooked;

  static List<RecipeCardModel> welcomeFromJson(String str) =>
      List<RecipeCardModel>.from(
          json.decode(str).map((x) => RecipeCardModel.fromJson(x)));

  static String welcomeToJson(List<RecipeCardModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory RecipeCardModel.fromJson(Map<String, dynamic> json) =>
      RecipeCardModel(
        total: json["total"],
        recipe: RecipeModel.fromJson(json["recipe"]),
        favorite: json["favorite"],
        fridge: json["fridge"],
        cooked: json["cooked"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "recipe": recipe?.toJson(),
        "favorite": favorite,
        "fridge": fridge,
        "cooked": cooked,
      };
}

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

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        name: json["name"],
        rate: json["rate"],
        level: json["level"],
        time: json["time"],
        serving: json["serving"],
        imageUrl: json["imageUrl"],
        visibility: json["visibility"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "name": name,
        "rate": rate,
        "level": level,
        "time": time,
        "serving": serving,
        "imageUrl": imageUrl,
        "visibility": visibility,
      };
}
