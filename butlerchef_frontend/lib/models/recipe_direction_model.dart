import 'dart:convert';
class RecipeDirectionResponse {
  RecipeDirectionResponse({
    required this.data,
    required this.status,
  });

  List<RecipeDirection> data;
  int status;

  static RecipeDirectionResponse welcomeFromJson(String str) =>
      RecipeDirectionResponse.fromJson(json.decode(str));

  static String welcomeToJson(RecipeDirectionResponse data) =>
      json.encode(data.toJson());

  factory RecipeDirectionResponse.fromJson(Map<String, dynamic> json) => RecipeDirectionResponse(
    data: List<RecipeDirection>.from(json["data"].map((x) => RecipeDirection.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status,
  };
}

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
