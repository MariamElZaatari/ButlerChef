class AppUrl {

  static const String baseUrl = 'http://10.0.2.2:8080/api';
  static const String login = baseUrl + '/auth/login';
  static const String register = baseUrl + '/auth/register';

  static const String recipesByUserId = baseUrl + '/recipe/';
  static const String createRecipes = baseUrl + '/recipe/create';
  static const String fridgeProductByUserId = baseUrl + '/fridgeProduct/';
  static const String createFridgeProduct = baseUrl + '/fridgeProduct/create/';

  static const String getMeasurements = baseUrl + '/measurement/';
  static const String getAllRecipesByUserId = baseUrl + '/recipe/display/';
  static const String getAllRecipesForLoggedUserId = baseUrl + '/recipe/display/profile/';
  static const String getAllRecipesByRecipeName = baseUrl + '/recipe/search/';
  static const String getProductsByRecipeId = baseUrl + '/recipeProduct/';
  static const String getDirectionsByRecipeId = baseUrl + '/recipeDirection/';

  static const String favoriteRecipesByUserId = baseUrl + '/favorite/read/';
  static const String getFavoriteRecipesByUserId = baseUrl + '/recipe/display/favorite/';
  static const String createFavorite = baseUrl + '/favorite/create';
  static const String deleteFavorite = baseUrl + '/favorite/delete/';


  static const String getCookedRecipesByUserId = baseUrl + '/recipe/display/cooked/';
  static const String cookedRecipesByUserId = baseUrl + '/cooked/read/';
  static const String createCooked = baseUrl + '/cooked/create';
  static const String deleteCooked = baseUrl + '/cooked/delete/';

  static const String updateUserName = baseUrl + '/user/update/name/';
  static const String updateUserImage = baseUrl + '/user/update/image/';

  static const String getAddresses = baseUrl + '/address/';
  static const String createAddress = baseUrl + '/address/create';
  static const String updateAddress = baseUrl + '/address/update';
}