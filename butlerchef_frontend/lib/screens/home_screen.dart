// ignore_for_file: prefer_const_constructors
import 'package:butler_chef/widgets/post_recipe.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/body_widget.dart';
import 'package:butler_chef/widgets/home_recipe.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/profile.dart';
import 'package:butler_chef/widgets/fridge.dart';
import 'package:butler_chef/widgets/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomeRecipe(),
      Shop(),
      PostRecipeScreen(
        onPostSuccess: () => _onItemTapped(0),
      ),
      Fridge(),
      Profile(),
    ];
  }

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
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined, size: 35),
              activeIcon: Icon(Icons.description_rounded, size: 35),
              label: 'Recipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store_outlined, size: 35),
              activeIcon: Icon(Icons.local_grocery_store_rounded, size: 35),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, size: 45),
              activeIcon: Icon(Icons.add_circle_rounded, size: 45),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen_outlined, size: 35),
              activeIcon: Icon(Icons.kitchen_rounded, size: 35),
              label: 'Fridge',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, size: 35),
              activeIcon: Icon(Icons.person_rounded, size: 35),
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
      ),
      backgroundColor: _selectedIndex==3? AppColors.fridge:AppColors.backgroundColor,
    );
  }
}
