import 'package:shop_demo/helper/api.dart';

import '../models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
