import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../models/measurement_model.dart';
import '../models/quantity_model.dart';
import '../models/recipe_direction_model.dart';
import '../models/recipe_product_model.dart';
import '../utils/shared_preference.dart';

class RecipeService {

  static Future<List<RecipeCardModel>> getAllRecipes() async {

    int? loggedUserId = (await UserPreferences().getUser()).id;

    Response response =
    await get(Uri.parse(AppUrl.getAllRecipesByUserId + loggedUserId.toString()));

    if (response.statusCode == 200) {

      List<RecipeCardModel> recipesCards =
      RecipeCardModel.welcomeFromJson(response.body);

      // print(recipesCards);
      return recipesCards;
    }
    return [];
  }

  static Future<bool> createRecipe(
      // RecipeModel recipe,
      // List<RecipeProduct> products,
      // List<RecipeDirection> directions,
      ) async {

    int? userId = (await UserPreferences().getUser()).id;

    RecipeModel recipe = RecipeModel(
        name: "Eggs",
        level: "hard",
        time: "15 min",
        serving: "5 srv",
        visibility: 1);

    List<RecipeProduct> products = <RecipeProduct>[
      RecipeProduct(
        quantity: Quantity(id: 1, value: "4"),
        measurement: Measurement(id: 1, value: "4"),
        name: "mele7",
      ),
      RecipeProduct(
        quantity: Quantity(id: 1, value: "4"),
        measurement: Measurement(id: 1, value: "4"),
        name: "bhar",
      ),
    ];


    List<RecipeDirection> directions = <RecipeDirection>[
      RecipeDirection(title: "step 1", content: "prepare everything"),
      RecipeDirection(title: "step 2", content: "cook cook"),
    ];


    final Map<String, dynamic> fridgeProduct = {
      'userId': userId,
      'recipe': json.encode(recipe),
      'products': json.encode(products),
      'directions': json.encode(directions),
    };

    Response response = await post(
      Uri.parse(AppUrl.createRecipes),
      body: json.encode(fridgeProduct),
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