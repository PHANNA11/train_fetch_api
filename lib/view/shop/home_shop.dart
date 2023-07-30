import 'package:fetch_aip/controller/product_controller.dart';
import 'package:fetch_aip/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeShop extends StatefulWidget {
  const HomeShop({super.key});

  @override
  State<HomeShop> createState() => _HomeShopState();
}

class _HomeShopState extends State<HomeShop> {
  List<Product> products = [];
  getProduct() async {
    products = await ProductController().getProduct();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeShop'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            initiallyExpanded: true,
            title: Text(products[index].title),
            children: [Image(image: NetworkImage(products[index].image))],
          );
        },
      ),
    );
  }
}
