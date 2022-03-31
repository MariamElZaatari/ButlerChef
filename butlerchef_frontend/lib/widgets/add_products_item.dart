import 'package:butler_chef/models/measurement_model.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/constants/styles.dart';
import 'package:butler_chef/constants/app_colors.dart';

import '../models/measurement_quantity_model.dart';
import '../models/quantity_model.dart';
import '../services/measurement_service.dart';

// ProductWidget

class AddProductsItem extends StatefulWidget {
//  final Product item;
  final Animation<double> _animation;
  final VoidCallback _onClicked;
  final String? name;
  final void Function(String name) onNameChange;
  final void Function(Measurement measurement) onMeasurementChange;
  final void Function(Quantity quantity)? onQuantityChange;
  final void Function(List<Quantity> quantities)? onQuantityListChange;

  final Measurement? currentMeasurement;
  final Quantity? currentQuantity;
  final List<Quantity>? currentQuantityList;

  const AddProductsItem({
    Key? key,
    required animation,
    required onClicked,
    this.name,
    this.currentMeasurement,
    this.currentQuantity,
    this.currentQuantityList,
    required this.onNameChange,
    required this.onMeasurementChange,
    this.onQuantityChange,
    this.onQuantityListChange,
  })  : _animation = animation,
        _onClicked = onClicked,
        super(key: key);

  @override
  AddProductsItemState createState() => AddProductsItemState();
}

class AddProductsItemState extends State<AddProductsItem> {
  late final TextEditingController _controller;

  late List<MeasurementWithQuantities> measurementsData = <MeasurementWithQuantities>[];
  late List<Quantity> selectedQuantityList = <Quantity>[Quantity(id: 0, value: "1")];
  late Measurement selectedMeasurement = Measurement(id: 0, value: "kg");
  late Quantity selectedQuantity = Quantity(id: 0, value: "1");

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await MeasurementService.getMeasurements().then((data) {
        setState(() {
          measurementsData = data;
          selectedQuantityList = widget.currentQuantityList ?? data[0].quantities;
          selectedMeasurement = widget.currentMeasurement ?? Measurement(id: data[0].id, value: data[0].value);
          selectedQuantity = widget.currentQuantity ?? Quantity(id: selectedQuantityList[0].id, value: selectedQuantityList[0].value);
        });
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
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextField(
//                        key: ValueKey(1),
                    key: UniqueKey(),
                    controller: _controller,
                    onEditingComplete: () {
                      widget.onNameChange(_controller.text);
                      widget.onQuantityListChange!(selectedQuantityList);
                    },
                    textAlign: TextAlign.left,
                    style: ThemeText.productName,
                    decoration: const InputDecoration(
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
                            return selectedQuantityList.map<PopupMenuItem<Quantity>>(
                                    (Quantity quantity) {
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
                                selectedQuantity.value.toString(),
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
                              selectedQuantity = newValue;
                            });
                            widget.onQuantityChange!(selectedQuantity);
                            widget.onQuantityListChange!(selectedQuantityList);
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),

                        //Measurement
                        PopupMenuButton<MeasurementWithQuantities>(
                          itemBuilder: (context) {
                            return measurementsData
                                .map<PopupMenuItem<MeasurementWithQuantities>>(
                                    (MeasurementWithQuantities measurement) {
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
                                selectedMeasurement.value.toString(),
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
                        selectedMeasurement = Measurement(id: newValue.id, value: newValue.value);
                        selectedQuantityList = newValue.quantities;
                        selectedQuantity = Quantity(id: selectedQuantityList[0].id, value: selectedQuantityList[0].value);
                        }
                        });
                        widget.onQuantityChange!(selectedQuantity);
                        widget.onMeasurementChange(selectedMeasurement);
                        widget.onQuantityListChange!(selectedQuantityList);
                        FocusScope.of(context).requestFocus(FocusNode());
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