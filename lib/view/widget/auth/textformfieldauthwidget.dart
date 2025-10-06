import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class TextFormFielsAuthWidget extends StatelessWidget {
  final bool obscureText;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final double height;
  const TextFormFielsAuthWidget({
    super.key,
    required this.obscureText,
    this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: TextFormField(
            // cursorHeight: 10,
            validator: validator,
            controller: controller,
            obscureText: obscureText,
            cursorColor: AppColor.praimarycolor,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              alignLabelWithHint: true,
              // hintTextDirection: TextDirection.rtl,
              prefixIcon: prefixIcon,
              prefixIconColor: Colors.pink,
              focusColor: Colors.pink,
              fillColor: Colors.pink,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.pink),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.pink),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.pink),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0, color: Colors.pink),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: height),
      ],
    );
  }
}
