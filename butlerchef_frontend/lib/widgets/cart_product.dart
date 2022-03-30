import 'package:flutter/material.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/models/measurement_model.dart';
import 'package:butler_chef/models/quantity_model.dart';

class CartProductItem extends StatefulWidget {
  final Animation<double> _animation;
  final VoidCallback _onClicked;
  final String name;
  final Quantity quantity;
  final Measurement measurement;
  final double price;
  final String image;

  const CartProductItem({
    Key? key,
    required animation,
    required onClicked,
    required this.name,
    required this.image,
    required this.quantity,
    required this.measurement,
    required this.price,
  })  : _animation = animation,
        _onClicked = onClicked,
        super(key: key);

  @override
  CartProductItemState createState() => CartProductItemState();
}

class CartProductItemState extends State<CartProductItem> {
  int count=1;

  @override
  void initState() {
    super.initState();
    count = 1;
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
                      ShopProductItem(
                          productName: "test",
                          image: "",
                          quantity: widget.quantity,
                          measurement: widget.measurement,
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
