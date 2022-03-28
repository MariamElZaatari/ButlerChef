import 'dart:convert';
import 'package:butler_chef/models/recipe_model.dart';

class CookedRecipeModel {
  CookedRecipeModel({
    required this.id,
    required this.user,
    required this.recipe,

  });

  int id;
  int user;
  RecipeModel recipe;

  static List<CookedRecipeModel> cookedRecipeModelFromJson(String str) =>
      List<CookedRecipeModel>.from(json.decode(str).map((x) => CookedRecipeModel.fromJson(x)));

  static String cookedRecipeModelToJson(List<CookedRecipeModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory CookedRecipeModel.fromJson(Map<String, dynamic> json) => CookedRecipeModel(
    id: json["id"],
    user: json["user"],
    recipe: RecipeModel.fromJson(json["recipe"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "recipe": recipe.toJson(),
  };
}