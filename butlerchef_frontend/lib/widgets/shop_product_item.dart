import 'package:flutter/material.dart';
import 'package:butler_chef/utilities/app_colors.dart';

// ProductWidget

class ShopProductItem extends StatelessWidget {
  final String productName;
  final String image;
  final double quantity;
  final String measurement;
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
    return Container(
      height: 221,
      width: 200,
      margin: const EdgeInsets.fromLTRB(0, 0, 21, 0),
      padding: const EdgeInsets.fromLTRB(18, 2, 18, 25),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 141,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://thumbs.dreamstime.com/b/fresh-tomato-isolated-white-background-close-up-fresh-tomato-isolated-white-background-close-up-124753596.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
              ),
              Container(
                  height: 141,
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20)),
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
              const SizedBox(
                height: 141,
                width: 200,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Tomatoes',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white),
                    )),
              ),
            ],
          ),
          Container(
              height: 28,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment
                      .centerRight,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('500G', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.brown, fontSize: 12),),
                Text("\$2.00", style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.white, fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
