import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/add_direction_item.dart';
import 'package:flutter/material.dart';

class RecipeDirections extends StatefulWidget {
  const RecipeDirections({Key? key}) : super(key: key);

  @override
  RecipeDirectionsState createState() => RecipeDirectionsState();
}

class RecipeDirectionsState extends State<RecipeDirections> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: AppColors.backgroundColor,
                ),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  const Direction(),
                  Container(
                    height: 29,
                    width: 29,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Align(alignment: Alignment.center,child: Text((index+1).toString(), textAlign:TextAlign.center,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: AppColors.white),)),
                  ),
                ],
              );
            }));
  }
}
