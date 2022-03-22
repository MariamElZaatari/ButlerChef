import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/recipe_title.dart';
import 'package:butler_chef/widgets/recipe_info.dart';
import 'package:butler_chef/widgets/recipe_author.dart';

class BottomRecipeBar extends StatelessWidget {
  const BottomRecipeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
         Expanded(
          flex: 7,
          child: Align(
            alignment: Alignment.topLeft,
            child: RecipeTitle(),
          ),
        ),
         Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.topLeft,
            child: RecipeInfo(),
          ),
        ),
         Expanded(
           flex: 2,
           child: Align(
             alignment: Alignment.bottomLeft,
             child: RecipeAuthor(),
           ),
         ),
      ],
    );
  }
}
