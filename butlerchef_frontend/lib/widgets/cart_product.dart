import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:butler_chef/utils/app_colors.dart';

// ProductWidget

class CartProductItem extends StatefulWidget {
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

  const CartProductItem({
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
  CartProductItemState createState() => CartProductItemState();
}

class CartProductItemState extends State<CartProductItem> {
  int count=1;
  String dropdownQuantityValue = '1';
  String dropdownMeasurementValue = 'kg';

  @override
  void initState() {
    super.initState();
    count = 1;
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
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          width: 200,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      const ShopProductItem(
                          productName: "test",
                          image: "",
                          quantity: "test",
                          measurement: "test",
                          price: 21.0),
                      Container(
                        width: 171,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: AppColors.red,
                                  ),
                                  onPressed: () => {
                                    setState(() {
                                      if (count> 1) {
                                        count--;
                                      }
                                    })
                                  },
                                )),
                            Text(count.toString(),
                                style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.brown)),
                            Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: AppColors.green,
                                  ),
                                  onPressed: () => {
                                    setState(() {
                                      count++;
                                    })
                                  },
                                )),
                          ],
                        ),
                      )
                    ],
                  )),
              Positioned(
                  right: -12,
                  top: -21,
                  child: IconButton(
                      icon: const Icon(
                        Icons.remove_circle_rounded,
                        color: AppColors.red,
                        size: 35,
                      ),
                      onPressed: () => widget._onClicked)),
            ],
          ),
        ));
  }
}
