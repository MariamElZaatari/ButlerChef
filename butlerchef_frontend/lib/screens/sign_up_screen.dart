import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/screens/home_screen.dart';
import 'package:butler_chef/widgets/input.dart';
import 'package:butler_chef/screens/login_screen.dart';
import '../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  String email = "";
  String password = "";
  String repeatPassword = "";
  String firstName = "";
  String lastName = "";

  setEmail(newEmail) {
    setState(() {
      email = newEmail;
    });
  }

  setPassword(newPassword) {
    setState(() {
      password = newPassword;
    });
  }

  setRepeatPassword(newRepeatPassword) {
    setState(() {
      repeatPassword = newRepeatPassword;
    });
  }

  setFirstName(newFirstName) {
    setState(() {
      firstName = newFirstName;
    });
  }

  setLastName(newLastName) {
    setState(() {
      lastName = newLastName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
          child: ListView(
            children: [
              const Expanded(
                  flex: 1,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 61, 0, 0),
                      child: Text(
                        'ButlerChef',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 18),
                      ))),
              Expanded(
                  flex: 1,
                  child: Column(children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 41, 0, 0),
                      child: Text(
                        "Let's Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 41),
                        child: Text(
                          'You are one click away from joining our food lovers community.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2),
                        )),
                  ])),
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    Input(value: "Email", callback: setEmail),
                    Input(value: "Password", callback: setPassword),
                    Input(value: "Repeat Password", callback: setRepeatPassword),
                    Input(value: "First Name", callback: setFirstName),
                    Input(value: "Last Name", callback: setLastName),
                  ])),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                          width: 295,
                          height: 89,
                          margin: const EdgeInsets.fromLTRB(0, 26, 0, 0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(21),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                backgroundColor: AppColors.darkGreen,
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 2,
                                    color: AppColors.white),
                              ),
                              onPressed: () {

                                AuthService.register(email, password, repeatPassword, firstName, lastName).then((response) {

                                  if (response['status']) {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const LoginScreen();
                                        },
                                      ),
                                    );

                                  }
                                  else {
                                    print("Failed to Create a User");
                                  }

                                });

                              }
                          )),
                      SizedBox(
                          width: 295,
                          height: 41,
                          child: TextButton(
                            child: const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                            onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ),
                            )
                            },
                          )),
                    ],
                  ))
            ],
          )),
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