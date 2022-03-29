import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

import '../models/measurement_model.dart';
import '../models/quantity_model.dart';

// ProductWidget

class ShopProductItem extends StatelessWidget {
  final String productName;
  final String image;
  final Quantity quantity;
  final Measurement measurement;
  final double price;

  const ShopProductItem({
    Key? key,
    required this.productName,
    required this.image,
    required this.quantity,
    required this.measurement,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 141,
              width: 171,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://thumbs.dreamstime.com/b/fresh-tomato-isolated-white-background-close-up-fresh-tomato-isolated-white-background-close-up-124753596.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
            ),
            Container(
                height: 141,
                width: 171,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment
                        .bottomCenter, // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Color(0x00000000),
                      Color(0x66000000),
                    ], // red to yellow // repeats the gradient over the canvas
                  ),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              height: 141,
              width: 171,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    productName,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  )),
            ),
          ],
        ),
        Container(
          height: 28,
          width: 171,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0, 0.5, 0.5, 1.0],
              colors: <Color>[
                AppColors.white,
                AppColors.white,
                AppColors.brown,
                AppColors.brown,
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      quantity.value + measurement.value.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AppColors.brown,
                          fontSize: 12),
                    )),
                flex: 5,
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "\$" + price.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                          fontSize: 12),
                    )),
                flex: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
