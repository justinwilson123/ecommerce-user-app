import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowMoreImagController extends GetxController {
  late List imagesName;
  late PageController pageController;

  @override
  void onInit() {
    imagesName = Get.arguments["imagesName"];
    pageController = PageController(initialPage: 0);
    super.onInit();
  }
}
