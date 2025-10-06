// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mc_custom_notification/mc_custom_notification.dart';
// import 'package:ecommerce/data/model/chat_model.dart';
import 'package:ecommerce/data/model/message_model.dart';

class OnreadOnrplyNotification {
  Future<void> sendMessageFromNotification(
      {required String chatID, required MessageModel messag}) async {
    CollectionReference message = FirebaseFirestore.instance
        .collection('chat')
        .doc(chatID)
        .collection("messages");
    return message
        .add(messag.toJson())
        .then((value) => print("User message"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateLateMessageFromNotification({
    required String chatID,
    required String lastmessage,
    required String otherID,
  }) async {
    await FirebaseFirestore.instance.collection('chat').doc(chatID).update({
      "lastmessage": lastmessage,
      "time": DateTime.now().toUtc().toIso8601String(),
      "senderId": otherID,
      "counter": FieldValue.increment(1),
      "timeStamp": FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateCounterFromNotification({required String chatID}) async {
    FirebaseFirestore.instance.collection("chat").doc(chatID).update({
      "counter": 0,
    });
  }

  // Future<void> updateCounter(
  //     {required String chatID, required String otherID}) async {
  //   DocumentSnapshot<Map<String, dynamic>> data =
  //       await FirebaseFirestore.instance.collection('chat').doc(chatID).get();
  //   if (data.exists) {
  //     ChatModel chat = ChatModel.fromJson(data.data()!);
  //     if (chat.senderId == otherID) {
  //       await FirebaseFirestore.instance.collection("chat").doc(chatID).update({
  //         "counter": 0,
  //       });
  //     }
  //   }
  // }

  sendNotificationFromNotification(
      {required String topics,
      required String body,
      required String title,
      required String chatID,
      required String image,
      required String myID,
      required String otherID,
      required String myImage,
      required String imageOtherUser,
      required String otherUserName,
      required String myUserName,
      required String otherImageURL,
      required String myImageURL}) async {
    await McCustomNotification().sendNotificationToAll(
        topics: "'user$topics' in topics",
        model: NotificationModel(
          title: title,
          tag: chatID,
          body: body,
          id: int.parse(chatID),
          groupKey: chatID,
          image: image,
          payload: {
            "myID": myID,
            "otherID": otherID,
            "myImage": myImage,
            "imageOtherUser": imageOtherUser,
            "otherUserName": otherUserName,
            "myUserName": myUserName,
            "chatID": chatID,
            "urlOthertherImage": otherImageURL,
            "myImageURL": myImageURL,
          },
        ));
  }
}
