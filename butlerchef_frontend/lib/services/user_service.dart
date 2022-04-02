import 'dart:convert';

import 'package:http/http.dart';

import '../constants/app_url.dart';
import '../models/user_model.dart';
import '../utils/shared_preference.dart';

class UserService{

  static Future<User> updateName(String name) async {
    int? loggedUserId = (await UserPreferences().getUser()).id;

    Response response = await patch(
        Uri.parse(AppUrl.updateUserName + loggedUserId.toString()+"/"+name));

    if (response.statusCode == 200) {
      User newUser =
      User.fromJson(json.decode(response.body));
      return newUser;
    }
    return User();
  }
}