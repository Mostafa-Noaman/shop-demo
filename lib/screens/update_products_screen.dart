import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_demo/models/product_model.dart';
import 'package:shop_demo/services/update_product.dart';
import 'package:shop_demo/widgets/custom_button.dart';
import 'package:shop_demo/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title, desc, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                CustomTextFormField(
                  hintText: 'title',
                  onChanged: (data) {
                    title = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'description',
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'price',
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  hintText: 'image',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 75,
                ),
                CustomButton(
                    title: 'update',
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await updateProduct(product);
                        print('success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        id: product.id,
        title: title == null ? product.title : title!,
        price: price == null ? product.price.toString() : price!,
        image: image == null ? product.image : image!,
        description: desc == null ? product.description : desc!,
        category: product.category);
  }
}
