import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/recipe_nav_bar.dart';
import '../utils/app_colors.dart';
import 'package:butler_chef/widgets/recipe_info.dart';
import 'package:butler_chef/widgets/custom_back_button.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

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
                      children: const [
                        SizedBox(
                            width: 300,
                            child: Text(
                              "Hot Shakshuka with Eggs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 4,
                                color: AppColors.white,
                              ),
                            )),
                        SizedBox(width: 300, child: RecipeInfo(size: 21.0)),
                      ],
                    ),
                  ),
                ),
                const CustomBackButton(),
              ],
            ),
            flex: 2,
          ),
          const Expanded(
            child: RecipeNavBar(),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
