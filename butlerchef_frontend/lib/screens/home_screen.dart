// ignore_for_file: prefer_const_constructors
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/body_widget.dart';
import 'package:butler_chef/widgets/large_recipe.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/profile.dart';
import 'package:butler_chef/widgets/fridge.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:butler_chef/widgets/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LargeRecipe(),
    Shop(),
    Text(
      'Index 2: Post',
      style: optionStyle,
    ),
    Fridge(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyWidget(
          widgetOptions: _widgetOptions, selectedIndex: _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.fileAlt, size: 28),
            label: 'Recipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 35),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 50),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen_outlined, size: 35),
            label: 'Fridge',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user, size: 28),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.grayButton,
        selectedItemColor: AppColors.green,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
