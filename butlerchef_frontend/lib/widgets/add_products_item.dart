import 'package:flutter/material.dart';
import 'package:butler_chef/utils/styles.dart';
import 'package:butler_chef/utils/app_colors.dart';

import '../models/measurement_quantity_model.dart';
import '../models/quantity_model.dart';
import '../services/measurement_service.dart';

// ProductWidget

class AddProductsItem extends StatefulWidget {
//  final Product item;
  final Animation<double> _animation;
  final VoidCallback _onClicked;
  final String? name;
  final void Function(String name)? onNameChange;
  final void Function(MeasurementWithQuantities measurement)? onMeasurementChange;
  final void Function(Quantity quantity)? onQuantityChange;

  const AddProductsItem({
    Key? key,
    required animation,
    required onClicked,
    this.name,
    this.onNameChange,
    this.onMeasurementChange,
    this.onQuantityChange,
  })  : _animation = animation,
        _onClicked = onClicked,
        super(key: key);

  @override
  AddProductsItemState createState() => AddProductsItemState();
}

class AddProductsItemState extends State<AddProductsItem> {
  late List<MeasurementWithQuantities> measurements = <MeasurementWithQuantities>[];
  late List<Quantity> quantities = <Quantity>[];
  MeasurementWithQuantities dropdownMeasurementValue = MeasurementWithQuantities(
      id: 1, value: 'kg', quantities: [Quantity(id: 1, value: "2")]);
  Quantity dropdownQuantityValue = Quantity(id: 1, value: "2");
  late final TextEditingController _controller;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await MeasurementService.getMeasurements().then((data) {
        setState(() {
          measurements = data;
          quantities = data[0].quantities;
        });
        dropdownMeasurementValue = measurements[0];
        dropdownQuantityValue = quantities[0];
      });
    });
    _controller = TextEditingController(text: widget.name ?? '');
    super.initState();
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
                    decoration:const InputDecoration(
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
                        //Quantity
                        PopupMenuButton<Quantity>(
                          itemBuilder: (context) {
                            return quantities
                                .map<PopupMenuItem<Quantity>>((Quantity quantity) {
                              return PopupMenuItem<Quantity>(
                                value: quantity,
                                child: Text(
                                  quantity.value.toString(),
                                  style: ThemeText.quantityMeasurement,
                                ),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                              Text(
                                dropdownQuantityValue.value.toString(),
                                style: ThemeText.quantityMeasurement,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.green,
                                size: 24,
                              ),
                            ],
                          ),
                          onSelected: (Quantity newValue) {
                            setState(() {
                              dropdownQuantityValue = newValue;
                            });
                            widget.onQuantityChange?.call(newValue);
                            FocusScope.of(context).unfocus();
                          },
                        ),

                        //Measurement
                        PopupMenuButton<MeasurementWithQuantities>(
                          itemBuilder: (context) {
                            return measurements
                                .map<PopupMenuItem<MeasurementWithQuantities>>((MeasurementWithQuantities measurement) {
                              return PopupMenuItem<MeasurementWithQuantities>(
                                value: measurement,
                                child: Text(
                                  measurement.value.toString(),
                                  style: ThemeText.quantityMeasurement,
                                ),
                              );
                            }).toList();
                          },
                          child: Row(
                            children: [
                              Text(
                                dropdownMeasurementValue.value.toString(),
                                style: ThemeText.quantityMeasurement,
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.green,
                                size: 24,
                              ),
                            ],
                          ),
                          onSelected: (MeasurementWithQuantities? newValue) {
                        setState(() {
                        if (newValue != null) {
                        quantities = newValue.quantities;
                        }
                        dropdownQuantityValue = quantities[0];
                        dropdownMeasurementValue = newValue!;
                        });
                        widget.onMeasurementChange?.call(newValue ??
                        MeasurementWithQuantities(
                        id: 1,
                        value: 'kg',
                        quantities: [Quantity(id: 1, value: "2")]));
                        FocusScope.of(context).unfocus();
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
