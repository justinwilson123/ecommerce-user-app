import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mc_custom_notification/mc_custom_notification.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/model/chat_model.dart';

class MainMessagingController extends GetxController {
  // List data = [];
  RxList<ChatModel> myChats = <ChatModel>[].obs;
  MyService myService = Get.find();
  StreamSubscription<QuerySnapshot>? _chatSubscription;
  late String myUserName = myService.sharedPreferences.getString("username")!;
  late String myImage = myService.sharedPreferences.getString("myimage")!;
  late String myID = myService.sharedPreferences.getString("userid")!;

  goToSendMessage({
    required String imageOtherUser,
    required String otherID,
    required String otherUserName,
    required List uids,
  }) async {
    await McCustomNotification().cancelNotification(
      id: int.parse(generateChatID(uids)),
      tag: generateChatID(uids),
    );
    Get.toNamed(
      AppRoutes.currentmessageing,
      arguments: {
        "imageOtherUser": imageOtherUser,
        "otherID": otherID,
        "otherUserName": otherUserName,
        "chatID": generateChatID(uids),
      },
    );
  }

  Future<void> updateCounter(List uids) async {
    FirebaseFirestore.instance
        .collection("chat")
        .doc(generateChatID(uids))
        .update({"counter": 0});
  }

  String generateChatID(List uids) {
    uids.sort();
    String chatID = uids.fold("", (id, uid) => "$id$uid");
    return chatID;
  }

  getMyChatsStream() {
    _chatSubscription = FirebaseFirestore.instance
        .collection("chat")
        .where("uids", arrayContains: myID)
        .orderBy("timeStamp", descending: true)
        .snapshots()
        .listen((snapshot) {
          if (snapshot.docs.isNotEmpty) {
            myChats.value = snapshot.docs.map((ch) {
              return ChatModel.fromJson(ch.data());
            }).toList();
          }
        });
  }

  // myChats.sort((a, b) => b.username2!.compareTo(a.username2!));
  // update();

  String imageOtherName(String imagename1, String imagename2) {
    if (myImage == imagename1) {
      return imagename2;
    } else {
      return imagename1;
    }
  }

  String otherUserName(String username1, String username2) {
    if (myUserName == username1) {
      return username2;
    } else {
      return username1;
    }
  }

  String otheID(List uids) {
    uids.sort();
    String otherID = uids.fold("", (id, uid) => "$id$uid");
    otherID = otherID.replaceAll(myID, "");
    return otherID;
  }

  @override
  void onInit() {
    getMyChatsStream();
    super.onInit();
  }

  @override
  void onClose() {
    _chatSubscription?.cancel();
    super.onClose();
  }
}


 // getMychats() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection("chat")
  //       .where("uids", arrayContains: "43")
  //       .get();
  //   data.addAll(snapshot.docs);
  //   update();
  //   print(data);
  // }

 // getLastMessageStream() {
  //   FirebaseFirestore.instance
  //       .collection("chat")
  //       .where("uids", arrayContains: myID)
  //       .snapshots()
  //       .listen((snapshot) {
  //     for (int i = 0; i < snapshot.docs.length; i++) {
  //       var chatID = snapshot.docs[i].id;
  //       print(chatID);
  //       FirebaseFirestore.instance
  //           .collection("chat")
  //           .doc(chatID)
  //           .collection("messages")
  //           .snapshots()
  //           .listen((snap) {
  //         lastMessage.value = snap.docs.map((lm) {
  //           return MessageModel.fromJson(lm.data());
  //         }).toList();
  //       });
  //       print(lastMessage);
  //     }
  //   });
  // }