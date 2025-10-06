import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/onboardingcontroller/onboardingcontroller.dart';
import 'package:ecommerce/view/widget/onboarding/dotcontrolleronboardingwidget.dart';
import 'package:ecommerce/view/widget/onboarding/onboardingbuttonwidget.dart';
import 'package:ecommerce/view/widget/onboarding/slideronboardingwidget.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              Expanded(flex: 4, child: Slideronboardingwidget()),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DotControllerOnboardingWidget(),
                    Spacer(),
                    OnBoardingButtonWidget(),
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
