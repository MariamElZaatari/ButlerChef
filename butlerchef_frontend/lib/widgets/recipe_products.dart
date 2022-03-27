import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/product_item.dart';
import 'package:flutter/material.dart';

class RecipeProducts extends StatefulWidget {
  const RecipeProducts({Key? key}) : super(key: key);

  @override
  RecipeProductsState createState() => RecipeProductsState();
}

class RecipeProductsState extends State<RecipeProducts> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15),
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(
              color: AppColors.backgroundColor,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const ProductItem(
                  productName: "Name", quantity: "1", measurement: "Dz");
            }));
  }
}
