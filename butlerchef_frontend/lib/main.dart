// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:butler_chef/screens/login_screen.dart';
import 'package:butler_chef/providers/token_provider.dart';
import 'package:butler_chef/providers/user_provider.dart';
import 'package:provider/provider.dart';


void main() => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => TokenProvider()),
      ],
      child: MyApp(),
    )
);
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
