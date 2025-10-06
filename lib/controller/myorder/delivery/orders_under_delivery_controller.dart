import 'package:ecommerce/data/model/order_under_delivery_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/delivery/orders_under_delivery_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class OrdersUnderDeliveryCotoller extends GetxController {
  Future<void> getOrdersUnderDelivery();
  void goToOrderDetail(OrderUnderDeliveryModel ordersModel);
  void goToTrackingOrder(
    double lat,
    double long,
    int deliveryId,
    String deliveryName,
    String deliveryPhone,
  );
}

class OrdersUnderDeliveryCotollerImp extends OrdersUnderDeliveryCotoller {
  MyService myService = Get.find();
  late StatusRequst statusRequst;
  OrdersUnderDeliveryData ordersUnderDeliveryData = OrdersUnderDeliveryData(
    Get.find(),
  );
  List<OrderUnderDeliveryModel> myorderunderdelivery = [];

  @override
  getOrdersUnderDelivery() async {
    statusRequst = StatusRequst.loading;
    myorderunderdelivery.clear();
    var response = await ordersUnderDeliveryData.getData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List respnsedata = response["data"];
        myorderunderdelivery.addAll(
          respnsedata.map((e) => OrderUnderDeliveryModel.fromJson(e)),
        );
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  goToOrderDetail(OrderUnderDeliveryModel orderUnder) {
    final ordersModel = OrdersModel(
      orderId: orderUnder.orderId,
      orderUserid: orderUnder.orderUserid,
      orderLocation: orderUnder.orderLocation,
      orderTypeDelivery: orderUnder.orderTypeDelivery,
      orderPricedelivery: orderUnder.orderPricedelivery,
      orderPrice: orderUnder.orderPrice,
      orderCoupon: orderUnder.orderCoupon,
      orderPaymentmethod: orderUnder.orderPaymentmethod,
      orderDatetime: orderUnder.orderDatetime,
      orderTotalePrice: orderUnder.orderTotalePrice,
      orderStatus: orderUnder.orderStatus,
      rating: orderUnder.rating,
      comment: orderUnder.comment,
      deliveryId: orderUnder.deliveryId,
    );
    Get.toNamed(AppRoutes.orderDetail, arguments: {"ordersModel": ordersModel});
  }

  @override
  void goToTrackingOrder(
    double lat,
    double long,
    int deliveryId,
    String deliveryName,
    String deliveryPhone,
  ) {
    Get.toNamed(
      AppRoutes.trackingOrder,
      arguments: {
        "Lat": lat,
        "Long": long,
        "deliveryId": deliveryId,
        "deliveyName": deliveryName,
        "deliveryPhone": deliveryPhone,
      },
    );
  }

  @override
  void onInit() {
    getOrdersUnderDelivery();
    super.onInit();
  }
}
