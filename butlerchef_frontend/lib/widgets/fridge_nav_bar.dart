// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/small_recipe.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class FridgeNavBar extends StatefulWidget {
  const FridgeNavBar({Key? key}) : super(key: key);

  @override
  FridgeNavBarState createState() => FridgeNavBarState();
}

class FridgeNavBarState extends State<FridgeNavBar> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    SmallRecipe(),
    SmallRecipe(),
    SmallRecipe(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.kitchen_rounded, color: AppColors.grayButton, size: 27,),
              activeIcon: Icon(Icons.kitchen_rounded, color: AppColors.green, size: 27,),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.playlist_add_rounded, color: AppColors.grayButton, size: 27,),
              activeIcon: Icon(Icons.playlist_add_rounded, color: AppColors.green, size: 27),
              label: 'Add Product',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedFontSize: 14,
          selectedItemColor: AppColors.green,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
        flex: 1,
      ),
      Expanded(
        flex: 5,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(child: _widgetOptions.elementAt(_selectedIndex))),
      ),
    ]);
  }
}
