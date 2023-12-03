import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_demo/models/product_model.dart';
import 'package:shop_demo/services/all_categories_service.dart';
import 'package:shop_demo/services/get_all_product_service.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Trend'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
            future: AllProductService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 60,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        products: products[index],
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

// GridView.builder(
// clipBehavior: Clip.none,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// childAspectRatio: 1.5,
// crossAxisCount: 2,
// crossAxisSpacing: 10,
// mainAxisSpacing: 60,
// ),
// itemBuilder: (context, index) {
// return CustomCard();
// }),

/////////////////////////////////////////////////
// FutureBuilder<List<ProductModel>>(
// future: AllProductService().getAllProducts(),
// builder: (context, snapshot) {
// if (snapshot.hasData) {
// print(snapshot.data);
// return Text('connection done');
// } else if (snapshot.data == null) {
// return Text('data is null');
// } else if (snapshot.hasError) {
// print(snapshot.error);
// return Text(snapshot.error.toString());
// }
// return Text('what the fuck');
// },
// ),
