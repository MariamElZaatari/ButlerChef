import 'dart:convert';

import 'package:butler_chef/constants/app_url.dart';
import 'package:butler_chef/models/user_model.dart';
import 'package:http/http.dart';
import '../models/address_model.dart';
import '../utils/shared_preference.dart';

class AddressService {
  static Future<List<Address>> getUserAddresses() async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    Response response =
    await get(Uri.parse(AppUrl.getAddresses + loggedUserId.toString()));

    if (response.statusCode == 200) {
      return AddressResponse.shopProductResponseFromJson(response.body).data;
    }
    return [];
  }

  static Future<bool> createUserAddress(Address address) async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    final Map<String, dynamic> postAddress = {
      'user': User(id: loggedUserId),
      'title': address.title,
      'street': address.street,
      'city': address.city,
      'phone': address.phone,
    };

    Response response = await post(
      Uri.parse(AppUrl.createAddress),
      body: json.encode(postAddress),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> updateUserAddress(Address address) async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    final Map<String, dynamic> updatedAddress = {
      'id': address.id,
      'user': User(id: loggedUserId),
      'title': address.title,
      'street': address.street,
      'city': address.city,
      'phone': address.phone,
    };

    Response response = await patch(
      Uri.parse(AppUrl.updateAddress),
      body: json.encode(updatedAddress),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}