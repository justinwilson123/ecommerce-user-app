import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:mc_custom_notification/mc_custom_notification.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/functions/upload_files.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/messaging/current_messaging_data.dart';
import 'package:ecommerce/data/model/chat_model.dart';
import 'package:ecommerce/data/model/message_model.dart';

class CurrentMessagingController extends GetxController {
  CurrentMessagingData currentMessagingData = CurrentMessagingData(Get.find());
  StatusRequst statusRequst = StatusRequst.nothing;

  StreamSubscription<QuerySnapshot>? _chatSubscription;
  late String imageOtherUser;
  late String otherID;
  late String otherUserName;
  late String imageUrl = "${Applink.linkImageUser}$imageOtherUser";
  MyService myService = Get.find();
  late String myID = myService.sharedPreferences.getString("userid")!;
  late String myUserName = myService.sharedPreferences.getString("username")!;
  late String myImage = myService.sharedPreferences.getString("myimage")!;
  late String chatID;
  File? file;
  var message = <MessageModel>[].obs;
  var chatMessage = <ChatMessage>[].obs;
  String? imageName;

  choosImageFromGallery() async {
    file = await fileUploadGallery();
    update();
  }

  choosImageFromCamera() async {
    file = await imageUploadCamera();

    update();
  }

  getImageName(File image) async {
    if (file != null) {
      var response = await currentMessagingData.addImages(image);
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['upload'] == "success") {
          imageName = response['name_image'];
          MessageModel messgs = MessageModel(
            senderId: myID,
            receiverId: otherID,
            text: imageName,
            time: DateTime.now(),
            type: "image",
          );
          currentMessagingData.sendMessage(chatID: chatID, messag: messgs);
          updateLateMessage(imageName!, DateTime.now());
        } else {
          Get.snackbar("Error", "SomeThing is wrong please try again");
        }
      }
    }
  }

  late ChatUser currentUser = ChatUser(id: myID, firstName: myUserName);

  late ChatUser otherUser = ChatUser(
    id: otherID,
    firstName: otherUserName,
    profileImage: imageUrl,
  );

  getMessage() {
    _chatSubscription = FirebaseFirestore.instance
        .collection("chat")
        .doc(chatID)
        .collection("messages")
        .orderBy("dateTime", descending: true)
        .snapshots()
        .listen((snapshot) {
          message.value = snapshot.docs.map((doc) {
            return MessageModel.fromJson(doc.data());
          }).toList();
        });
  }

  // ==========================send notification
  sendNotification(String body) async {
    await McCustomNotification().sendNotificationToAll(
      topics: "'user$otherID' in topics",
      model: NotificationModel(
        title: myUserName,
        tag: chatID,
        body: body,
        id: int.parse(chatID),
        groupKey: chatID,
        image: "${Applink.linkImageUser}$myImage",
        payload: {
          "type": "message",
          "myID": myID,
          "otherID": otherID,
          "myImage": myImage,
          "imageOtherUser": imageOtherUser,
          "otherUserName": otherUserName,
          "myUserName": myUserName,
          "chatID": chatID,
          "otherImageURL": "${Applink.linkImageUser}$imageOtherUser",
          "myImageURL": "${Applink.linkImageUser}$myImage",
        },
      ),
    );
  }

  // cancelNotification() async {
  //   await McCustomNotification()
  //       .cancelNotification(id: int.parse(chatID), tag: chatID);
  // }

  changMessages(List<MessageModel> message) {
    chatMessage.value = message.map((m) {
      if (m.type == "image") {
        return ChatMessage(
          user: m.senderId == myID ? currentUser : otherUser,
          createdAt: m.time!,
          medias: [
            ChatMedia(
              url: "${Applink.linkImageChat}${m.text}",
              fileName: "${m.text}",
              type: MediaType.image,
            ),
          ],
        );
      } else {
        return ChatMessage(
          user: m.senderId == myID ? currentUser : otherUser,
          text: m.text!,
          createdAt: m.time!,
        );
      }
    }).toList();
    // chatMessage.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return chatMessage;
  }

  onsend(ChatMessage message) async {
    bool checkExists = await checkChatExists();
    if (!checkExists) {
      ChatModel chat = ChatModel(
        username1: myUserName,
        username2: otherUserName,
        nameimage1: myImage,
        nameimage2: imageOtherUser,
        uids: [myID, otherID],
        text: message.text,
        time: message.createdAt,
        senderId: myID,
        counter: 1,
      );
      creatNewChat(chat: chat);
    } else {
      updateLateMessage(message.text, message.createdAt);
    }
    sendNotification(message.text);
    MessageModel messgs = MessageModel(
      senderId: message.user.id,
      receiverId: otherUser.id,
      text: message.text,
      time: message.createdAt,
      type: "text",
    );
    currentMessagingData.sendMessage(chatID: chatID, messag: messgs);

    update();
  }

  Future<bool> checkChatExists() async {
    // try {
    var result = await FirebaseFirestore.instance
        .collection('chat')
        .doc("$chatID")
        .get();
    return result.exists;
    // } on FirebaseException catch (e) {
    //   print(e);
    //   Get.snackbar("erorr", "something is wrong please try again letar");
    //   return false;
    // }

    // return false;
  }

  Future<void> creatNewChat({required ChatModel chat}) async {
    // try {
    final docRef = FirebaseFirestore.instance.collection("chat").doc(chatID);
    await docRef.set(chat.toJson());
    // } on FirebaseException catch (e) {
    // print(e);
    // Get.snackbar("erorr", "something is wrong please Try again ");
    // }
  }

  Future<void> updateLateMessage(String lastmessage, DateTime time) async {
    await FirebaseFirestore.instance.collection('chat').doc(chatID).update({
      "lastmessage": lastmessage,
      "time": time.toUtc().toIso8601String(),
      "senderId": myID,
      "counter": FieldValue.increment(1),
      "timeStamp": FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateCounter() async {
    DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection('chat')
        .doc(chatID)
        .get();
    if (data.exists) {
      ChatModel chat = ChatModel.fromJson(data.data()!);
      if (chat.senderId == otherID) {
        await FirebaseFirestore.instance.collection("chat").doc(chatID).update({
          "counter": 0,
        });
      }
    }
  }

  @override
  void onInit() {
    chatID = Get.arguments["chatID"];
    imageOtherUser = Get.arguments["imageOtherUser"];
    otherID = Get.arguments["otherID"];
    otherUserName = Get.arguments["otherUserName"];
    getMessage();
    // cancelNotification();

    super.onInit();
  }

  @override
  void onClose() {
    _chatSubscription?.cancel();
    super.onClose();
  }
}
