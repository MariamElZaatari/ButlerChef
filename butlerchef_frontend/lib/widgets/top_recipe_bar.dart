import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/star_rate.dart';
import 'package:butler_chef/widgets/ingredient_stats.dart';

class TopRecipeBar extends StatelessWidget {
  final double _starSize;
  final int? total;
  final int? fridge;
  final double? rate;

  const TopRecipeBar({
    Key? key,
    required starSize,
    required this.total,
    required this.fridge,
    required this.rate,
  })  : _starSize = starSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: StarRate(
              size: _starSize,
              rate: rate,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IngredientStats(fridge: fridge,total: total,),
          ),
        ),
      ],
    );
  }
}
