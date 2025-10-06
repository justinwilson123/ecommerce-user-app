import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/cart/cart_data.dart';
import 'package:ecommerce/data/model/coupon_model.dart';
import 'package:ecommerce/data/model/view_cart_model.dart';

abstract class CartController extends GetxController {
  getViewCart();
  removecountcart(itemid);
  addcountcart(itemid, itemPrice, itemNameEn, itemNameAr, itemImageName);
  addCouponToCard();
  goToCheckoutPage();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  late StatusRequst statusRequst;
  MyService myService = Get.find();
  // ItemDetailControllerImp controllerImp = Get.put(ItemDetailControllerImp());
  List<ViewCartModel> dataview = [];
  TextEditingController? searshCoupon;
  CouponModel? couponModel;
  double? discountCoupon = 0.0;

  int sumitems = 0;
  double totaleprices = 0.0;
  int count = 0;
  String couponName = "no coupon";

  @override
  getViewCart() async {
    statusRequst = StatusRequst.loading;
    var response = await cartData.viewcart(
      myService.sharedPreferences.getString("userid"),
    );
    statusRequst = handlingData(response);
    dataview.clear();
    sumitems = 0;
    totaleprices = 0.0;

    // update()
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List responsdata = response["viewcart"];
        dataview.addAll(responsdata.map((e) => ViewCartModel.fromJson(e)));
        Map datacountpric = response['pricecount'];
        sumitems = datacountpric["sumitems"];
        totaleprices = double.parse(datacountpric["sumprice"]) + 0.0;

        // totaleprices = double.parse(sumpir.replaceAll(",", ""));

        update();
      } else {
        Get.snackbar("152".tr, "153".tr, duration: const Duration(seconds: 3));
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  removecountcart(itemid) async {
    var response = await cartData.deletecart(
      myService.sharedPreferences.getString("userid"),
      itemid.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        update();
        getViewCart();
        Get.snackbar(
          "152".tr,
          "154".tr,
          duration: const Duration(milliseconds: 800),
        );
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    // }
  }

  @override
  addcountcart(itemid, itemPrice, itemNameEn, itemNameAr, itemImageName) async {
    // controllerImp.addcount(itemid);
    var response = await cartData.addfcart(
      myService.sharedPreferences.getString("userid").toString(),
      itemid.toString(),
      itemPrice.toString(),
      itemNameEn.toString(),
      itemNameAr.toString(),
      itemImageName.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        update();
        getViewCart();
        Get.snackbar(
          "152".tr,
          "155".tr,
          duration: const Duration(milliseconds: 800),
        );
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
  }

  @override
  addCouponToCard() async {
    var response = await cartData.addCoupon(searshCoupon!.text);
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      discountCoupon = 0;
      if (response['status'] == "success") {
        Map<String, dynamic> responseData = response['data'];
        couponModel = CouponModel.fromJson(responseData);
        discountCoupon = couponModel!.couponDisacount;
        couponName = couponModel!.couponName!;
        Get.snackbar(
          "152".tr,
          "156".tr,
          duration: const Duration(milliseconds: 800),
        );
      } else {
        Get.snackbar(
          "152".tr,
          "157".tr,
          duration: const Duration(milliseconds: 800),
        );
      }
    }
    update();
  }

  getTotalePrices() {
    return (totaleprices - totaleprices * discountCoupon! / 100);
  }

  @override
  void onInit() {
    searshCoupon = TextEditingController();
    getViewCart();
    super.onInit();
  }

  @override
  goToCheckoutPage() {
    if (totaleprices == 0) {
      return Get.snackbar("50".tr, "158".tr);
    } else {
      Get.toNamed(
        AppRoutes.checkOut,
        arguments: {
          "totaleprices": totaleprices,
          "ordertotaleprice": getTotalePrices(),
          "couponName": couponName,
        },
      );
    }
  }
}
