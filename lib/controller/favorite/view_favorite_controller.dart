import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/favorite/view_favorite_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/view_favorite_model.dart';

abstract class ViewFavoriteController extends GetxController {
  geDataView();
  deletfavorite(favoriteid);
  goToItemDetail(ItemsModel itemsModel);
}

class ViewFavoriteControllerImp extends ViewFavoriteController {
  late StatusRequst statusRequst;
  ViewFavoriteData viewFavoriteData = ViewFavoriteData(Get.find());
  List<ViewFavoriteModel> data = [];
  MyService myService = Get.find();
  List<ItemsModel> myItemsModel = [];

  @override
  geDataView() async {
    statusRequst = StatusRequst.loading;
    String userid = myService.sharedPreferences.getString("userid")!;
    var response = await viewFavoriteData.getData(userid);
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List responsedata = (response['data']);
        data.addAll(responsedata.map((e) => ViewFavoriteModel.fromJson(e)));
        myItemsModel.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    geDataView();
    super.onInit();
  }

  @override
  deletfavorite(favoriteid) async {
    statusRequst = StatusRequst.loading;
    var response = await viewFavoriteData.deletdata(favoriteid.toString());
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        data.removeWhere((element) => element.favoriteId == favoriteid);
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  goToItemDetail(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemsdetail, arguments: {"itemmodel": itemsModel});
  }
}
