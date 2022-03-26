import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/fridge_product_item.dart';
import 'package:flutter/material.dart';

class FridgeProducts extends StatefulWidget {
  const FridgeProducts({Key? key}) : super(key: key);

  @override
  FridgeProductsState createState() => FridgeProductsState();
}

class FridgeProductsState extends State<FridgeProducts> {

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
              return const FridgeProductItem(
                  productName: "Name", quantity: "1", measurement: "Dz");
            }));
  }
}
