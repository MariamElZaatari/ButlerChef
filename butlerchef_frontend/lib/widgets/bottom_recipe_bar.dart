import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/recipe_title.dart';
import 'package:butler_chef/widgets/recipe_info.dart';
import 'package:butler_chef/widgets/recipe_author.dart';

class BottomRecipeBar extends StatelessWidget {
  final double _titleSize;
  final double _infoSize;
  final double _titleWidth;
  final bool _isSmall;
  const BottomRecipeBar({
    Key? key,
    required titleSize,
    required infoSize,
    required titleWidth,
    required isSmall,
  })  : _titleSize = titleSize,
        _infoSize = infoSize,
        _titleWidth = titleWidth,
        _isSmall = isSmall,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Align(
            alignment: Alignment.topLeft,
            child: RecipeTitle(
              size: _titleSize,
              width: _titleWidth,
            ),
          ),
        ),
        _isSmall
            ? Container()
            : Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RecipeInfo(
                    size: _infoSize,
                  ),
                ),
              ),
        const Expanded(
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
