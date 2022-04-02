import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../models/recipe_direction_model.dart';
import '../models/recipe_product_model.dart';
import '../utils/shared_preference.dart';

class RecipeService {
  static Future<List<RecipeCardModel>> getAllRecipes() async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    Response response = await get(
        Uri.parse(AppUrl.getAllRecipesByUserId + loggedUserId.toString()));

    if (response.statusCode == 200) {
      List<RecipeCardModel> recipesCards =
          RecipeCardModel.welcomeFromJson(response.body);
      return recipesCards;
    }
    return [];
  }

  static Future<List<RecipeCardModel>> getRecipesForLoggedUser() async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    Response response = await get(
        Uri.parse(AppUrl.getAllRecipesForLoggedUserId + loggedUserId.toString()));

    if (response.statusCode == 200) {
      List<RecipeCardModel> recipesCards =
      RecipeCardModel.welcomeFromJson(response.body);
      return recipesCards;
    }

    return [];
  }

  static Future<List<RecipeCardModel>> getRecipesByRecipeName(String recipeName) async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    Response response = await get(
        Uri.parse(AppUrl.getAllRecipesByRecipeName + loggedUserId.toString()+"/"+recipeName));

    if (response.statusCode == 200) {
      List<RecipeCardModel> recipesCards =
      RecipeCardModel.welcomeFromJson(response.body);
      return recipesCards;
    }
    return [];
  }

  static Future<bool> createRecipe(
    RecipeModel? recipe,
    List<RecipeProduct>? products,
    List<RecipeDirection>? directions,
  ) async {
    recipe?.user = await UserPreferences().getUser();

    final Map<String, dynamic> recipeCard = {
      'recipe': recipe,
      'products': products,
      'directions': directions,
    };

    Response response = await post(
      Uri.parse(AppUrl.createRecipes),
      body: json.encode(recipeCard),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
