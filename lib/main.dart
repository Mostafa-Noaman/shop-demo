import 'package:flutter/material.dart';
import 'package:shop_demo/screens/home_screen.dart';
import 'package:shop_demo/screens/update_products_screen.dart';

void main() {
  runApp(const ShopDemo());
}

class ShopDemo extends StatelessWidget {
  const ShopDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        UpdateProductScreen.id: (context) => UpdateProductScreen()
      },
      initialRoute: HomeScreen.id,
    );
  }
}
