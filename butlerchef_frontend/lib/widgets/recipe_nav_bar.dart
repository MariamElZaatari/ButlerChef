// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/recipe_directions.dart';
import 'package:butler_chef/widgets/recipe_products.dart';

class RecipeNavBar extends StatefulWidget {
  final int? recipeId;
  final int? cooked;
  const RecipeNavBar({
    Key? key, this.recipeId, this.cooked
  }) : super(key: key);

  @override
  RecipeNavBarState createState() => RecipeNavBarState();
}

class RecipeNavBarState extends State<RecipeNavBar> {
  static List<Widget> _widgetOptions = <Widget>[];
  int _selectedIndex = 0;

  @override
  void initState() {
    _widgetOptions = [
      RecipeProducts(
        recipeId: widget.recipeId,
      ),
      RecipeDirections(
        recipeId: widget.recipeId,
        retrievedCooked: widget.cooked,
      ),
    ];
  }

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
              Icons.summarize_outlined,
              size: 27,
            ),
            activeIcon: Icon(
              Icons.summarize_rounded,
              size: 27,
            ),
            label: 'Ingredients',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_dining_rounded,
              size: 27,
            ),
            label: 'Directions',
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
          child: Center(
            child: IndexedStack(
              children: _widgetOptions,
              index: _selectedIndex,
            ),
          ),
        ),
      ),
    ]);
  }
}
