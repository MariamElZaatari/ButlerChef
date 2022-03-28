import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/utils/app_url.dart';
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
}
