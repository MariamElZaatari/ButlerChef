import 'package:butler_chef/models/cooked_recipe_model.dart';
import 'package:butler_chef/utils/app_url.dart';
import 'package:http/http.dart';


class CookedRecipeService {

  static Future<List<CookedRecipeModel>> fetchCookedRecipesByUserId(int id) async {

    Response response =
    await get(Uri.parse(AppUrl.cookedRecipesByUserId + id.toString()));


    if (response.statusCode == 200) {

      List<CookedRecipeModel> recipes = CookedRecipeModel.cookedRecipeModelFromJson(response.body);

      // print("element Service");
      // print(recipes[0].recipe.user.firstName);
      // print(recipes[1].recipe.user.firstName);

      return recipes;
    }

    return [];
  }

}