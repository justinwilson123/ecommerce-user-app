import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/cart/check_out_data.dart';
import 'package:ecommerce/data/datasource/remote/location/view_delete_location_data.dart';
import 'package:ecommerce/data/model/view_location_model.dart';
import 'package:ecommerce/data/model/view_shop_model.dart';

abstract class CheckOutController extends GetxController {
  chosepayment(String val);
  choseDelevary(String val);
  choseLocation(String val);
  choseShope(String val);
  getDatajson();
  getViewShope();
  getCheckoutOrder();
}

class CheckOutControllerImp extends CheckOutController {
  String? money;
  String? delivery;
  String? location;
  String? shop;

  StatusRequst statusRequst = StatusRequst.nothing;
  ViewAndDeleteLocationData viewAndDeleteLocationData =
      ViewAndDeleteLocationData(Get.find());
  CheckOutData checkOutData = CheckOutData(Get.find());
  MyService myService = Get.find();

  List<ViewLocationModel> mylocations = [];
  List<ViewShopModel> ourShope = [];

  String? orderLoction;
  String? orederTypeDelivery;
  String? orderPaymentMethod;
  double orderPriceDelivery = 0.0;
  String? couponName;

  late double totaleprices;
  late double ordertotaleprice;

  @override
  chosepayment(val) {
    money = val;
    orderPaymentMethod = money;
    update();
  }

  @override
  choseDelevary(val) {
    delivery = val;
    if (delivery == "delivery") {
      shop = null;
    } else {
      location = null;
    }
    orederTypeDelivery = delivery;
    update();
  }

  @override
  choseLocation(String val) {
    location = val;
    orderLoction = location;
    orderPriceDelivery = 11.5;
    ordertotaleprice = ordertotaleprice + orderPriceDelivery;
    update();
  }

  @override
  choseShope(String val) {
    shop = val;
    orderLoction = shop;
    orderPriceDelivery = 0.0;
    update();
  }

  @override
  getDatajson() async {
    statusRequst = StatusRequst.loading;
    update();
    orderLoction = "";
    mylocations.clear();
    var response = await viewAndDeleteLocationData.getData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List resposndata = response['data'];
        mylocations.addAll(
          resposndata.map((e) => ViewLocationModel.fromJson(e)),
        );
      } else {
        Get.snackbar("50".tr, "159".tr);
      }
    }
    update();
  }

  @override
  getViewShope() async {
    statusRequst = StatusRequst.loading;
    update();
    orderLoction = "";
    ourShope.clear();
    var response = await checkOutData.viewshpoe();
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List resposndata = response['data'];
        ourShope.addAll(resposndata.map((e) => ViewShopModel.fromJson(e)));
      }
    }
    update();
  }

  @override
  getCheckoutOrder() async {
    if (money != null &&
        delivery != null &&
        (location != null || shop != null)) {
      statusRequst = StatusRequst.loading;
      update();
      var response = await checkOutData.checkoutOrder(
        myService.sharedPreferences.getString("userid").toString(),
        orderLoction!,
        orederTypeDelivery!,
        orderPriceDelivery.toString(),
        totaleprices.toString(),
        couponName!,
        orderPaymentMethod!,
        ordertotaleprice.toString(),
      );
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
          Get.snackbar("160".tr, "161".tr);
          Get.offAllNamed(AppRoutes.homescreen);
        } else {
          Get.snackbar("تنبيه", "شيء ماخاطئ رجاءا حاول لاحقا");
          Get.offAllNamed(AppRoutes.homescreen);
        }
      }
      update();
    } else {
      Get.snackbar("50".tr, "162".tr);
    }
  }

  @override
  void onInit() {
    ordertotaleprice = Get.arguments["ordertotaleprice"];
    totaleprices = Get.arguments["totaleprices"];
    couponName = Get.arguments["couponName"];
    // getDatajson();
    // getViewShope();
    super.onInit();
  }
}
