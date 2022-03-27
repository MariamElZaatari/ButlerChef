// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/fridge_products.dart';
import 'package:butler_chef/widgets/add_products.dart';

class FridgeNavBar extends StatefulWidget {
  const FridgeNavBar({Key? key}) : super(key: key);

  @override
  FridgeNavBarState createState() => FridgeNavBarState();
}

class FridgeNavBarState extends State<FridgeNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FridgeProducts(),
    AddProducts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.kitchen_rounded,
                size: 27,
              ),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_add_rounded,
                size: 27,
              ),
              label: 'Add Product',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: AppColors.grayButton,
          selectedItemColor: AppColors.green,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
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
