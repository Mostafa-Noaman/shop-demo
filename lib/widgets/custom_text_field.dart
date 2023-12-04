import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.inputType, this.hintText, this.onChanged});

  String? hintText;
  Function(String)? onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: '$hintText',
        hintStyle: const TextStyle(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
