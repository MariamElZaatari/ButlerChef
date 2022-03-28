import 'package:butler_chef/models/user_model.dart';
import 'package:butler_chef/utils/app_url.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../utils/shared_preference.dart';

class AuthService {

  static Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, Object> result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      var userData = responseData['user'];
      var token = responseData['token'];

      User user = User.fromJson(userData);

      UserPreferences().saveUser(user, token);

      result = {'status': true, 'message': 'Successful', 'user': user, 'token': token};
    }
    else {
      result = {'status': false, 'message': 'Failed'};
    }

    return result;
  }

  static Future<Map<String, dynamic>> register(
      String email,
      String password,
      String repeatPassword,
      String firstName,
      String lastName,
      ) async {

    Map<String, Object> result;

    // if the password does not match, return failed with status false and a message.
    if(password != repeatPassword){
      return {'status': false, 'message': 'Password does not match'};
    }

    // fill the data inside am object to be send to the backend.
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'imageUrl': "",
      "userRole": {"id":2}
    };

    // send the loginData obj to the register api.
    Response response = await post(
      Uri.parse(AppUrl.register),
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // if the response came successfully.
    if (response.statusCode == 200) {
      // decode the response to a Map of key: String, value: Object.
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      result = { 'status': true, 'message': responseData['message'] };
    }
    else {
      result = { 'status': false, 'message': 'Failed' };
    }

    return result;
  }

}