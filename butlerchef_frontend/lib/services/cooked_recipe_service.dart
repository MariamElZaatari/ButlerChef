import 'dart:convert';

import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';
import '../models/recipe_model.dart';
import '../utils/shared_preference.dart';

class CookedRecipeService {
  static Future<List<RecipeCardModel>> getCookedRecipesByUserId(
      {int? id}) async {
    // if id is not given, then take the logged user Id.
    id ??= (await UserPreferences().getUser()).id;

    Response response =
    await get(Uri.parse(AppUrl.getCookedRecipesByUserId + id.toString()));

    if (response.statusCode == 200) {
      List<RecipeCardModel> recipesCards =
      RecipeCardModel.welcomeFromJson(response.body);

      return recipesCards;
    }
    return [];
  }

  static Future<bool> createCookedByRecipeId(int recipeId) async {
    int? id = (await UserPreferences().getUser()).id ?? 0;

    final Map<String, int> data = {'userId': id, 'recipeId': recipeId};

    Response response = await post(
      Uri.parse(AppUrl.createCooked),
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

  static Future<bool> deleteCookedById(int recipeId) async {
    Response response =
    await get(Uri.parse(AppUrl.deleteCooked + recipeId.toString()));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}