import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/onboardingcontroller/onboardingcontroller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';

class Slideronboardingwidget extends GetView<OnBoardingControllerImp> {
  const Slideronboardingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            const SizedBox(height: 20),
            Text(
              onBoardingList[i].title!,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Image.asset(onBoardingList[i].image!, height: 400, width: 400),
            Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        );
      },
    );
  }
}
