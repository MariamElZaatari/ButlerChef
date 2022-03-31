import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/add_direction_item.dart';
import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../models/recipe_direction_model.dart';
import '../services/cooked_recipe_service.dart';
import '../services/recipe_direction_service.dart';

class RecipeDirections extends StatefulWidget {
  final int? retrievedCooked;
  final int? recipeId;
  final void Function(bool cooked)? onCookedChange;
  const RecipeDirections({Key? key, required this.retrievedCooked, required this.recipeId,this.onCookedChange,})
      : super(key: key);

  @override
  RecipeDirectionsState createState() => RecipeDirectionsState();
}

class RecipeDirectionsState extends State<RecipeDirections> {
  late List<RecipeDirection> directions = [];
  late bool _cooked = false;
  int count = 0;

  Icon cookedOutlined = const Icon(
    Icons.check_circle_rounded,
    color: AppColors.grayIcon,
    size: 41,
  );
  Icon cookedSolid = const Icon(
    Icons.check_circle_rounded,
    color: AppColors.green,
    size: 41,
  );

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await RecipeDirectionService.getDirectionsByRecipeID(widget.recipeId).then((data) {
        setState(() {
          directions = data;
        });
      });
    });
    if (widget.retrievedCooked != null) {
      _cooked = widget.retrievedCooked == 1 ? true : false;
    }
    super.initState();
  }

  void onCookedChange(){
    if(_cooked){
    Future.delayed(Duration.zero, () async {
      await CookedRecipeService.createCookedByRecipeId(widget.recipeId);
    });
    } else{
      Future.delayed(Duration.zero, () async {
        await CookedRecipeService.deleteCookedById(widget.recipeId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: AppColors.backgroundColor,
                ),
            itemCount: directions.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == directions.length) {
                return Container(
                    height: 221,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.fromLTRB(15, 41, 15, 21),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Done',
                                    style: ThemeText.directionTitle,
                                    textAlign: TextAlign.center,
                                  ))),
                          const SizedBox(
                            height: 16,
                          ),
                          const Expanded(
                              flex: 2,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Mark as Cooked?',
                                    style: TextStyle(
                                        fontSize: 21,
                                        letterSpacing: 4,
                                        color: AppColors.brown),
                                    textAlign: TextAlign.center,
                                  ))),
                          Expanded(
                              flex: 2,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: IconButton(
                                      icon: _cooked ? cookedSolid : cookedOutlined,
                                      onPressed: () => {
                                      widget.onCookedChange?.call(
                                        _cooked
                                      ),
                                      setState(() => {_cooked = !_cooked}),
                                      onCookedChange(),
                                      })))
                        ],
                      ),
                    ));
              }

              return Column(
                children: [
                  Direction(title: directions[index].title, body: directions[index].content, editable: false),
                  Container(
                    height: 29,
                    width: 29,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          (index + 1).toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: AppColors.white),
                        )),
                  ),
                ],
              );
            }));
  }
}
