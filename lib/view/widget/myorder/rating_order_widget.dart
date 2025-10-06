import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:ecommerce/controller/myorder/orders_archive_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';

showratingdialouge(BuildContext context, int orderid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        "124".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.praimarycolor,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        "141".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, color: AppColor.praimarycolor),
      ),
      // your app's logo?
      image: Image.asset(AppImageAsset.testimage1),
      submitButtonText: "124".tr,
      submitButtonTextStyle: const TextStyle(color: AppColor.praimarycolor),
      commentHint: "140".tr,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrdersArchiveControllerImp controller = Get.find();
        controller.ratingOrder(orderid, response.rating, response.comment);
      },
    ),
  );
}
