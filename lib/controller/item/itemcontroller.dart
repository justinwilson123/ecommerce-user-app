import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/itemsview/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';

abstract class ItemController extends GetxController {
  changeCategories(int valm, int itemid);
  getItems();
  goToItemDetail(ItemsModel itemmodel);
  goToFavoriteItems();
  goToNotification();
  goToMessaging();
}

class ItemControllerImp extends ItemController {
  late int myitemcount;
  List datacategories = [];
  var data = <ItemsModel>[].obs;
  var statusRequst = StatusRequst.nothing.obs;
  late int itemscategoriesid;
  ItemsData itemsData = ItemsData(Get.find());
  MyService myService = Get.find();
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;

  late double height;

  @override
  void onInit() {
    datacategories = Get.arguments["categories"];
    myitemcount = Get.arguments["itemindex"];
    itemscategoriesid = Get.arguments["itemcategoriesid"];

    getItems();
    super.onInit();
  }

  @override
  changeCategories(valm, itemid) {
    myitemcount = valm;
    itemscategoriesid = itemid;
    page(1);
    data.clear();
    getItems();
    update();
  }

  @override
  getItems() async {
    if (isLoading.value) return;
    statusRequst(StatusRequst.loading);
    isLoading(true);
    if (page.value != 1) {
      await Future.delayed(Duration(seconds: 1));
    }
    // print("${myService.sharedPreferences.getString("userid")}");
    String userid = myService.sharedPreferences.getString("userid")!;
    var response = await itemsData.getData(
      "$itemscategoriesid",
      userid,
      page.value.toString(),
    );
    statusRequst(handlingData(response));
    if (StatusRequst.success == statusRequst.value) {
      if (response['status'] == "success") {
        List responseData = (response['data']);
        data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        isLoading(false);
        page.value++;
        // print("$data");
      } else {
        isLoading(false);
        statusRequst(StatusRequst.noData);
      }
    }
    update();
  }

  @override
  goToItemDetail(ItemsModel itemmodel) {
    Get.toNamed(AppRoutes.itemsdetail, arguments: {"itemmodel": itemmodel});
  }

  @override
  goToMessaging() {
    Get.toNamed(AppRoutes.mainMessaging);
  }

  @override
  goToFavoriteItems() {
    Get.toNamed(AppRoutes.favoriteitems);
  }

  @override
  goToNotification() {
    Get.toNamed(AppRoutes.notifScreen);
  }
}
