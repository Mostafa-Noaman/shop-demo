import 'package:dio/dio.dart';
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
    final Response response =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    });

    return ProductModel.fromJson(response.data);
  }
}
