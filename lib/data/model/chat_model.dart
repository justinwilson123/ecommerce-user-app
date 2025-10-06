import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? username1;
  String? username2;
  String? nameimage1;
  String? nameimage2;
  List<String>? uids;
  String? text;
  DateTime? time;
  String? senderId;
  int? counter;
  Timestamp? timeStamp;

  ChatModel({
    this.username1,
    this.username2,
    this.nameimage1,
    this.nameimage2,
    this.uids,
    required this.text,
    required this.time,
    this.senderId,
    this.counter,
    this.timeStamp,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    username1 = json['username1'];
    username2 = json['username2'];
    nameimage1 = json['nameimage1'];
    nameimage2 = json['nameimage2'];
    uids = json['uids'].cast<String>();
    text = json['lastmessage'];
    time = DateTime.parse(json['time'].toString()).toLocal();
    senderId = json['senderId'];
    counter = json['counter'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username1'] = username1;
    data['username2'] = username2;
    data['nameimage1'] = nameimage1;
    data['nameimage2'] = nameimage2;
    data['uids'] = uids;
    data['lastmessage'] = text;
    data['time'] = time!.toUtc().toIso8601String();
    data['senderId'] = senderId;
    data['counter'] = counter;
    data['timeStamp'] = FieldValue.serverTimestamp();
    return data;
  }
}
