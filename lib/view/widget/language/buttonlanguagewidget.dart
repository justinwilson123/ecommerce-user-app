import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class ButtonLanguageWidget extends StatelessWidget {
  final String text;
  final double horizontal;
  final void Function()? onPressed;
  const ButtonLanguageWidget({
    super.key,
    required this.text,
    required this.horizontal,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.praimarycolor,
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 3),
      child: Text(text),
    );
  }
}
