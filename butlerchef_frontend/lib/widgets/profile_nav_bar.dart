// ignore_for_file: prefer_const_constructors
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/small_recipe.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class ProfileNavBar extends StatefulWidget {
  const ProfileNavBar({Key? key}) : super(key: key);

  @override
  ProfileNavBarState createState() => ProfileNavBarState();
}

class ProfileNavBarState extends State<ProfileNavBar> {
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
              icon: FaIcon(FontAwesomeIcons.fileAlt, size: 21),
              activeIcon: FaIcon(FontAwesomeIcons.solidFileAlt, size: 21),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart, size: 21),
              activeIcon: FaIcon(FontAwesomeIcons.solidHeart, size: 21),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.checkCircle, size: 21),
              activeIcon: FaIcon(FontAwesomeIcons.solidCheckCircle, size: 21),
              label: 'Cooked',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: AppColors.grayButton,
          selectedItemColor: AppColors.green,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
        flex: 1,
      ),
      Expanded(
        flex:5,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(child: _widgetOptions.elementAt(_selectedIndex))),
      ),
    ]);
  }
}
