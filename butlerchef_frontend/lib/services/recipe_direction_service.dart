import 'package:butler_chef/models/recipe_direction_model.dart';
import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';

class RecipeDirectionService {
  static Future<List<RecipeDirection>> getDirectionsByRecipeID(int id) async {
    Response response = await get(Uri.parse(AppUrl.getDirectionsByRecipeId + id.toString()));

    if (response.statusCode == 200) {
      List<RecipeDirection> directions =
          RecipeDirectionResponse.welcomeFromJson(response.body).data;

      return directions;
    }
    return [];
  }
}