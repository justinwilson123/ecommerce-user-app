import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/view/screen/homepage/homepage.dart';
import 'package:ecommerce/view/screen/offerpage/offer_page_screen.dart';
import 'package:ecommerce/view/screen/orderscreen/my_order_screen.dart';
import 'package:ecommerce/view/screen/setting/setting_screen.dart';

abstract class HomeScreenController extends GetxController {
  gotopage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> listScreen = [
    const HomePage(),
    const OfferPageScreen(),
    const SettingScreen(),
    const MyOrderScreen(),
  ];

  List<String> title = ["68".tr, "69".tr, "70".tr, "71".tr];
  List<IconData> iconlist = [
    Icons.home,
    Icons.shopping_basket_sharp,
    Icons.settings,
    Icons.shopping_cart,
  ];

  @override
  gotopage(int i) {
    currentPage = i;
    update();
  }
}
