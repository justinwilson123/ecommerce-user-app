import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routesapp.dart';

class MyOrderController extends GetxController {
  goToMyOrderDelivery() {
    Get.toNamed(AppRoutes.myOrderDelivery);
  }

  goToMyOrderArchive() {
    Get.toNamed(AppRoutes.orderArchive);
  }

  goToMyOrderShop() {
    Get.toNamed(AppRoutes.myOrdershop);
  }
}
