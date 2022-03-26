import 'dart:convert';
import 'package:butler_chef/models/shop_product_model.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';
import 'package:butler_chef/widgets/address.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
//  final List<ShopProductModel> _selectedProducts;
//  const CartScreen({Key? key, required selectedProducts})
//      : _selectedProducts = selectedProducts,
//        super(key: key);
  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

//Future<List<AddressModel>> fetchAddress() async {
//  final response =
//  await http.get(Uri.parse('http://10.0.2.2:8080/api/address/'));
//
////  print(response.body);
//  if (response.statusCode == 200) {
//    ShopProductResponse tempRes =
//    ShopProductResponse.fromJson(jsonDecode(response.body));
//    return tempRes.data;
//  } else {
//    throw Exception('Failed to load album');
//  }
//}

class CartScreenState extends State<CartScreen> {
  List<int> count = <int>[];
  List<bool> selected = <bool>[];
  String dropdownValue = "Cash On Delivery";
  var paymentOptions = ["Cash On Delivery"];


  @override
  void initState() {

    count = [1, 1, 1];
    selected = [false, false, false];
    super.initState();
  }

  Icon notSelectedIcon =
      const Icon(Icons.check_circle, color: AppColors.grayIcon, size: 35);
  Icon selectedIcon =
      const Icon(Icons.check_circle, color: AppColors.green, size: 35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 181,
                  child: Image.asset(
                    'assets/images/checkout.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 181,
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
                  height: 181,
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
                SizedBox(
                  height: 181,
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 41,
                        color: AppColors.black,
                      ),
                      padding: const EdgeInsets.fromLTRB(8, 18, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              children: [
                const Text('Basket',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 235,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      height: 32,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                                    if (count[index] > 1) {
                                                      count[index]--;
                                                    }
                                                  })
                                                },
                                              )),
                                          Text(count[index].toString(),
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
//                                            if (count[index]<=stock){
//
//                                            }
                                                    count[index]++;
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
                                    onPressed: () => {})),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                const Text('Delivery To',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 307,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return
                           Address();
//                          Align(
//                              alignment: Alignment.topRight,
//                              child: IconButton(
//                                  icon: selected.elementAt(index)
//                                      ? selectedIcon
//                                      : notSelectedIcon,
//                                  onPressed: () => {
//                                        setState(() => {
//                                              selected[index] =
//                                                  !selected.elementAt(index)
//                                            })
//                                      })),


                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
                const Text('Payment Method',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w800)),
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
                            ))))
              ],
            )),
          ],
        ));
  }
}
