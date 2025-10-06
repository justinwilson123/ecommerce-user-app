import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:ecommerce/controller/myorder/order_details_cotroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

showratingIetemsdialouge(
  BuildContext context,
  int ratingItemId,
  String itemsImage,
) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        '124'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: AppColor.praimarycolor,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        "139".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, color: AppColor.praimarycolor),
      ),
      // your app's logo?
      image: CachedNetworkImage(
        imageUrl: "${Applink.linkImageItem}$itemsImage",
      ),
      submitButtonText: '124'.tr,
      submitButtonTextStyle: const TextStyle(color: AppColor.praimarycolor),
      commentHint: "140".tr,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrderDetailsCotrollerImp controller = Get.find();
        controller.ratingItem(ratingItemId, response.rating, response.comment);
      },
    ),
  );
}
