import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/top_recipe_bar.dart';
import 'package:butler_chef/widgets/bottom_recipe_bar.dart';
import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/screens/recipe_screen.dart';

class LargeRecipe extends StatefulWidget {
  final List<RecipeCardModel> recipes;
  const LargeRecipe({
    Key? key, required this.recipes,
  }) : super(key: key);

  @override
  LargeRecipeState createState() => LargeRecipeState();
}

class LargeRecipeState extends State<LargeRecipe> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 518,
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(15, 12, 0, 0),
              itemCount: widget.recipes.length,
              itemBuilder: (BuildContext context, int index) {
                return buildRecipes(context,index);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
    );
  }

  Widget buildRecipes(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          height: 563,
          width: 325,
          margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
          padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
//          child: Image.memory(base64Decode(widget.recipes[index].recipe?.imageUrl ?? '')),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(base64Decode(widget.recipes[index].recipe?.imageUrl ?? '')),
              fit: BoxFit.fill,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
        ),
        Container(
            height: 563,
            width: 325,
            margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
            padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
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
                  Color(0x0D000000),
                  Color(0x66000000),
                ], // red to yellow // repeats the gradient over the canvas
              ),
            )),
        InkWell(
            onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipeScreen(recipeId: widget.recipes[index].recipe?.id, image: widget.recipes[index].recipe?.imageUrl, name: widget.recipes[index].recipe?.name, cooked: widget.recipes[index].cooked,)),
            )
            },
            splashColor: Colors.grey,
            child: Container(
              height: 563,
              width: 325,
              margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
              padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: TopRecipeBar(
                          starSize: 28.0, fridge: widget.recipes[index].fridge, total: widget.recipes[index].total, rate: widget.recipes[index].recipe?.rate,
                        ),
                      ),
                      flex: 1),
                  const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(''),
                      ),
                      flex: 4),
                  Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: BottomRecipeBar(
                          titleSize: 36.0,
                          infoSize: 21.0,
                          titleWidth: 400.0,
                          isSmall: false,
                          isFavorite: false,
                          name: widget.recipes[index].recipe?.name,
                          level: widget.recipes[index].recipe?.level,
                          serving: widget.recipes[index].recipe?.serving,
                          time: widget.recipes[index].recipe?.time,
                          user: widget.recipes[index].recipe?.user,
                          favorite: widget.recipes[index].favorite,
                          recipeId: widget.recipes[index].recipe?.id,
                        ),
                      ),
                      flex: 5),
                ],
              ),
            )),
      ],
    );
  }
}
