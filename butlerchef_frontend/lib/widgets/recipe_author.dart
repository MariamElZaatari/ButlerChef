import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:butler_chef/constants/app_colors.dart';

import '../models/user_model.dart';
import '../services/favorite_recipe_service.dart';

class RecipeAuthor extends StatefulWidget {
  final User? user;
  final int? retrievedFavorite;
  final int? recipeId;
  const RecipeAuthor(
      {Key? key,
      required this.user,
      required this.retrievedFavorite,
      required this.recipeId})
      : super(key: key);

  LargeRecipeState createState() => LargeRecipeState();
}

class LargeRecipeState extends State<RecipeAuthor> {
  String? name;
  String? name1;
  late bool _favorite = false;

  FaIcon heartOutlined = const FaIcon(
    FontAwesomeIcons.heart,
    color: AppColors.white,
  );
  FaIcon heartSolid = const FaIcon(
    FontAwesomeIcons.solidHeart,
    color: AppColors.white,
  );

  @override
  void initState() {
    if (widget.user?.firstName != null &&
        widget.user?.lastName != null &&
        widget.retrievedFavorite != null) {
      name = widget.user?.firstName;
      name1 = widget.user?.lastName;
      _favorite = widget.retrievedFavorite == 1 ? true : false;
    }
    super.initState();
  }

  void onFavoriteChange() {
    if (_favorite) {
      Future.delayed(Duration.zero, () async {
        await FavoriteRecipeService.createFavoriteByRecipeId(widget.recipeId);
      });
    } else {
      Future.delayed(Duration.zero, () async {
        await FavoriteRecipeService.deleteFavoriteById(widget.recipeId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
              ),
            )),
        Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name.toString() + " " + name1.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.white),
              ),
            )),
        Expanded(
          flex: 3,
          child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: _favorite ? heartSolid : heartOutlined,
                  onPressed: () => {
                        setState(() => {_favorite = !_favorite}),
                        onFavoriteChange()
                      })),
        ),
      ],
    );
  }
}
