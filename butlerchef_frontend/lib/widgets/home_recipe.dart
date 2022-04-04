import 'package:butler_chef/widgets/large_recipe.dart';
import 'package:butler_chef/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/services/recipe_service.dart';

class HomeRecipe extends StatefulWidget {
  const HomeRecipe({
    Key? key,
  }) : super(key: key);

  @override
  HomeRecipeState createState() => HomeRecipeState();
}

class HomeRecipeState extends State<HomeRecipe> {
  late List<RecipeCardModel> recipes = <RecipeCardModel>[];
  String recipeName = "";

  setRecipeName(newName) {
    setState(() {
      recipeName = newName;
      initState();
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      if (recipeName.isNotEmpty) {
        await RecipeService.getRecipesByRecipeName(recipeName).then((data) {
          setState(() {
            recipes = data;
          });
        });
      } else {
        await RecipeService.getAllRecipes().then((data) {
          setState(() {
            recipes = data;
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(callback: setRecipeName),
        LargeRecipe(recipes: recipes)
      ],
    );
  }
}
