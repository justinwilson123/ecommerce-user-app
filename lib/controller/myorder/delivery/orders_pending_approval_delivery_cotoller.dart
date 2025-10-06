import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/delivery/order_pending_approval_delivery_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class OrdersPendingApprovalDeliveryCotoller extends GetxController {
  getOrderPending();
  deletOrder(int orderid);
  goToOrderDetail(OrdersModel ordersModel);
}

class OrdersDeliveryPendingApprovalCotollerImp
    extends OrdersPendingApprovalDeliveryCotoller {
  MyService myService = Get.find();
  late StatusRequst statusRequst;
  OrderPendingApprovalDeliveryData orderPendingApprovalData =
      OrderPendingApprovalDeliveryData(Get.find());
  List<OrdersModel> myorderpending = [];

  @override
  getOrderPending() async {
    statusRequst = StatusRequst.loading;
    myorderpending.clear();
    var response = await orderPendingApprovalData.getData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List respnsedata = response["data"];
        myorderpending.addAll(respnsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrderPending();
    super.onInit();
  }

  @override
  goToOrderDetail(OrdersModel ordersModel) {
    Get.toNamed(AppRoutes.orderDetail, arguments: {"ordersModel": ordersModel});
  }

  @override
  deletOrder(orderid) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await orderPendingApprovalData.deletData(orderid.toString());
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        // getOrderPending();
        myorderpending.removeWhere((element) => element.orderId == orderid);
        // update();
      }
    }
    update();
  }
}
