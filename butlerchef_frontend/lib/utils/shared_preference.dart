import 'package:butler_chef/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  Future<bool> saveUser(User user, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId',user.id);
    prefs.setString('firstName',user.firstName);
    prefs.setString('lastName',user.lastName);
    prefs.setString('email',user.email);
    prefs.setString('imageUrl',user.imageUrl);
    prefs.setString('token',token);

    return prefs.commit();

  }

  Future<User> getUser ()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt("userId");
    String? firstName = prefs.getString("firstName");
    String? lastName = prefs.getString("lastName");
    String? email = prefs.getString("email");
    String? imageUrl = prefs.getString("imageUrl");

    userId ??= 0;
    firstName ??= 'none';
    lastName ??= 'none';
    email ??= 'none';
    imageUrl ??= 'none';

    return User(
      id: userId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      imageUrl: imageUrl,
    );

  }

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('email');
    prefs.remove('imageUrl');
    prefs.remove('token');

  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

}