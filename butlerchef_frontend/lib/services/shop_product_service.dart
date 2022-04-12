import 'dart:convert';
import 'package:butler_chef/constants/app_url.dart';
import 'package:http/http.dart';
import '../models/shop_product_model.dart';

class ShopProductService {
  static Future<List<ShopProductModel>> getShopProducts() async {
  Response response = await get(Uri.parse(AppUrl.getShopProducts));

  if (response.statusCode == 200) {
  List<ShopProductModel> products =
  ShopProductResponse.fromJson(jsonDecode(response.body)).data;

  return products;
  }
  return [];
}
}