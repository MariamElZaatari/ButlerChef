import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/fridge_product_model.dart';
import '../providers/user_provider.dart';
import '../services/fridge_product_service.dart';

class FridgeProducts extends StatefulWidget {
  const FridgeProducts({Key? key}) : super(key: key);

  @override
  FridgeProductsState createState() => FridgeProductsState();
}

class FridgeProductsState extends State<FridgeProducts> {
  late List<FridgeProduct> fridgeProducts = <FridgeProduct>[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      int? id=Provider.of<UserProvider>(context, listen: false).user.id;

      await FridgeProductService.fetchFridgeProductByUserId(id).then((data) {
        setState(() {
          fridgeProducts = data;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductItem> productItems = fridgeProducts
        .map((item) => ProductItem(
        productName: item.name,
        quantity: item.quantity.value,
        measurement: item.measurement.value))
        .toList();
    return Center(
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  color: AppColors.fridge,
                ),
            itemCount: fridgeProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                  productName: productItems[index].productName, quantity: productItems[index].quantity , measurement: productItems[index].measurement);
            }));
  }
}