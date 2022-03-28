import 'dart:convert';

class RecipeDirection {
  RecipeDirection({
    this.id,
    this.recipe,
    required this.title,
    required this.content,
  });

  int? id;
  _Recipe? recipe;
  String title;
  String content;

  static String recipeProductToJson(RecipeDirection data) =>
      json.encode(data.toJson());

  static RecipeDirection recipeProductFromJson(String str) =>
      RecipeDirection.fromJson(json.decode(str));

  factory RecipeDirection.fromJson(Map<String, dynamic> json) =>
      RecipeDirection(
        id: json["id"],
        recipe: _Recipe.fromJson(json["recipe"]),
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipe": recipe?.toJson(),
        "title": title,
        "content": content,
      };
}

class _Recipe {
  _Recipe({
    this.id,
  });

  int? id;

  factory _Recipe.fromJson(Map<String, dynamic> json) => _Recipe(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
