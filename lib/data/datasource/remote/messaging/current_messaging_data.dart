import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/data/model/message_model.dart';

class CurrentMessagingData {
  Crud crud;
  CurrentMessagingData(this.crud);
  Future<void> sendMessage({
    required String chatID,
    required MessageModel messag,
  }) async {
    CollectionReference message = FirebaseFirestore.instance
        .collection('chat')
        .doc(chatID)
        .collection("messages");
    return message
        .add(messag.toJson())
        .then((value) => print("User message"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  addImages(File image) async {
    var response = await crud.addRequstWithImageOne(
      Applink.imageMessage,
      {},
      image,
    );
    return response.fold((l) => l, (r) => r);
  }
}
