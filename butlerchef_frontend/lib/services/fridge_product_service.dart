import 'package:butler_chef/models/measurement_model.dart';
import 'package:butler_chef/models/quantity_model.dart';
import 'package:butler_chef/utils/app_url.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../utils/shared_preference.dart';
import '../models/fridge_product_model.dart';


class FridgeProductService {

  static Future<List<FridgeProduct>> fetchFridgeProductByUserId(int id) async {

    Response response =
    await get(Uri.parse(AppUrl.fridgeProductByUserId + id.toString()));

    if (response.statusCode == 200) {

      FridgeProductResponse res = FridgeProductResponse.fridgeProductResponseFromJson(response.body);

      List<FridgeProduct> products = res.data;

      return products;
    }

    return [];
  }



  static Future<bool> createFridgeProduct(
      int quantityId,
      String quantityValue,
      int measurementId,
      String measurementValue,
      String name
      ) async {

    int? userId = (await UserPreferences().getUser()).id;

    final Map<String, dynamic> fridgeProduct = {
      'user': FridgeProductUser(id: userId ?? 0),
      'quantity': Quantity(id: quantityId, value: quantityValue).toJson(),
      'measurement': Measurement(id: measurementId, value: measurementValue).toJson(),
      'name': name
    };

    Response response = await post(
      Uri.parse(AppUrl.createFridgeProduct),
      body: json.encode(fridgeProduct),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }



}