import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class RecipeTitle extends StatelessWidget {
  final double _size;
  final double _width;
  final String? title;

  const RecipeTitle({
    Key? key,
    required size, required width, required this.title
  })  : _size = size, _width=width,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _width,
        margin: EdgeInsets.only(bottom: 12),
        child: Text(
          title.toString(),
          style: TextStyle(
            fontSize: _size,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
            color: AppColors.white,
          ),
        ));
  }
}
