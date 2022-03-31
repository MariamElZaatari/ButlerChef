import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/services/fridge_product_service.dart';
import 'package:butler_chef/widgets/add_products_item.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/models/measurement_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/quantity_model.dart';
import '../models/recipe_product_model.dart';
import 'package:butler_chef/constants/styles.dart';

import '../screens/home_screen.dart';

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
  late final List<List<Quantity>> _listOfQuantities = [];
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _products.addAll(widget.products);
    _animation = AnimationController(vsync: this, value: 1);
  }

  void _showAlertDialog(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.red,
          title: Text(
            message,
            style: ThemeText.errorMessage,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
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
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: _addIngredient,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.green),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
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
                              text: " Add Ingredient",
                              style: ThemeText.buttonText)
                        ]))),
                    Container(
                      height: 21.0,
                      width: 321,
                      margin: const EdgeInsets.only(bottom: 21, right: 30),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FittedBox(
                            child: IconButton(
                          onPressed: () async {
                            bool success = false;
                            for (var fridgeProduct in _products) {
                              success = (await FridgeProductService
                                  .createFridgeProduct(
                                      fridgeProduct.quantity.id,
                                      fridgeProduct.quantity.value,
                                      fridgeProduct.measurement.id ?? 0,
                                      fridgeProduct.measurement.value ?? "",
                                      fridgeProduct.name));
                            }
                            success
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomeScreen();
                                      },
                                    ),
                                  )
                                : _showAlertDialog("Failed to add Fridge Product.");
                          },
                          icon: const Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.green,
                            size: 121,
                          ),
                        )),
                      ),
                    ),
                  ],
                ));
          }
          final item = _products[index];
          final quantityItem = _listOfQuantities[index];
          Widget child = AddProductsItem(
            key: UniqueKey(),
            name: item.name,
            currentMeasurement: item.measurement,
            currentQuantity: item.quantity,
            currentQuantityList: quantityItem,
            animation: _animation,
            onClicked: () => _removeIngredient(index),
            onNameChange: (name) => _onItemNameChange(index, name),
            onMeasurementChange: (Measurement m) =>
                _onItemMeasurementChange(index, m),
            onQuantityChange: (quantity) =>
                _onItemQuantityChange(index, quantity),
            onQuantityListChange: (quantities) =>
                _setQuantitiesList(index, quantities),
          );
          return child;
        },
      ),
    );
  }

  void _setQuantitiesList(int i, List<Quantity> q) {
    _listOfQuantities[i] = q;
  }

  void _addIngredient() {
    _products.add(
      RecipeProduct(
        name: '',
        measurement: Measurement(id: 1, value: "kg"),
        quantity: Quantity(id: 1, value: "1"),
      ),
    );
    _listOfQuantities.add(<Quantity>[Quantity(id: 1, value: "1")]);
    setState(() {});
  }

  void _removeIngredient(int index) {
    _products.removeAt(index);
    _listOfQuantities.removeAt(index);
    setState(() {});
  }

  void _onItemNameChange(int index, String name) {
    _onItemChange(index, tempName: name);
  }

  void _onItemMeasurementChange(int index, Measurement m) {
    _onItemChange(index, measurement: m);
  }

  void _onItemQuantityChange(int index, Quantity quantity) {
    _onItemChange(index, quantity: quantity);
  }

  void _onItemChange(int index,
      {String? tempName, Measurement? measurement, Quantity? quantity}) {
    setState(() {
      // RecipeProduct item = _ingredients[index];
      if (tempName != null) {
        _products[index].name = tempName;
      }
      if (measurement != null) {
        _products[index].measurement = measurement;
      }
      if (quantity != null) {
        _products[index].quantity = quantity;
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
