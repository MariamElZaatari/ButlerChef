import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/recipe_title.dart';
import 'package:butler_chef/widgets/recipe_info.dart';
import 'package:butler_chef/widgets/recipe_author.dart';

import '../models/user_model.dart';

class BottomRecipeBar extends StatelessWidget {
  final double _titleSize;
  final double _infoSize;
  final double _titleWidth;
  final bool _isSmall;
  final bool _isFavorite;
  final String? name;
  final String? level;
  final String? time;
  final User? user;
  final String? serving;
  final int? favorite;
  final int? recipeId;


  const BottomRecipeBar({
    Key? key,
    required titleSize,
    required infoSize,
    required titleWidth,
    required isSmall,
    required isFavorite,
    required this.name,
    required this.level,
    required this.time,
    required this.user,
    required this.serving,
    required this.favorite,
    required this.recipeId
  })  : _titleSize = titleSize,
        _infoSize = infoSize,
        _titleWidth = titleWidth,
        _isSmall = isSmall,
        _isFavorite = isFavorite,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: RecipeTitle(
              size: _titleSize,
              width: _titleWidth,
              title: name,
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
                    level: level,
                    serving: serving,
                    time: time,
                  ),
                ),
              ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: RecipeAuthor(
              user: user,
              retrievedFavorite: _isFavorite? 1: favorite,
              recipeId: recipeId,
            ),
          ),
        ),
      ],
    );
  }
}
