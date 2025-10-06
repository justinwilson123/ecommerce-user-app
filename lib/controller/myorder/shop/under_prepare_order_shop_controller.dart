import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/shop/under_prepare_order_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class UnderPrepareOrderShopController extends GetxController {
  getOrder();
  goToOrderDetail(OrdersModel ordersModel);
}

class UnderPrepareOrderShopControllerImp
    extends UnderPrepareOrderShopController {
  late StatusRequst statusRequst;
  UnderPrepareOrderData underPrepareOrderData = UnderPrepareOrderData(
    Get.find(),
  );
  MyService myService = Get.find();
  List<OrdersModel> myOrders = [];

  @override
  getOrder() async {
    statusRequst = StatusRequst.loading;
    myOrders.clear();
    var response = await underPrepareOrderData.getData(
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
