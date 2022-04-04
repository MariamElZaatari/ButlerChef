import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/recipe_nav_bar.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/custom_back_button.dart';

class RecipeScreen extends StatefulWidget {
  final int? recipeId;
  final String? name;
  final String? image;
  final int? cooked;
  const RecipeScreen({Key? key, required this.recipeId, required this.name, required this.image, required this.cooked}) : super(key: key);

  @override
  RecipeScreenState createState() => RecipeScreenState();
}

class RecipeScreenState extends State<RecipeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.memory(
                    base64Decode(widget.image!),
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
                        // 10% of the width, so there are ten blinds.
                        stops: [0.3, 0.9],
                        colors: <Color>[
                          Color(0x00000000),
                          Color(0x66000000),
                        ], // red to yellow // repeats the gradient over the canvas
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
                            child: Text(
                              widget.name.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 4,
                                color: AppColors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const CustomBackButton(),
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: RecipeNavBar(recipeId: widget.recipeId, cooked: widget.cooked),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
