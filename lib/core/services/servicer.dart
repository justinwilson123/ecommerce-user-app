import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/constant/service_account.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mc_custom_notification/mc_custom_notification.dart';

class MyService extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    late String myID = sharedPreferences.getString("userid")!;
    late String myUserName = sharedPreferences.getString("username")!;
    late String myImage = sharedPreferences.getString("myimage")!;
    McCustomNotification().initialize(
      projectId: "ecommerce-61498",
      serviceAccount: ServiceAccount.json,
      onClick: (payload) {
        if (payload['payload']['type'] == "message") {
          Get.toNamed(
            AppRoutes.currentmessageing,
            arguments: {
              "chatID": payload['payload']['chatID'],
              "imageOtherUser": myImage == payload['payload']['imageOtherUser']
                  ? payload['payload']['myImage']
                  : payload['payload']['imageOtherUser'],
              "otherID": myID == payload['payload']['otherID']
                  ? payload['payload']['myID']
                  : payload['payload']['otherID'],
              "otherUserName": myUserName == payload['payload']['otherUserName']
                  ? payload['payload']['myUserName']
                  : payload['payload']['otherUserName'],
            },
          );
        }
      },
    );
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyService().init());
}
