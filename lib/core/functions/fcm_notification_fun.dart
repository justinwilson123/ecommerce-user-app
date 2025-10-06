import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:ecommerce/controller/notification/notifiction_not_read_and_read_all_controller.dart';

requestPermissionNotifiction() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  NotificationNotReadAndReadAllController controller = Get.put(
    NotificationNotReadAndReadAllController(),
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    controller.getCountNotifiNotRead();
    FlutterRingtonePlayer().playNotification();
    print(message.notification!.title!);
    print(message.notification!.body!);
    print(message.data);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });
}
