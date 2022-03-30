import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../models/recipe_product_model.dart';
import '../services/recipe_product_service.dart';

class RecipeProducts extends StatefulWidget {
  final int? recipeId;
  const RecipeProducts({Key? key, required this.recipeId}) : super(key: key);

  @override
  RecipeProductsState createState() => RecipeProductsState();
}

class RecipeProductsState extends State<RecipeProducts> {
  late List<RecipeProduct> products=[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await RecipeProductService.getProductsByRecipeID(widget.recipeId).then((data) {
        setState(() {
          products = data;
        });
      });
    });
    super.initState();
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
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                  productName: products[index].name, quantity: products[index].quantity.value, measurement: products[index].measurement.value);
            }));
  }
}
