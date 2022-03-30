import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:butler_chef/widgets/address_list.dart';
import 'package:butler_chef/widgets/custom_back_button.dart';
import 'package:butler_chef/widgets/cart_product_list.dart';

class CartScreen extends StatefulWidget {
//  final List<ShopProductModel> _selectedProducts;
//  const CartScreen({Key? key, required selectedProducts})
//      : _selectedProducts = selectedProducts,
//        super(key: key);
  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  String dropdownValue = "Cash On Delivery";
  var paymentOptions = ["Cash On Delivery"];

  @override
  void initState() {
    super.initState();
  }

//
  Icon notSelectedIcon =
      const Icon(Icons.check_circle, color: AppColors.grayIcon, size: 35);
  Icon selectedIcon =
      const Icon(Icons.check_circle, color: AppColors.green, size: 35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          //Image Banner and Title
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 141,
                child: Image.asset(
                  'assets/images/checkout.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 141,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment
                          .bottomCenter, // 10% of the width, so there are ten blinds.
                      stops: [0.1, 0.5, 0.9],
                      colors: <Color>[
                        Color(0x00000000),
                        Color(0x66000000),
                        Color(0x00000000),
                      ], // red to yellow // repeats the gradient over the canvas
                    ),
                  )),
              SizedBox(
                height: 141,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    'CHECKOUT',
                    style: TextStyle(
                        fontSize: 41,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                        color: AppColors.white),
                  ),
                ),
              ),
              const CustomBackButton(),
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(children: [
                //Basket Title
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text('Basket',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                ),
                //Basket Items
                const SizedBox(
                  height: 245,
                  child: CartProductList(),
                ),

                //Delivery To Title
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text('Delivery To',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                ),
                //Delivery To Items
                const SizedBox(
                  height: 350,
                  child: AddressList(),
                ),

                //Payment Method Title
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text('Payment Method',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                ),
                //Payment Method DropDown
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 92),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownValue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.arrow_drop_down_rounded,
                            color: AppColors.green, size: 41),

                        // Array list of items
                        items: paymentOptions.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: AppColors.brown),
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    )),

                //Place Order Button
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        width: 341,
                        height: 41,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.green),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed)) {
                                    return AppColors.white.withOpacity(0.12);
                                  }
                                  return null;
                                },
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Total",
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white,
                                      )),
                                  TextSpan(text: "        "),
                                  TextSpan(
                                      text: "Place Order",
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                          letterSpacing: 4)),
                                  TextSpan(text: "        "),
                                  TextSpan(
                                      text: "\$9.00",
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.white,
                                      )),
                                ],
                              ),
                            )))),
              ])),
        ],
      ),
    );
  }
}
