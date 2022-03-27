import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/utils/app_url.dart';
import 'package:http/http.dart';



class RecipeService {

  static Future<List<RecipeModel>> fetchRecipesByUserId(int id) async {
    Map<String, Object> result;

    Response response =
    await get(Uri.parse(AppUrl.recipesByUserId + id.toString()));

    print(response.body);
    if (response.statusCode == 200) {

      List<RecipeModel> recipes = RecipeModel.fromJsonList(response.body);

      return recipes;
    }

    return [];
  }

}