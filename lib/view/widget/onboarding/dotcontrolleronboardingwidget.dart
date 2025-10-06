import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/onboardingcontroller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';

class DotControllerOnboardingWidget extends StatelessWidget {
  const DotControllerOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put()
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (i) => AnimatedContainer(
              margin: const EdgeInsets.all(2),
              duration: const Duration(microseconds: 300),
              width: controller.currentPage == i ? 10 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.praimarycolor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
