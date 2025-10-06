import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class TextFormFiledLocationWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final int? maxline;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const TextFormFiledLocationWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.validator,
    this.maxline,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          maxLines: maxline,
          controller: controller,
          cursorColor: AppColor.praimarycolor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, color: Colors.grey[400]),
            prefixIcon: Icon(icon),
            filled: true,
            fillColor: AppColor.backgroundcolorcontainer,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
