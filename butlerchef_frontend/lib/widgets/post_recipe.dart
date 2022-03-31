import 'package:butler_chef/models/recipe_direction_model.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/models/recipe_model.dart';
import 'package:butler_chef/screens/home_screen.dart';
import 'package:butler_chef/services/recipe_service.dart';
import 'package:butler_chef/widgets/post_recipe_directions.dart';
import 'package:butler_chef/widgets/post_recipe_products.dart';
import 'package:butler_chef/widgets/recipe_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/recipe_product_model.dart';
import 'package:butler_chef/constants/styles.dart';

class PostRecipeScreen extends StatefulWidget {
  final String? difficulty;
  final List<String> difficulties = const ['Easy', 'Avg', 'Hard'];
  final void Function(String difficulty)? onDifficultyChange;
  final String? time;
  final List<String> times = const [
    '5min',
    '10min',
    '15min',
    '20min',
    '25min',
    '30min',
    '45min',
    '60min',
    '90min',
    '120min',
    '150min',
    '180min'
  ];
  final void Function(String time)? onTimeChange;
  final String? serving;
  final List<String> servings = const [
    '1srv',
    '2srv',
    '3srv',
    '4srv',
    '5srv',
    '6srv',
    '7srv',
    '8srv',
    '9srv',
    '10srv'
  ];
  final void Function(String serving)? onServingChange;

  const PostRecipeScreen({
    Key? key,
    this.difficulty,
    this.onDifficultyChange,
    this.time,
    this.onTimeChange,
    this.onPostSuccess,
    this.serving,
    this.onServingChange,
  }) : super(key: key);
  final VoidCallback? onPostSuccess;

  @override
  _PostRecipeScreenState createState() => _PostRecipeScreenState();
}

class _PostRecipeScreenState extends State<PostRecipeScreen> {
  String dropdownDifficultyValue = 'Easy';
  String dropdownTimeValue = '5min';
  String dropdownServingValue = '1srv';

  late final TextEditingController _controller;
  late final List<Widget> _screens;
  List<RecipeProduct> _ingredients = [];
  List<RecipeDirection> _directions = [];

  List<RecipeProduct> getIngredients() {
    return _ingredients;
  }

  void setIngredients(List<RecipeProduct> i) {
    setState(() {
      _ingredients = i;
    });
  }

  void setDirections(List<RecipeDirection> i) {
    setState(() {
      _directions = i;
    });
  }

  List<RecipeDirection> getDirections() {
    return _directions;
  }

  String getRecipeName() {
    return _controller.text;
  }

  @override
  void initState() {
    super.initState();
    dropdownDifficultyValue = widget.difficulty ?? 'Easy';
    dropdownTimeValue = widget.time ?? '5min';
    dropdownServingValue = widget.serving ?? '1srv';

    _controller = TextEditingController(text: "Set Recipe Name");
    _screens = [
      PostRecipeIngredients(
        onIngredientsChange: _onIngredientsChange,
        ingredients: _ingredients,
        callback: setIngredients,
      ),
      PostRecipeDirections(
        onDirectionsChange: _onDirectionsChange,
        onPostClick: (recipeDirections) => _onPostClick(recipeDirections),
        directions: _directions,
        callback: setDirections,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
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

            //Title
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
                            //Edit Button
                            WidgetSpan(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              backgroundColor: AppColors.white,
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: AppColors.green,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 21,
                                                        horizontal: 50),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    TextField(
                                                      maxLength: 26,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          ThemeText.dialogInput,
                                                      decoration:
                                                          const InputDecoration(
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .brown),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .green),
                                                              ),
                                                              hintText:
                                                                  'Recipe Name'),
                                                      controller: _controller,
                                                      onSubmitted: (text) {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
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
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 4,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    //RecipeInfo
                    SizedBox(
                        width: 300,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //Difficulty
                                const FaIcon(FontAwesomeIcons.mountain,
                                    color: AppColors.green, size: 21),
                                PopupMenuButton<String>(
                                  itemBuilder: (context) {
                                    return widget.difficulties
                                        .map<PopupMenuItem<String>>(
                                            (String difficulty) {
                                      return PopupMenuItem<String>(
                                        value: difficulty,
                                        child: Text(difficulty,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.green)),
                                      );
                                    }).toList();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        dropdownDifficultyValue,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.green,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  onSelected: (String? newValue) {
                                    setState(() {
                                      dropdownDifficultyValue = newValue!;
                                    });
                                    widget.onDifficultyChange
                                        ?.call(newValue ?? "Easy");
                                    FocusScope.of(context).unfocus();
                                  },
                                ),

                                //Time
                                const SizedBox(
                                  width: 12,
                                ),
                                const FaIcon(FontAwesomeIcons.solidClock,
                                    color: AppColors.green, size: 21),
                                PopupMenuButton<String>(
                                  itemBuilder: (context) {
                                    return widget.times
                                        .map<PopupMenuItem<String>>(
                                            (String time) {
                                      return PopupMenuItem<String>(
                                        value: time,
                                        child: Text(time,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.green)),
                                      );
                                    }).toList();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        dropdownTimeValue,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.green,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  onSelected: (String? newValue) {
                                    setState(() {
                                      dropdownTimeValue = newValue!;
                                    });
                                    widget.onTimeChange
                                        ?.call(newValue ?? "5min");
                                    FocusScope.of(context).unfocus();
                                  },
                                ),

                                //Serving
                                const SizedBox(
                                  width: 12,
                                ),
                                const FaIcon(FontAwesomeIcons.solidClock,
                                    color: AppColors.green, size: 21),
                                PopupMenuButton<String>(
                                  itemBuilder: (context) {
                                    return widget.servings
                                        .map<PopupMenuItem<String>>(
                                            (String serving) {
                                      return PopupMenuItem<String>(
                                        value: serving,
                                        child: Text(serving,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.green)),
                                      );
                                    }).toList();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        dropdownServingValue,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.green,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  onSelected: (String? newValue) {
                                    setState(() {
                                      dropdownServingValue = newValue!;
                                    });
                                    widget.onServingChange
                                        ?.call(newValue ?? "1srv");
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              ],
                            ))),
                    const SizedBox(
                      height: 16,
                    ),
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
    ]);
  }

  void _onPostClick(List<RecipeDirection> recipeDirections) async {
    RecipeModel recipeModel = RecipeModel(
      name: getRecipeName(),
      level: dropdownDifficultyValue,
      time: dropdownTimeValue,
      rate: 3,
      imageUrl: "no Img",
      serving: dropdownServingValue,
      visibility: 1,
    );

    List<RecipeProduct> products = getIngredients();

    bool success=false;


    success=(await RecipeService.createRecipe(recipeModel, products, recipeDirections));


    success? Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    ): _showAlertDialog("Failed to create recipe.");
  }

  void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.red,
          title: Text(
            message,
            style: ThemeText.errorMessage,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }

  void _onDirectionsChange(List<RecipeDirection> directions) {
    print(directions);
    setState(() {
      _directions = directions;
    });
  }

  void _onIngredientsChange(List<RecipeProduct> ingredients) {
    setState(() {
      _ingredients = ingredients;
    });
  }
}
