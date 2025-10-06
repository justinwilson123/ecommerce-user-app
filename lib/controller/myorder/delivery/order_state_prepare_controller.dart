import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/delivery/order_state_prepare_delivey_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class OrderStatePrepareController extends GetxController {
  getOrder();
  goToOrderDetail(OrdersModel ordersModel);
}

class OrderStatePrepareControllerImp extends OrderStatePrepareController {
  late StatusRequst statusRequst;
  OrderStatePrepareDeliveyData orderStatePrepareDeliveyData =
      OrderStatePrepareDeliveyData(Get.find());
  MyService myService = Get.find();
  List<OrdersModel> myOrders = [];

  @override
  getOrder() async {
    statusRequst = StatusRequst.loading;
    myOrders.clear();
    var response = await orderStatePrepareDeliveyData.getData(
      myService.sharedPreferences.getString("userid")!,
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List responseData = response["data"];
        myOrders.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  goToOrderDetail(OrdersModel ordersModel) {
    Get.toNamed(AppRoutes.orderDetail, arguments: {"ordersModel": ordersModel});
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
