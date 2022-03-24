import 'dart:convert';

import 'package:butler_chef/models/shop_product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Shop extends StatefulWidget {

  const Shop({Key? key}) : super(key: key);

  @override
  ShopState createState() => ShopState();
}

Future<List<ShopProductModel>> fetchShopProducts () async {
  final response = await http
      .get(Uri.parse('http://10.0.2.2:8080/api/shopProduct/'));

//  print(response.body);
  if (response.statusCode == 200) {
    ShopProductResponse tempRes = ShopProductResponse.fromJson(jsonDecode(response.body));
    return tempRes.data;
  } else {
    throw Exception('Failed to load album');
  }

}

class ShopState extends State<Shop> {
  late List<ShopProductModel> shopProducts = <ShopProductModel>[];

  @override
  void initState() {
    super.initState();
    fetchShopProducts().then((data) {
      setState(() {
        shopProducts = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: shopProducts.map((item) => Text(item.name)).toList()
    );
  }

}