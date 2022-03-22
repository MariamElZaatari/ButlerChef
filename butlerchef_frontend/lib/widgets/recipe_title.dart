import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: 400,
        child: Text(
          "Hot Shakshuka with Eggs",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
            color: AppColors.white,
          ),
        ));
  }
}
