import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/favorite/favorite_data.dart';

class FavoriteController extends GetxController {
  Map favoriteitems = {};
  StatusRequst statusRequst = StatusRequst.nothing;
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyService myService = Get.find();

  setFavorate(id, val) {
    favoriteitems[id] = val;
    update();
  }

  addfavoties(itemid) async {
    statusRequst = StatusRequst.loading;

    var response = await favoriteData.addfavorite(
      myService.sharedPreferences.getString("userid"),
      itemid.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("152".tr, "163".tr, duration: const Duration(seconds: 1));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
  }

  removefavoties(itemid) async {
    statusRequst = StatusRequst.loading;

    var response = await favoriteData.removefavorite(
      myService.sharedPreferences.getString("userid"),
      itemid.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("152".tr, "164".tr, duration: const Duration(seconds: 1));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
  }
}
