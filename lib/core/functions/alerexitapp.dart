import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';

Future<bool> alerExitApp() async {
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
}
