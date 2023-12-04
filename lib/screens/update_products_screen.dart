import 'package:flutter/material.dart';
import 'package:shop_demo/widgets/custom_button.dart';
import 'package:shop_demo/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatelessWidget {
  UpdateProductScreen({super.key});

  static String id = 'update product';
  String? title, desc, image;
  int? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  price = int.parse(data);
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
              CustomButton(title: 'update', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
