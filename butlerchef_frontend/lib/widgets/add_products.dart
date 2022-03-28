import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/add_products_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ProductType { fridge, recipe, other }

class AddProducts extends StatefulWidget {
  const AddProducts({
    Key? key,
    this.productType = ProductType.fridge,
  }) : super(key: key);

  final ProductType productType;

  @override
  AddProductsState createState() => AddProductsState();
}

class AddProductsState extends State<AddProducts> {
  final key = GlobalKey<AnimatedListState>();

//  int count = -1;

  Widget buildInsertButton() => Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      width: 341,
      height: 41,
      child: ElevatedButton(
        onPressed: () => insertItem(0),
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
      text: const TextSpan(
        children: [
          WidgetSpan(
            child: FaIcon(FontAwesomeIcons.plus,
                color: AppColors.white, size: 21),
          ),
          TextSpan(
              text: " Add Ingredient",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white,
                  letterSpacing: 4)),
        ],
      ),
    ),
  ),
  ),
  );

  Widget buildItem(int index, Animation<double> animation) => AddProductsItem(
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

  void insertItem(int index) {
    key.currentState?.insertItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: AnimatedList(
                padding: const EdgeInsets.symmetric(vertical: 15),
                key: key,
                initialItemCount: 1,
                itemBuilder: (context, index, animation) {
                  return buildItem(index, animation);
                }),
          ),
          Container(
            child: buildInsertButton(),
          ),
          Container(
            height: 21.0,
            width: 321,
            margin: EdgeInsets.only(bottom: 21),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FittedBox(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.green,
                      size: 121,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}