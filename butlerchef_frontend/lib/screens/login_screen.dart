import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';
import 'package:butler_chef/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(35),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColors.red,
          ),
          child: const Text(
            "LOGIN",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
                color: AppColors.white),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            )
          },
        ),
      ),
    );
  }
//
//  Widget loginButton() {
//    return ;
//  }

//  void performLogin() {
//    print("tring to perform login");
//
//    setState(() {
//      isLoginPressed = true;
//    });
//
//    _authMethods.signIn().then((User user) {
//      if (user != null) {
//        authenticateUser(user);
//      } else {
//        print("There was an error");
//      }
//    });
//  }

//  void authenticateUser(User user) {
//    _authMethods.authenticateUser(user).then((isNewUser) {
//      setState(() {
//        isLoginPressed = false;
//      });
//
//      if (isNewUser) {
//        _authMethods.addDataToDb(user).then((value) {
//          Navigator.pushReplacement(context,
//              MaterialPageRoute(builder: (context) {
//                return HomeScreen();
//              }));
//        });
//      } else {
//        Navigator.pushReplacement(context,
//            MaterialPageRoute(builder: (context) {
//              return HomeScreen();
//            }));
//      }
//    });
//  }
}
