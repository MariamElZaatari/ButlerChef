import 'package:butler_chef/models/recipe_ingredient.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/add_products_item.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/models/measurement_quantity_model.dart';
import 'package:butler_chef/models/measurement_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/quantity_model.dart';
import '../models/recipe_product_model.dart';
import '../utils/styles.dart';

class AddFridgeProducts extends StatefulWidget {
  const AddFridgeProducts({
    Key? key,
    this.products = const [],
    this.onProductsChange,
  }) : super(key: key);
  final List<RecipeProduct> products;
  final void Function(List<RecipeProduct> products)? onProductsChange;

  @override
  AddFridgeProductsState createState() => AddFridgeProductsState();
}

class AddFridgeProductsState extends State<AddFridgeProducts>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final List<RecipeProduct> _products = [];
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _products.addAll(widget.products);
    _animation = AnimationController(vsync: this, value: 1);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: AppColors.backgroundColor,
        ),
        itemCount: _products.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _products.length) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: _addIngredient,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.green),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return AppColors.white.withOpacity(0.12);
                          }
                          return null;
                        },
                      ),
                    ),
                    child: RichText(
                        text: const TextSpan(children: [
                      WidgetSpan(
                        child: FaIcon(FontAwesomeIcons.plus,
                            color: AppColors.white, size: 21),
                      ),
                      TextSpan(
                          text: " Add Ingredient", style: ThemeText.buttonText)
                    ]))));
          }
          final item = _products[index];
          Widget child = AddProductsItem(
            key: UniqueKey(),
            name: item.name,
            animation: _animation,
            onClicked: () => _removeIngredient(index),
            onNameChange: (name) => _onItemNameChange(index, name),
            onMeasurementChange: (measurement) =>
                _onItemMeasurementChange(index, measurement),
            onQuantityChange: (quantity) =>
                _onItemQuantityChange(index, quantity),
          );
          return child;
        },
      ),
    );
  }

  void _addIngredient() {
    _products.add(
      RecipeProduct(
        name: '',
        measurement: Measurement(id: 1, value: "kg"),
        quantity: Quantity(id: 1, value: "1"),
      ),
    );
    setState(() {});
  }

  void _removeIngredient(int index) {
    _products.removeAt(index);
    setState(() {});
  }

  void _onItemNameChange(int index, String name) {
    _onItemChange(index, name: name);
  }

  void _onItemMeasurementChange(
      int index, MeasurementWithQuantities measurement) {
    _onItemChange(index, measurement: measurement);
  }

  void _onItemQuantityChange(int index, Quantity quantity) {
    _onItemChange(index, quantity: quantity);
  }

  void _onItemChange(
    int index, {
    String? name,
    MeasurementWithQuantities? measurement,
    Quantity? quantity,
  }) {
    print('call');
    setState(() {
      final item = _products[index];
      _products[index] = RecipeProduct(
          name: name ?? item.name,
          quantity: quantity ?? item.quantity,
          measurement: Measurement.fromMeasurementWithQuantity(measurement));
    });
    print(_products[index].name);
    widget.onProductsChange?.call(_products);
  }

  @override
  bool get wantKeepAlive => true;
}
