import 'package:butler_chef/widgets/cart_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartProductList extends StatefulWidget {
  const CartProductList({
    Key? key,
  }) : super(key: key);

  @override
  CartProductListState createState() => CartProductListState();
}

class CartProductListState extends State<CartProductList> {
  final key = GlobalKey<AnimatedListState>();

  Widget buildItem(int index, Animation<double> animation) => CartProductItem(
        key: UniqueKey(),
        animation: animation,
        onClicked: () => removeItem(index),
      );

  void removeItem(int index) {
    key.currentState?.removeItem(
      index,
      (context, animation) => buildItem(index, animation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: AnimatedList(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 15),
                key: key,
                initialItemCount: 4,
                itemBuilder: (context, index, animation) {
                  return buildItem(index, animation);
                }),
          ),
        ],
      ),
    );
  }
}
