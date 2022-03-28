import 'package:butler_chef/models/recipe_ingredient.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/add_products_item.dart';
import 'package:flutter/material.dart';

class PostRecipeIngredients extends StatefulWidget {
  const PostRecipeIngredients({
    Key? key,
    this.ingredients = const [],
    this.onIngredientsChange,
  }) : super(key: key);
  final List<RecipeIngredient> ingredients;
  final void Function(List<RecipeIngredient> ingredients)? onIngredientsChange;

  @override
  PostRecipeIngredientsState createState() => PostRecipeIngredientsState();
}

class PostRecipeIngredientsState extends State<PostRecipeIngredients>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final List<RecipeIngredient> _ingredients = [];
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _ingredients.addAll(widget.ingredients);
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
        itemCount: _ingredients.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == _ingredients.length) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                  onPressed: _addIngredient,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('add ingradient'),
                    ],
                  )),
            );
          }
          final item = _ingredients[index];
          Widget child = AddProductsItem(
            key: UniqueKey(),
            name: item.name,
            quantity: item.quantity.toString(),
            measurement: item.measurement,
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
    _ingredients.add(
      RecipeIngredient(
        name: '',
        measurement: 'kg',
        quantity: '0',
      ),
    );
    setState(() {});
  }

  void _removeIngredient(int index) {
    _ingredients.removeAt(index);
    setState(() {});
  }

  void _onItemNameChange(int index, String name) {
    _onItemChange(index, name: name);
  }

  void _onItemMeasurementChange(int index, String measurement) {
    _onItemChange(index, measurement: measurement);
  }

  void _onItemQuantityChange(int index, String quantity) {
    _onItemChange(index, quantity: quantity);
  }

  void _onItemChange(
      int index, {
        String? name,
        String? measurement,
        String? quantity,
      }) {
    print('call');
    setState(() {
      final item = _ingredients[index];
      _ingredients[index] = RecipeIngredient(
          name: name ?? item.name,
          quantity: quantity ?? item.quantity,
          measurement: measurement ?? item.measurement);
    });
    print(_ingredients[index].name);
    widget.onIngredientsChange?.call(_ingredients);
  }

  @override
  bool get wantKeepAlive => true;
}
