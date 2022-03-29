import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/top_recipe_bar.dart';
import 'package:butler_chef/widgets/bottom_recipe_bar.dart';
import 'package:butler_chef/screens/recipe_screen.dart';

import '../models/recipe_model.dart';
import '../services/recipe_service.dart';

class SmallRecipe extends StatefulWidget {
  const SmallRecipe({
    Key? key,
  }) : super(key: key);

  @override
  SmallRecipeState createState() => SmallRecipeState();
}

class SmallRecipeState extends State<SmallRecipe> {
  late List<RecipeCardModel> recipes = <RecipeCardModel>[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await RecipeService.getAllRecipes().then((data) {
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
        padding: const EdgeInsets.fromLTRB(15, 12, 0, 0),
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                height: 280,
                width: 281,
                margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
                padding: const EdgeInsets.fromLTRB(18, 2, 18, 12),
                decoration: const BoxDecoration(
                  image: DecorationImage(
//                  TODO recipes[index].recipe.imageUrl
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Container(
                  height: 280,
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
                              builder: (context) => const RecipeScreen()),
                        )
                      },
                  splashColor: Colors.grey,
                  child: Container(
                    height: 280,
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
                                name: recipes[index].recipe?.name,
                                level: recipes[index].recipe?.level,
                                serving: recipes[index].recipe?.serving,
                                time: recipes[index].recipe?.time,
                                user: recipes[index].recipe?.user,
                                favorite: recipes[index].favorite,
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
