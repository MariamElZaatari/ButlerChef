import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/input.dart';
import 'package:butler_chef/screens/login_screen.dart';
import '../constants/styles.dart';
import '../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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

  void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.red,
          title: Text(
            message,
            style: ThemeText.errorMessage,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.logoBackground,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
        child: ListView(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(21, 0, 21, 0),
                width: MediaQuery.of(context).size.width,
                height: 141,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 41, 0, 0),
                    child: Text(
                      "Let's Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.black,
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
                            color: AppColors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2),
                      )),
                ])),
            Expanded(
                flex: 2,
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                  Input(
                    value: "Email",
                    callback: setEmail,
                    isPassword: false,
                  ),
                  Input(
                    value: "Password",
                    callback: setPassword,
                    isPassword: true,
                  ),
                  Input(
                    value: "Repeat Password",
                    callback: setRepeatPassword,
                    isPassword: true,
                    password:password,
                  ),
                  Input(
                    value: "First Name",
                    callback: setFirstName,
                    isPassword: false,
                  ),
                  Input(
                    value: "Last Name",
                    callback: setLastName,
                    isPassword: false,
                  ),
                ]))),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                        width: 295,
                        height: 89,
                        margin: const EdgeInsets.fromLTRB(0, 41, 0, 0),
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
                              if (_formKey.currentState!.validate()) {
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                    builder: (context) {
//                                      return const LoginScreen();
//                                    },
//                                  ),
//                                );


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
                              _showAlertDialog("Failed to Create a User");
                                    }

                                  });}
                            })),
                    SizedBox(
                        width: 295,
                        height: 41,
                        child: TextButton(
                          child: const Text(
                            "Already have an account?",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black),
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
        ),
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
