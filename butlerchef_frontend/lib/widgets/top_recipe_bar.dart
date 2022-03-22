import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/star_rate.dart';
import 'package:butler_chef/widgets/ingredient_stats.dart';

class TopRecipeBar extends StatelessWidget {
  const TopRecipeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: StarRate(),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IngredientStats(),
          ),
        ),
      ],
    );
  }
}
