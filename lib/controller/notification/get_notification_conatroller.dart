import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/notification/get_notification_data.dart';
import 'package:ecommerce/data/model/get_notification_model.dart';

abstract class GetNotificationConatroller extends GetxController {
  getNotification();
}

class GetNotificationConatrollerImp extends GetNotificationConatroller {
  late StatusRequst statusRequst;
  GetNotificationData getNotificationData = GetNotificationData(Get.find());
  MyService myService = Get.find();
  List<GetNotificationModel> myNotification = [];
  bool newnotific = false;

  @override
  getNotification() async {
    statusRequst = StatusRequst.loading;

    var response = await getNotificationData.getNotificationData(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List respinsedata = response["data"];
        myNotification.addAll(
          respinsedata.map((e) => GetNotificationModel.fromJson(e)),
        );
        // print("$myNotification");
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotification();
    super.onInit();
  }
}
