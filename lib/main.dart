import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mc_custom_notification/mc_custom_notification.dart';
import 'package:ecommerce/Binding/binding.dart';
import 'package:ecommerce/core/class/onread_onrply_notification.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/model/message_model.dart';
import 'package:ecommerce/routes.dart';
import 'package:get/get.dart';

// String name = Stdin
OnreadOnrplyNotification orOrNotifi = OnreadOnrplyNotification();
Future<void> handeleBachgroundMessage(RemoteMessage message) async {
  log(message.category.toString());
  var payloadData = message.data;
  log(payloadData.toString());
  if (payloadData.toString() != "{pageid: non, pagename: non}") {
    var model = NotificationModel.fromMap(payloadData);
    // log(model.payload.toString());
    // if (model.payload!.isNotEmpty) {

    McCustomNotification().showNotificationMessage(
      model: NotificationMessage(
        useInbox: true,
        isVibration: true,
        id: model.id,
        tag: message.notification?.android?.tag,
        title: model.title,
        body: model.body,
        image: model.image,
        payload: model.payload,
        groupKey: model.groupKey,
        onRead: (payload) async {
          print("======================$payload");
          ;
          await Firebase.initializeApp();
          // await initialServices();
          await orOrNotifi.updateCounterFromNotification(
            chatID: payload['payload']['chatID'],
          );
        },
        onReply: (payload) async {
          // print(p)
          log(payload.toString());
          log(payload["payload"].toString());

          await Firebase.initializeApp();
          // await initialServices();

          MessageModel messag = MessageModel(
            receiverId: payload['payload']['myID'],
            senderId: payload['payload']['otherID'],
            text: payload['payload']['msg'],
            time: DateTime.now(),
            type: "text",
          );
          // await orOrNotifi.updateCounter(
          //   chatID: payload['payload']['chatID'],
          //   otherID: payload['payload']['otherID'],
          // );
          await orOrNotifi.updateCounterFromNotification(
            chatID: payload['payload']['chatID'],
          );
          await orOrNotifi.sendMessageFromNotification(
            chatID: payload['payload']['chatID'],
            messag: messag,
          );
          await orOrNotifi.updateLateMessageFromNotification(
            chatID: payload['payload']['chatID'],
            lastmessage: payload['payload']['msg'],
            otherID: payload['payload']['otherID'],
          );

          //   await orOrNotifi.sendNotificationFromNotification(
          //     topics: payload['payload']['myID'],
          //     body: payload['payload']['msg'],
          //     title: payload['payload']['otherUserName'],
          //     chatID: payload['payload']['chatID'],
          //     image: payload['payload']['otherImageURL'],
          //     myID: payload['payload']['otherID'],
          //     otherID: payload['payload']['myID'],
          //     myImage: payload['payload']['imageOtherUser'],
          //     imageOtherUser: payload['payload']['myImage'],
          //     otherUserName: payload['payload']['myUserName'],
          //     myUserName: payload['payload']['otherUserName'],
          //     otherImageURL: payload['payload']['myImageURL'],
          //     myImageURL: payload['payload']['otherImageURL'],
          //   );
        },
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(handeleBachgroundMessage);
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    return GetBuilder<LocaleController>(
      builder: (controller) => GetMaterialApp(
        initialBinding: InitialBindings(),
        translations: MyTranslation(),
        themeMode: ThemeMode.dark,
        locale: controller.language,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardColor: Colors.white,
          fontFamily: controller.fontFamily1(),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: AppColor.gray,
            ),
          ),
        ),
        getPages: getPages,
      ),
    );
  }
}
