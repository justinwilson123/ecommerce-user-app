import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/orders_on_shope_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class OrdersOnShopeCotroller extends GetxController {
  getOrdersOnShope();
  goToOrderDetail(OrdersModel ordersModel);
}

class OrdersOnShopeCotrollerImp extends OrdersOnShopeCotroller {
  MyService myService = Get.find();
  late StatusRequst statusRequst;
  OrdersOnShopeData ordersOnShopeData = OrdersOnShopeData(Get.find());
  List<OrdersModel> myorderOnShope = [];

  @override
  getOrdersOnShope() async {
    statusRequst = StatusRequst.loading;
    myorderOnShope.clear();
    var response = await ordersOnShopeData.getData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List respnsedata = response["data"];
        myorderOnShope.addAll(respnsedata.map((e) => OrdersModel.fromJson(e)));
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
    getOrdersOnShope();
    super.onInit();
  }
}
