import '../helper/api.dart';
import '../models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'image': image,
      'description': description,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
