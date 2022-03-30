import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';
import '../models/recipe_product_model.dart';

class RecipeProductService {
  static Future<List<RecipeProduct>> getProductsByRecipeID(int id) async {
    Response response = await get(Uri.parse(AppUrl.getProductsByRecipeId + id.toString()));

    if (response.statusCode == 200) {
      List<RecipeProduct> products =
          RecipeProductResponse.welcomeFromJson(response.body).data;

      return products;
    }
    return [];
  }
}