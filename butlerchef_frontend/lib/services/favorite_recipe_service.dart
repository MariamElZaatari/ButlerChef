import 'dart:convert';

import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';
import '../utils/shared_preference.dart';

class FavoriteRecipeService {
  static Future<List<RecipeCardModel>> getFavoriteRecipesByUserId() async {
    // if id is not given, then take the logged user Id.
    int? id = (await UserPreferences().getUser()).id;

    Response response =
    await get(Uri.parse(AppUrl.getFavoriteRecipesByUserId + id.toString()));

    if (response.statusCode == 200) {
      List<RecipeCardModel> recipesCards =
      RecipeCardModel.welcomeFromJson(response.body);

      print(recipesCards);
      return recipesCards;
    }
    return [];
  }

  static Future<bool> createFavoriteByRecipeId(int? recipeId) async {
    int? id = (await UserPreferences().getUser()).id ?? 0;

    final Map<String, int?> data = {'userId': id, 'recipeId': recipeId};

    Response response = await post(
      Uri.parse(AppUrl.createFavorite),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteFavoriteById(int? recipeId) async {
    Response response =
    await get(Uri.parse(AppUrl.deleteFavorite + recipeId.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
