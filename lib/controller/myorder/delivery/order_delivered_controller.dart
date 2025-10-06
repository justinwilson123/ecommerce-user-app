import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/get_access_token.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/delivery/order_delivered_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class OrderDeliveredController extends GetxController {
  getOrder();
  goToOrderDetail(OrdersModel ordersModel);
  acceptOrderArchive(int orderId, int orderUserId, int deliveryId);
}

class OrderDeliveredControllerImp extends OrderDeliveredController {
  late StatusRequst statusRequst;
  OrderDeliveredData orderDeliveredData = OrderDeliveredData(Get.find());
  List<OrdersModel> myOrders = [];
  MyService myService = Get.find();
  GetAccessToken getAccessToken = GetAccessToken();

  @override
  getOrder() async {
    statusRequst = StatusRequst.loading;
    myOrders.clear();
    var response = await orderDeliveredData.getData(
      myService.sharedPreferences.getString("userid")!,
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response["status"] == "success") {
        List responseData = response['data'];
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

  @override
  acceptOrderArchive(int orderId, int orderUserId, int deliveryId) async {
    String accessToken = await getAccessToken.getAccessToken();
    var response = await orderDeliveredData.sendData(
      orderId.toString(),
      orderUserId.toString(),
      deliveryId.toString(),
      accessToken,
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      myOrders.removeWhere((element) => element.orderId == orderId);
    }
    update();
  }
}
