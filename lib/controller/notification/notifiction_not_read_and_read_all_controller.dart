import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/notification/notification_not_read_data.dart';

class NotificationNotReadAndReadAllController extends GetxController {
  StatusRequst statusRequst = StatusRequst.nothing;
  RxInt countNotifi = 0.obs;
  RxInt countMessaging = 0.obs;
  StreamSubscription<QuerySnapshot>? _chatSubscription;
  Crud crud = Crud();
  NotificationNotReadData notReadData = NotificationNotReadData(
    Get.put(Crud()),
  );
  final FirebaseFirestore getcount = FirebaseFirestore.instance;
  MyService myService = Get.find();
  getCountNotifiNotRead() async {
    var response = await notReadData.getNotificationNotRead(
      myService.sharedPreferences.getString("userid").toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        countNotifi.value = response["data"];
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
  }

  getCountMessageNotRead() {
    String myID = myService.sharedPreferences.getString("userid").toString();
    _chatSubscription?.cancel();

    _chatSubscription = getcount
        .collection("chat")
        .where("uids", arrayContains: myID)
        .where("senderId", isNotEqualTo: myID)
        .snapshots()
        .listen((snapshot) {
          if (snapshot.docs.isNotEmpty) {
            num allcount = 0;
            for (var doc in snapshot.docs) {
              allcount += doc.data()['counter'] ?? 0 as num;
            }
            countMessaging.value = allcount.toInt();
          } else {
            countMessaging.value = 0;
          }
        });
  }

  readAllNotification() async {
    if (countNotifi.value > 0) {
      var response = await notReadData.readAllNotification(
        myService.sharedPreferences.getString("userid").toString(),
      );
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
          getCountNotifiNotRead();
        } else {
          statusRequst = StatusRequst.noData;
        }
      }
    }
  }

  void logout() {
    _chatSubscription?.cancel();
    countMessaging.value = 0;
  }

  @override
  void onInit() {
    getCountNotifiNotRead();
    getCountMessageNotRead();
    super.onInit();
  }
}
