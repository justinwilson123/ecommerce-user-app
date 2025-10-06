import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/homescreen/homescreencontroller.dart';
import 'package:ecommerce/controller/search/search_contoller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/view/widget/homescreen/buttonbottomnavigtionbarwidget.dart';

class HomeScreen extends GetView<SearchContoller> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchContoller());
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controllerho) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColor.praimarycolor,
          onPressed: () {
            Get.toNamed(AppRoutes.cartScreen);
          },
          child: const Icon(Icons.badge),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.orange[200],
          shape: const CircularNotchedRectangle(),
          // padding: ,
          notchMargin: 5,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(controllerho.listScreen.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? Expanded(flex: 2, child: Container())
                    : Expanded(
                        flex: 2,
                        child: ButtonBottomNavigtionBarWidget(
                          // text: controller.title[i],
                          onPressed: () {
                            controllerho.gotopage(i);
                          },
                          iconData: controllerho.iconlist[i],
                          color: controllerho.currentPage == i
                              ? AppColor.praimarycolor
                              : AppColor.colorButtonNavigbar,
                        ),
                      );
              }),
            ],
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (controller.search.text != "" ||
                controller.itemseSearh.isNotEmpty) {
              controller.refrish();
              return false;
            }
            Get.defaultDialog(
              title: "50".tr,
              middleText: "60".tr,
              textCancel: "62".tr,
              buttonColor: AppColor.praimarycolor,
              backgroundColor: Colors.white,
              cancelTextColor: AppColor.praimarycolor,
              textConfirm: "61".tr,
              onConfirm: () {
                exit(0);
              },
            );
            return Future.value(true);
          },
          child: controllerho.listScreen.elementAt(controllerho.currentPage),
        ),
      ),
    );
  }
}
