import 'package:flutter/material.dart';
import 'package:butler_chef/utils/styles.dart';
import 'package:butler_chef/utils/app_colors.dart';

// ProductWidget

class AddProductsItem extends StatefulWidget {
//  final String productName;
//  final String quantity;
//  final String measurement;

  const AddProductsItem({
    Key? key,
//    required this.productName,
//    required this.quantity,
//    required this.measurement,
  }) : super(key: key);

  @override
  AddProductsItemState createState() => AddProductsItemState();
}
class AddProductsItemState extends State<AddProductsItem> {
  String dropdownQuantityValue = '1';
  String dropdownMeasurementValue = 'kg';

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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Align(
                    alignment: Alignment.topLeft,
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: ThemeText.productName,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Product...",
                          hintStyle: TextStyle(
                              color: AppColors.placeholder,
                              fontWeight: FontWeight.w500,
                              fontSize: 20)),
                    )),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                        onPressed: () => {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft),
                        child: const Text(
                          "Remove",
                          style: TextStyle(
                              color: AppColors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 19),
                        )),
                    Row(
                      children: [
                        PopupMenuButton<String>(
                          itemBuilder: (context){
                            return <String>['1', '2', '3', '4']
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(value, style: ThemeText.quantityMeasurement,),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                              Text(dropdownQuantityValue, style: ThemeText.quantityMeasurement,),
                              const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.green, size: 24,),
                            ],
                          ),
                          onSelected: (String? newValue) {
                        setState(() {
                        dropdownQuantityValue = newValue!;
                        });
                        },

                        ),
                        const SizedBox(width: 12),
                        PopupMenuButton<String>(
                          itemBuilder: (context){
                            return <String>['kg', 'dz', 'g', 'can']
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(value, style: ThemeText.quantityMeasurement,),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                            Text(dropdownMeasurementValue, style: ThemeText.quantityMeasurement,),
                            const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.green, size: 24,),
                          ],
                          ),
                          onSelected: (String? newValue) {
                        setState(() {
                        dropdownMeasurementValue = newValue!;
                        });
                        },

                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
