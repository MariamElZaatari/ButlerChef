import 'package:butler_chef/models/recipe_direction_model.dart';
import 'package:butler_chef/models/recipe_ingredient.dart';
import 'package:butler_chef/utils/app_colors.dart';
//import 'package:butler_chef/widgets/custom_back_button.dart';
import 'package:butler_chef/widgets/post_recipe_directions.dart';
import 'package:butler_chef/widgets/post_recipe_products.dart';
import 'package:butler_chef/widgets/recipe_info.dart';
import 'package:butler_chef/widgets/recipe_nav_bar.dart';
import 'package:flutter/material.dart';

class PostRecipeScreen extends StatefulWidget {
  const PostRecipeScreen({
    Key? key,
    this.onPostSuccess,
  }) : super(key: key);
  final VoidCallback? onPostSuccess;

  @override
  _PostRecipeScreenState createState() => _PostRecipeScreenState();
}

class _PostRecipeScreenState extends State<PostRecipeScreen> {
  late final TextEditingController _controller;
  late final List<Widget> _screens;
  List<RecipeIngredient> _ingredients = [];
  List<RecipeDirection> _directions = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "Hot Shakshuka with Eggs");
    _screens = [
      PostRecipeIngredients(
        onIngredientsChange: _onIngredientsChange,
        ingredients: _ingredients,
      ),
      PostRecipeDirections(
        onDirectionsChange: _onDirectionsChange,
        onPostClick: _onPostClick,
        directions: _directions,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1532980400857-e8d9d275d858?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.9],
                        colors: <Color>[
                          Color(0x00000000),
                          Color(0x66000000),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 169,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text.rich(
                            TextSpan(
                              text: _controller.text,
                              children: [
                                WidgetSpan(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    20),
                                              ),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(
                                                    8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'Enter recipe name:',
                                                    ),
                                                    TextField(
                                                      controller:
                                                      _controller,
                                                      onSubmitted: (text) =>
                                                          Navigator.pop(
                                                              context),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 4,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(width: 300, child: RecipeInfo(size: 21.0)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: RecipeNavBar(screens: _screens),
            flex: 5,
          ),
        ],
      ),
    );
  }

  void _onPostClick() {
    // TODO: 28/03/2022 Handle post request
  }

  void _onDirectionsChange(List<RecipeDirection> directions) {
    setState(() {
      _directions = directions;
    });
  }

  void _onIngredientsChange(List<RecipeIngredient> ingredients) {
    setState(() {
      _ingredients = ingredients;
    });
  }
}
