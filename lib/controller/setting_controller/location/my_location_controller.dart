import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/location/view_delete_location_data.dart';
import 'package:ecommerce/data/model/view_location_model.dart';

class MyLocationController extends GetxController {
  StatusRequst statusRequst = StatusRequst.nothing;
  MyService myService = Get.find();
  List<ViewLocationModel> mylocations = [];
  ViewAndDeleteLocationData viewAndDeleteLocationData =
      ViewAndDeleteLocationData(Get.find());

  Future<void> goToAddlocation() async {
    // LocationPermission permission = await Geolocator.checkPermission();
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (serviceEnabled && permission != LocationPermission.denied) {

    // } else {
    //   Get.snackbar("50".tr, "168".tr);
    //   Get.offNamed(AppRoutes.homescreen);
    // }
    Get.toNamed(AppRoutes.addlocation);
  }

  Future<void> getDatajson() async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await viewAndDeleteLocationData.getData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    mylocations.clear();
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List resposndata = response['data'];
        mylocations.addAll(
          resposndata.map((e) => ViewLocationModel.fromJson(e)),
        );
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  Future<void> deleteDatajson(int locationid) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await viewAndDeleteLocationData.deleteData(
      locationid.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        mylocations.removeWhere((element) => element.locationId == locationid);
        Get.snackbar("50".tr, "169".tr);
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDatajson();
    // getperlocation();
    super.onInit();
  }
}
