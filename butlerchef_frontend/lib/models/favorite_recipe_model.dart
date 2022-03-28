import 'dart:convert';
import 'package:butler_chef/models/recipe_model.dart';

class FavoriteRecipeModel {
  FavoriteRecipeModel({
    required this.id,
    required this.user,
    required this.recipe,

  });

  int id;
  int user;
  RecipeModel recipe;

  static List<FavoriteRecipeModel> favoriteRecipeModelFromJson(String str) =>
      List<FavoriteRecipeModel>.from(json.decode(str).map((x) => FavoriteRecipeModel.fromJson(x)));

  static String favoriteRecipeModelToJson(List<FavoriteRecipeModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory FavoriteRecipeModel.fromJson(Map<String, dynamic> json) => FavoriteRecipeModel(
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