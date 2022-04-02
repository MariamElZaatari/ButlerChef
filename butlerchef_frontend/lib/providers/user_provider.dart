import 'package:butler_chef/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{

  static User _user = User(
    id: -1,
    email: 'none',
    firstName: 'none',
    lastName: 'none',
    imageUrl: 'none',
  );

  User get user => _user;

  void setUser (User user){
    _user = user;
    notifyListeners();
  }

}