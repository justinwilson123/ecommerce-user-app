import 'package:flutter/material.dart';
import 'package:ecommerce/core/constant/color.dart';

class CardMyOrderWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final IconData iconData;
  const CardMyOrderWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: AppColor.backgroundcolorcontainer,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: [
              Icon(iconData, color: AppColor.praimarycolor),
              const SizedBox(width: 20),
              Text(title, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
