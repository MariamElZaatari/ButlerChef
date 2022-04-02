import 'package:butler_chef/widgets/cart_product_item.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/shop_product_model.dart';

class CartProductList extends StatefulWidget {
  final List<ShopProductItem> selectedProducts;
  final Function(double) callback;

  const CartProductList({
    Key? key,
    required this.selectedProducts,
    required this.callback,
  }) : super(key: key);

  @override
  CartProductListState createState() => CartProductListState();
}

class CartProductListState extends State<CartProductList> {
  final key = GlobalKey<AnimatedListState>();
  late final List<ShopProductModel> _products = [];

  @override
  void initState() {
    for (var i = 0; i < widget.selectedProducts.length; i++) {
      _products.add(ShopProductModel(
        imageUrl: widget.selectedProducts[i].image,
        price: widget.selectedProducts[i].price,
        quantity: widget.selectedProducts[i].quantity,
        measurement: widget.selectedProducts[i].measurement,
        name: widget.selectedProducts[i].productName,
        count: 1,
      ));
    }
    super.initState();
  }

  Widget buildItem(int index, Animation<double> animation) {
    final item = _products[index];
    return CartProductItem(
      key: UniqueKey(),
      image: item.imageUrl,
      price: item.price,
      quantity: item.quantity,
      measurement: item.measurement,
      name: item.name,
      count: item.count,
      onCountChange: (count) => _onItemCountChange(index, count),
      onClicked: () => removeItem(index),
    );
  }

  void _onItemCountChange(int index, int count) {
    _onItemChange(index, tempCount: count);
  }

  void _onItemChange(
    int index, {
    int? tempCount,
  }) {
    setState(() {
      if (tempCount != null) {
        _products[index].count = tempCount;
      }
      widget.callback(_getTotal());
    });
  }

  double _getTotal() {
    double total = 0;
    for (ShopProductModel product in _products) {
      total += product.count! * product.price;
    }
    return total;
  }

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
                initialItemCount: _products.length,
                itemBuilder: (context, index, animation) {
                  return buildItem(index, animation);
                }),
          ),
        ],
      ),
    );
  }
}
