import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/models/favorite_recipe_model.dart';
import 'package:butler_chef/utils/app_url.dart';
import 'package:http/http.dart';
import 'dart:convert';


class FavoriteRecipeService {

  static Future<List<FavoriteRecipeModel>> fetchFavoriteRecipesByUserId(int id) async {

    Response response =
    await get(Uri.parse(AppUrl.favoriteRecipesByUserId + id.toString()));

    if (response.statusCode == 200) {

      List<FavoriteRecipeModel> recipes = FavoriteRecipeModel.favoriteRecipeModelFromJson(response.body);

      // print("element Service");
      // print(recipes[0].recipe.user?.firstName);
      // print(recipes[1].recipe.user?.firstName);

      return recipes;
    }

    return [];
  }




}