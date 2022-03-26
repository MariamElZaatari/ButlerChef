import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class RecipeTitle extends StatelessWidget {
  final double _size;
  final double _width;
  const RecipeTitle({
    Key? key,
    required size, required width
  })  : _size = size, _width=width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Text(
          "Hot Shakshuka with Eggs",
          style: TextStyle(
            fontSize: _size,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
            color: AppColors.white,
          ),
        ));
  }
}
