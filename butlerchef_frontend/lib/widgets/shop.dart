import 'dart:convert';
import 'package:butler_chef/models/shop_product_model.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:butler_chef/screens/cart_screen.dart';
import 'package:http/http.dart' as http;

import 'package:butler_chef/constants/styles.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  ShopState createState() => ShopState();
}

Future<List<ShopProductModel>> fetchShopProducts() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/api/shopProduct/'));

//  print(response.body);
  if (response.statusCode == 200) {
    ShopProductResponse tempRes =
        ShopProductResponse.fromJson(jsonDecode(response.body));
    return tempRes.data;
  } else {
    throw Exception('Failed to load album');
  }
}

class ShopState extends State<Shop> {
  late List<ShopProductModel> shopProducts = <ShopProductModel>[];
  late List<ShopProductModel> selectedProducts = <ShopProductModel>[];
  late List<bool> selected = <bool>[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await fetchShopProducts().then((data) {
        setState(() {
          shopProducts = data;
        });
      });
      for (var i = 0; i < shopProducts.length; i++) {
        selected.add(false);
      }
    });
    super.initState();
  }

  Icon notSelectedIcon =
      const Icon(Icons.add_circle, color: AppColors.grayIcon, size: 35);
  Icon selectedIcon =
      const Icon(Icons.check_circle, color: AppColors.green, size: 35);

  @override
  Widget build(BuildContext context) {
    List<ShopProductItem> shopProductItems = shopProducts
        .map((item) => ShopProductItem(
            productName: item.name,
            image: item.imageUrl,
            quantity: item.quantity,
            measurement: item.measurement,
            price: item.price))
        .toList();

    return Center(
        child: Stack(
      children: [
        GridView.builder(
            padding: const EdgeInsets.fromLTRB(18, 41, 0, 21),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 1,
                mainAxisSpacing: 5),
            itemCount: shopProductItems.length,
            itemBuilder: (BuildContext ctx, index) {
              return Center(
                  child: Stack(
                children: [
                  shopProductItems[index],
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: selected.elementAt(index)
                              ? selectedIcon
                              : notSelectedIcon,
                          onPressed: () => {
                                setState(() => {
                                      selected[index] =
                                          !selected.elementAt(index)
                                    })
                              })),
                ],
              ));
            }),
        Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: 341,
                height: 41,
                child: ElevatedButton(
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
                    onPressed: () {
                      Navigator.push(
                        context,
//                        MaterialPageRoute(
//                            builder: (context) => CartScreen(
//                                  selectedProducts: selectedProducts,
//                                )),
                        MaterialPageRoute(builder: (context) => const CartScreen()),
                      );
                    },
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                            child: FaIcon(FontAwesomeIcons.shoppingBasket,
                                color: AppColors.white, size: 21),
                          ),
                          TextSpan(
                              text: " View Basket",
                              style: ThemeText.buttonText),
                        ],
                      ),
                    ))))
      ],
    ));
  }
}
