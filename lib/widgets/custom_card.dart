import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_demo/models/product_model.dart';
import 'package:shop_demo/screens/update_products_screen.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.products});
  ProductModel products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: products);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    offset: const Offset(5, 5),
                    blurRadius: 20),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      products.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$ ' '${products.price.toString()}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 80,
            bottom: 80,
            child: Image.network(
              products.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
