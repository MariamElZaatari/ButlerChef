class AppUrl {

  static const String baseUrl = 'http://10.0.2.2:8080/api';

  static const String login = baseUrl + '/auth/login';
  static const String register = baseUrl + '/auth/register';

  static const String recipesByUserId = baseUrl + '/recipe/';
  static const String createRecipes = baseUrl + '/recipe/create';
  static const String favoriteRecipesByUserId = baseUrl + '/favorite/read/';
  static const String cookedRecipesByUserId = baseUrl + '/cooked/read/';
  static const String fridgeProductByUserId = baseUrl + '/fridgeProduct/';
  static const String createFridgeProduct = baseUrl + '/fridgeProduct/create/';


}