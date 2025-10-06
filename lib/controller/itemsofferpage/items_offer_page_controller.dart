import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/offeritems/offer_items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';

abstract class ItemsOfferPageController extends GetxController {
  getOfferItem();
  goToItemDetail(ItemsModel itemmodel);
  goToFavoriteItems();
}

class ItemsOfferPageControllerImp extends ItemsOfferPageController {
  var offeritems = <ItemsModel>[].obs;
  var statusRequst = StatusRequst.nothing.obs;
  OfferItemsData offerItemsData = OfferItemsData(Get.find());
  MyService myService = Get.find();
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getOfferItem();
    super.onInit();
  }

  @override
  getOfferItem() async {
    if (isLoading.value) return;
    statusRequst(StatusRequst.loading);
    isLoading(true);
    if (page.value != 1) {
      await Future.delayed(const Duration(seconds: 1));
    }
    // print("${myService.sharedPreferences.getString("userid")}");
    String userid = myService.sharedPreferences.getString("userid")!;
    var response = await offerItemsData.getData(userid, page.value.toString());
    statusRequst(handlingData(response));
    if (StatusRequst.success == statusRequst.value) {
      if (response['status'] == "success") {
        List data = response['data'];
        offeritems.addAll(data.map((e) => ItemsModel.fromJson(e)));
        isLoading(false);
        page.value++;
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
  goToFavoriteItems() {
    Get.toNamed(AppRoutes.favoriteitems);
  }
}
