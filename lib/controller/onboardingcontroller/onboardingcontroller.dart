import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int i);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  MyService myService = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myService.sharedPreferences.setString("step", "1");
      Get.offNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    }
  }

  @override
  onPageChanged(int i) {
    currentPage = i;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
