import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/order_details_data.dart';
import 'package:ecommerce/data/model/order_detail_model.dart';
import 'package:ecommerce/data/model/orders_model.dart';
import 'package:ecommerce/view/widget/myorder/rating_items_widet.dart';

abstract class OrderDetailsCotroller extends GetxController {
  getOrderDetails();
  ratingItem(int ratingItemId, double rating, String comment);
}

class OrderDetailsCotrollerImp extends OrderDetailsCotroller {
  OrdersModel? ordersModel;
  late StatusRequst statusRequst;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  List<OrderDetailsModel> myOrderDetails = [];
  MyService myService = Get.find();
  bool rate = false;

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    getOrderDetails();
    super.onInit();
  }

  @override
  getOrderDetails() async {
    statusRequst = StatusRequst.loading;
    myOrderDetails.clear();
    var response = await orderDetailsData.getData(
      ordersModel!.orderId.toString(),
      myService.sharedPreferences.getString("userid")!,
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        myOrderDetails.addAll(
          responsedata.map((e) => OrderDetailsModel.fromJson(e)),
        );
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  ratingItem(int ratingItemId, double rating, String comment) async {
    statusRequst = StatusRequst.loading;

    var response = await orderDetailsData.insertData(
      myService.sharedPreferences.getString("userid")!,
      ratingItemId.toString(),
      rating.toString(),
      comment,
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("success", "item has been rated");
      }
    }
    update();
  }

  itemsFoundOrNot(
    int itemsId,
    BuildContext context,
    int cartItemId,
    String itemImageName,
  ) async {
    var response = await orderDetailsData.foundData(itemsId.toString());
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response["status"] == "success") {
        // ignore: use_build_context_synchronously
        showratingIetemsdialouge(context, cartItemId, itemImageName);
      } else {
        Get.snackbar("alert", "this item has been removerd you can't rate it");
      }
    }
    update();
  }
}
