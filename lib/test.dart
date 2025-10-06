// import 'dart:convert';
// import 'package:untitled/core/functions/get_access_token.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googleapis_auth/auth_io.dart';
import 'package:ecommerce/controller/testcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Testpage extends StatelessWidget {
  const Testpage({super.key});

  @override
  Widget build(BuildContext context) {
    Testcontroller controller = Get.put(Testcontroller());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        color: AppColor.backgroundappcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                controller.signInWithGoogle();
              },
              child: Container(
                color: AppColor.praimarycolor,
                padding: EdgeInsets.all(20),
                child: Text("google"),
              ),
            ),
            InkWell(
              onTap: () {
                GoogleSignIn googleSignIn = GoogleSignIn.instance;
                googleSignIn.disconnect();
              },
              child: Container(
                color: AppColor.praimarycolor,
                padding: EdgeInsets.all(20),
                child: Text("google"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// GetBuilder<Testcontroller>(
//             builder: (controller) => Column(
//               children: [
//                 MaterialButton(
//                   onPressed: () async {
//                     Position position = await Geolocator.getCurrentPosition();
//                     print("${position.latitude}");
//                     print("${position.longitude}");
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     color: AppColor.praimarycolor,
//                     child: Text("get location"),
//                   ),
//                 ),
//                 Text(controller.lat),
//                 Text(controller.long),
//                 //     MaterialButton(
//                 //       onPressed: () async {
//                 //         GetAccessToken getAccessToken = GetAccessToken();
//                 //         accessToken = await getAccessToken.getAccessToken();
//                 //         print(accessToken);

//                 //         final Map<String, dynamic> message = {
//                 //           "message": {
//                 //             "token":
//                 //                 "cT_9Pc4aS2WiaVKEqqewCN:APA91bGt7G2WoJWeQN7FwiEsJITu7WAkGv2C-OHaaNWWn_RO50NcOpkhBp_bL7PXUwLBLebWVmwEns3aIPri2MYI7lqKA56-bw-Hl0oVQT8JpKeDyX9oFX7ecZdJ-cxhCD-YpWEr9cVq",
//                 //             "notification": {
//                 //               "title": "hi",
//                 //               "body": "welcom",
//                 //             },
//                 //           }
//                 //         };
//                 //         final http.Response response = await http.post(
//                 //           Uri.parse(
//                 //               "https://fcm.googleapis.com/v1/projects/ecommerce-61498/messages:send"),
//                 //           headers: <String, String>{
//                 //             "Content-Type": "application/json",
//                 //             "Authorization": "Bearer $accessToken"
//                 //           },
//                 //           body: jsonEncode(message),
//                 //         );
//                 //         if (response.statusCode == 200) {
//                 //           print("seccess notifiction");
//                 //         } else {
//                 //           print("faild notification== ${response.statusCode}");
//                 //         }
//                 //       },
//                 //       child: Container(
//                 //         color: Colors.blue,
//                 //         child: Text("Get AccessToker"),
//                 //       ),
//                 //     ),
//                 //     MaterialButton(
//                 //       onPressed: () async {
//                 //         String? token = await FirebaseMessaging.instance.getToken();
//                 //         print(token);
//                 //         final Map<String, dynamic> message = {
//                 //           "message": {
//                 //             "topic": "users",
//                 //             "notification": {
//                 //               "title": "hi",
//                 //               "body": "welcom",
//                 //             },
//                 //           }
//                 //         };
//                 //         final http.Response response = await http.post(
//                 //           Uri.parse(
//                 //               "https://fcm.googleapis.com/v1/projects/ecommerce-61498/messages:send"),
//                 //           headers: <String, String>{
//                 //             "Content-Type": "application/json",
//                 //             "Authorization": "Bearer $accessToken"
//                 //           },
//                 //           body: jsonEncode(message),
//                 //         );
//                 //         if (response.statusCode == 200) {
//                 //           print("seccess notifiction");
//                 //         } else {
//                 //           print("faild notification== ${response.statusCode}");
//                 //         }
//                 //       },
//                 //       child: Container(
//                 //         color: Colors.blue,
//                 //         child: Text("Get tokern"),
//                 //       ),
//                 //     ),
//               ],
//             ),
//           ),