import 'package:butler_chef/widgets/cart_product_item.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/shop_product_model.dart';

class CartProductList extends StatefulWidget {
  final Function(List<ShopProductModel>) callback;
  final List<ShopProductModel> ingredients;
  final void Function(List<ShopProductModel> ingredients)? onIngredientsChange;
  final List<ShopProductItem> selectedProducts;
  final Function(double) callbackTotal;

  const CartProductList({
    Key? key,
    required this.callback,
    this.ingredients = const [],
    this.onIngredientsChange,
    required this.selectedProducts,
    required this.callbackTotal,
  }) : super(key: key);

  @override
  CartProductListState createState() => CartProductListState();
}

class CartProductListState extends State<CartProductList>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
//  final key = GlobalKey<AnimatedListState>();
  late final List<ShopProductModel> _products = [];
  late final List<ShopProductModel> _ingredients = [];
  late final Animation<double> _animation;

  @override
  void initState() {
    _ingredients.addAll(widget.ingredients);
    _animation = AnimationController(vsync: this, value: 1);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget.callback(_ingredients);
    });
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

  Widget buildItem(BuildContext context, int index) {
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
      animation: _animation,
      onClicked: () => _removeIngredient(index),
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
      widget.callbackTotal(_getTotal());
    });
  }

  double _getTotal() {
    double total = 0;
    for (ShopProductModel product in _products) {
      total += product.count! * product.price;
    }
    return total;
  }

  void _removeIngredient(int index) {
    _ingredients.removeAt(index);
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 15),
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: AppColors.backgroundColor,
                ),
                itemCount: _products.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildItem(context, index);
                }),
          ),
        ],
      ),
    );
  }
}
