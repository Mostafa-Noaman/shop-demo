import 'package:shop_demo/helper/api.dart';

import '../models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      ProductModel.fromJson(data[i]);
    }

    return productList;
  }
}
