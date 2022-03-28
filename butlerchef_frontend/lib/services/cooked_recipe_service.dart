import 'package:butler_chef/utils/app_url.dart';
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
}