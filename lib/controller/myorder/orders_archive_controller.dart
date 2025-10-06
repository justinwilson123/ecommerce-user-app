import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/order/order_archive_data.dart';
import 'package:ecommerce/data/model/orders_model.dart';

abstract class OrdersArchiveController extends GetxController {
  getOrdersArchive();
  ratingOrder(int orderid, double rating, String comment);
  goToOrderDetailandrating(OrdersModel ordersModel);
}

class OrdersArchiveControllerImp extends OrdersArchiveController {
  MyService myService = Get.find();
  late StatusRequst statusRequst;
  OrderArchiveData ordersArchiveData = OrderArchiveData(Get.find());
  List<OrdersModel> myorderArchive = [];

  @override
  getOrdersArchive() async {
    statusRequst = StatusRequst.loading;
    myorderArchive.clear();
    var response = await ordersArchiveData.getData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List respnsedata = response["data"];
        myorderArchive.addAll(respnsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  goToOrderDetailandrating(OrdersModel ordersModel) {
    Get.toNamed(
      AppRoutes.orderDetailAndRating,
      arguments: {"ordersModel": ordersModel},
    );
  }

  @override
  ratingOrder(int orderid, double rating, String comment) async {
    statusRequst = StatusRequst.loading;
    var response = await ordersArchiveData.updateData(
      orderid.toString(),
      rating.toString(),
      comment,
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        getOrdersArchive();
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrdersArchive();
    super.onInit();
  }
}
