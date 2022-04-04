import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/top_recipe_bar.dart';
import 'package:butler_chef/widgets/bottom_recipe_bar.dart';
import 'package:butler_chef/screens/recipe_screen.dart';

import '../models/recipe_model.dart';
import 'package:butler_chef/services/cooked_recipe_service.dart';

class SmallRecipeCooked extends StatefulWidget {
  const SmallRecipeCooked({
    Key? key,
  }) : super(key: key);

  @override
  CookedSmallRecipeState createState() => CookedSmallRecipeState();
}

class CookedSmallRecipeState extends State<SmallRecipeCooked> {
  late List<RecipeCardModel> recipes = <RecipeCardModel>[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await CookedRecipeService.getCookedRecipesByUserId().then((data) {
        setState(() {
          recipes = data;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(15, 18, 0, 0),
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: 361,
                width: 281,
                margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                padding: const EdgeInsets.fromLTRB(18, 2, 18, 12),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(base64Decode(recipes[index].recipe?.imageUrl ?? '')),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Container(
                  height: 361,
                  width: 281,
                  margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                  padding: const EdgeInsets.fromLTRB(18, 2, 18, 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      stops: [0.01, 0.2, 0.3, 0.4, 0.9],
                      colors: <Color>[
                        Color(0x66000000),
                        Color(0x0D000000),
                        Color(0x00000000),
                        Color(0x00000000),
                        Color(0x66000000),
                      ], // red to yellow // repeats the gradient over the canvas
                    ),
                  )),
              InkWell(
                  onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeScreen(recipeId: recipes[index].recipe?.id, image: recipes[index].recipe?.imageUrl, name: recipes[index].recipe?.name, cooked: recipes[index].cooked,)),
                  )
                  },
                  splashColor: Colors.grey,
                  child: Container(
                    height: 361,
                    width: 281,
                    margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                    padding: const EdgeInsets.fromLTRB(18, 2, 12, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TopRecipeBar(
                                starSize: 25.0,
                                fridge: recipes[index].fridge,
                                total: recipes[index].total,
                                rate: recipes[index].recipe?.rate,
                              ),
                            ),
                            flex: 1),
                        const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(''),
                            ),
                            flex: 1),
                        Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: BottomRecipeBar(
                                titleSize: 29.0,
                                infoSize: 18.0,
                                titleWidth: 200.0,
                                isSmall: true,
                                isFavorite: false,
                                name: recipes[index].recipe?.name,
                                level: recipes[index].recipe?.level,
                                serving: recipes[index].recipe?.serving,
                                time: recipes[index].recipe?.time,
                                user: recipes[index].recipe?.user,
                                favorite: recipes[index].favorite,
                                recipeId: recipes[index].recipe?.id,
                              ),
                            ),
                            flex: 4),
                      ],
                    ),
                  )),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
