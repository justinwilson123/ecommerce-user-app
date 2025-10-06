import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class CheckoutTitleWidget extends StatelessWidget {
  final String title;
  const CheckoutTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(color: AppColor.praimarycolor));
  }
}
