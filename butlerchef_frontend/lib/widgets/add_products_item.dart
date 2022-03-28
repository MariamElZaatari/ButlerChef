import 'package:flutter/material.dart';
import 'package:butler_chef/utils/styles.dart';
import 'package:butler_chef/utils/app_colors.dart';

// ProductWidget

class AddProductsItem extends StatefulWidget {
//  final Product item;
  final Animation<double> _animation;
  final VoidCallback _onClicked;
  final String? name;
  final String? quantity;
  final String? measurement;
  final void Function(String name)? onNameChange;
  final void Function(String measurement)? onMeasurementChange;
  final void Function(String quantity)? onQuantityChange;
  final List<String> measurements;
  final List<String> quantities;

  const AddProductsItem({
    Key? key,
    required animation,
    required onClicked,
    this.name,
    this.quantity,
    this.measurement,
    this.onNameChange,
    this.onMeasurementChange,
    this.onQuantityChange,
    this.measurements = const ['kg', 'dz', 'g', 'can'],
    this.quantities = const ['1', '2', '3', '4'],
  })  : _animation = animation,
        _onClicked = onClicked,
        super(key: key);

  @override
  AddProductsItemState createState() => AddProductsItemState();
}

class AddProductsItemState extends State<AddProductsItem> {
  String dropdownQuantityValue = '1';
  String dropdownMeasurementValue = 'kg';
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.name ?? '');
    dropdownQuantityValue = widget.quantity ?? '1';
    dropdownMeasurementValue = widget.measurement ?? 'kg';
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: widget._animation,
          curve: Curves.bounceIn,
          reverseCurve: Curves.bounceOut,
        ),
      ),
//      sizeFactor: widget._animation,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextField(
//                        key: ValueKey(1),
                    controller: _controller,
                    onEditingComplete: () =>
                        widget.onNameChange?.call(_controller.text),
                    textAlign: TextAlign.left,
                    style: ThemeText.productName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Product...",
                      hintStyle: TextStyle(
                        color: AppColors.placeholder,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: widget._onClicked,
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft),
                      child: const Text(
                        "Remove",
                        style: TextStyle(
                            color: AppColors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 19),
                      ),
                    ),
                    Row(
                      children: [
                        PopupMenuButton<String>(
                          itemBuilder: (context) {
                            return widget.quantities
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: ThemeText.quantityMeasurement,
                                ),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                              Text(
                                dropdownQuantityValue,
                                style: ThemeText.quantityMeasurement,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.green,
                                size: 24,
                              ),
                            ],
                          ),
                          onSelected: (String? newValue) {
                        setState(() {
                        dropdownQuantityValue = newValue!;
                        });
                        widget.onQuantityChange?.call(newValue ?? '1');
                        FocusScope.of(context).unfocus();
                        },
                        ),
                        const SizedBox(width: 12),
                        PopupMenuButton<String>(
                          itemBuilder: (context) {
                            return widget.measurements
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: ThemeText.quantityMeasurement,
                                ),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                              Text(
                                dropdownMeasurementValue,
                                style: ThemeText.quantityMeasurement,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.green,
                                size: 24,
                              ),
                            ],
                          ),
                          onSelected: (String? newValue) {
                        setState(() {
                        dropdownMeasurementValue = newValue!;
                        });
                        FocusScope.of(context).unfocus();
                        widget.onMeasurementChange?.call(newValue ?? 'kg');
                        },
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
