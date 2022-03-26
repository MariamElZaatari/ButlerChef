import 'package:flutter/material.dart';
import 'package:butler_chef/utils/styles.dart';

// ProductWidget

class FridgeProductItem extends StatelessWidget {
  final String productName;
  final String quantity;
  final String measurement;

  const FridgeProductItem({
    Key? key,
    required this.productName,
    required this.quantity,
    required this.measurement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  productName,
                  textAlign: TextAlign.left,
                  style: ThemeText.productName,
                )),
            const SizedBox(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  quantity,
                  style: ThemeText.quantityMeasurement,
                ),
                SizedBox(width: 12),
                Text(
                  measurement,
                  style: ThemeText.quantityMeasurement,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
