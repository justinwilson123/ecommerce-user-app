import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';

class ButtonSignupWithGoogle extends StatelessWidget {
  final Color? buttoncolor;
  final double horizontal;
  final double vertiacl;
  final double radius;
  final Function() onPressed;
  const ButtonSignupWithGoogle({
    super.key,
    this.buttoncolor,
    required this.horizontal,
    required this.vertiacl,
    required this.radius,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1.5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertiacl),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.praimarycolor, width: 1),
        borderRadius: BorderRadius.circular(radius),
        color: buttoncolor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Text(textAlign: TextAlign.center, "11".tr),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                AppImageAsset.googleimage,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
