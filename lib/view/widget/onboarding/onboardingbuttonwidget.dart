import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/onboardingcontroller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';

class OnBoardingButtonWidget extends GetView<OnBoardingControllerImp> {
  const OnBoardingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 3),
        color: AppColor.praimarycolor,
        child: Text("10".tr, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
