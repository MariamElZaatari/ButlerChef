import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/add_products_item.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/models/quantity_model.dart';
import 'package:butler_chef/models/measurement_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/recipe_product_model.dart';
import 'package:butler_chef/constants/styles.dart';

class PostRecipeIngredients extends StatefulWidget {

  final Function(List<RecipeProduct>) callback;

  const PostRecipeIngredients({
    Key? key,
    this.ingredients = const [],
    this.onIngredientsChange,
    required this.callback,
  }) : super(key: key);
  final List<RecipeProduct> ingredients;
  final void Function(List<RecipeProduct> ingredients)? onIngredientsChange;

  @override
  PostRecipeIngredientsState createState() => PostRecipeIngredientsState();
}

class PostRecipeIngredientsState extends State<PostRecipeIngredients>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final List<RecipeProduct> _ingredients = [];
  late final List<List<Quantity>> _listOfQuantities = [];
  late final Animation<double> _animation;


  @override
  void initState() {
    super.initState();
    _ingredients.addAll(widget.ingredients);
    _animation = AnimationController(vsync: this, value: 1);
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      widget.callback(_ingredients);
    });
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
        itemCount: _ingredients.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _ingredients.length) {
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
          final item = _ingredients[index];
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
    _ingredients.add(
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
    _ingredients.removeAt(index);
    _listOfQuantities.removeAt(index);
    setState(() {});
  }

  void _onItemNameChange(int index, String name) {
    _onItemChange(index, tempName: name);
  }

  void _onItemMeasurementChange(
      int index, Measurement m) {
    _onItemChange(index, measurement: m);
  }

  void _onItemQuantityChange(int index, Quantity quantity) {
    _onItemChange(index, quantity: quantity);
  }

  void _onItemChange(
      int index, {
        String? tempName,
        Measurement? measurement,
        Quantity? quantity
      }) {

    setState(() {
      if(tempName != null){
        _ingredients[index].name = tempName;
      }
      if(measurement != null){
        _ingredients[index].measurement = measurement;
      }
      if(quantity != null){
        _ingredients[index].quantity = quantity;
      }

    });
  }

  @override
  bool get wantKeepAlive => true;
}