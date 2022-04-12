import 'package:butler_chef/models/shop_product_model.dart';
import 'package:butler_chef/services/shop_product_service.dart';
import 'package:butler_chef/widgets/shop_product_item.dart';
import 'package:flutter/material.dart';
import 'package:butler_chef/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:butler_chef/screens/cart_screen.dart';
import 'package:butler_chef/constants/styles.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  ShopState createState() => ShopState();
}

class ShopState extends State<Shop> {
  late List<ShopProductModel> shopProducts = <ShopProductModel>[];
  late List<ShopProductItem> selectedProducts = <ShopProductItem>[];
  late List<bool> selected = <bool>[];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await ShopProductService.getShopProducts().then((data) {
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
                                setState(() {
                                  selected[index] = !selected.elementAt(index);
                                  selected[index]
                                      ? selectedProducts
                                          .add(shopProductItems[index])
                                      : selectedProducts.removeWhere(
                                          (item) => item.productName == shopProductItems[index].productName);
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
                        MaterialPageRoute(
                            builder: (context) => CartScreen(
                                  selectedProducts: selectedProducts,
                                )),
//                        MaterialPageRoute(builder: (context) => const CartScreen()),
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
