import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderId;
  String? receiverId;
  String? text;
  DateTime? time;
  String? type;

  MessageModel({
    required this.receiverId,
    required this.senderId,
    required this.text,
    required this.time,
    required this.type,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    text = json['text'];
    type = json['type'];
    time = DateTime.parse(json['time'].toString()).toLocal();
  }

  factory MessageModel.fromJsonTow(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['senderId'] ?? "",
      receiverId: json['receiverId'],
      text: json['text'],
      type: json['type'],
      time: DateTime.parse(json['time'].toString()).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['text'] = text;
    data['type'] = type;
    data['time'] = time!.toUtc().toIso8601String();
    data['dateTime'] = FieldValue.serverTimestamp();
    return data;
  }
}
