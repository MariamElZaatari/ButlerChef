import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/screens/home_screen.dart';
import 'package:butler_chef/widgets/input.dart';
import 'package:butler_chef/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../constants/styles.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import 'package:butler_chef/providers/token_provider.dart';
import 'package:butler_chef/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

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
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // TokenProvider tokenProvider = Provider.of<TokenProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.logoBackground,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(21, 61, 21, 0),
                width: MediaQuery.of(context).size.width,
                height: 141,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 41, 0, 0),
                    child: Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    'You have been missed.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2),
                  )
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
                    ]))),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                        width: 295,
                        height: 89,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(21),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: AppColors.darkGreen,
                          ),
                          child: const Text(
                            "Log In",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2,
                                color: AppColors.white),
                          ),
                          onPressed: () {
                            AuthService.login(email, password)
                                .then((response) {
                              if (response['status']) {
                                User user = response['user'];
                                String token = response['token'];

                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .setUser(user);
                                Provider.of<TokenProvider>(context,
                                        listen: false)
                                    .setToken(token);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const HomeScreen();
                                    },
                                  ),
                                );
                              } else {
                                _showAlertDialog("Wrong Email or Password");
                              }
                            });
                          },
                        )),
                    SizedBox(
                        width: 295,
                        height: 41,
                        child: TextButton(
                          child: const Text(
                            "Don't have an account?",
                            textAlign: TextAlign.center,
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
                                  return const SignUpScreen();
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
}
