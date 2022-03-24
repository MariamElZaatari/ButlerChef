import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';
import 'package:butler_chef/screens/home_screen.dart';
import 'package:butler_chef/widgets/input.dart';
import 'package:butler_chef/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
          child: Column(
        children: [
          const Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 81, 0, 0),
                  child: Text(
                    'ButlerChef',
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
                    'Welcome Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                  ),
                ),
                Text(
                  'You have been missed.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                )
              ])),
          Expanded(
              flex: 2,
              child: Column(children: const [
                Input(value: "Email"),
                Input(value: "Password"),
              ])),
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
                          backgroundColor: AppColors.red,
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
                              color: AppColors.white),
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
      )),
    );
  }
}
