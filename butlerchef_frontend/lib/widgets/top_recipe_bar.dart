import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/star_rate.dart';
import 'package:butler_chef/widgets/ingredient_stats.dart';

class TopRecipeBar extends StatelessWidget {
  final double _starSize;
  const TopRecipeBar({
    Key? key, required starSize
  }) : _starSize=starSize, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: StarRate(size: _starSize,),
          ),
        ),
        const Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IngredientStats(),
          ),
        ),
      ],
    );
  }
}
