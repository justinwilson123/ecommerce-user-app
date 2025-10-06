import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

class GetAccessToken {
  //first lets add the endpont url
  static List<String> fierbaseMessagingScope = [
    "https://www.googleapis.com/auth/firebase.messaging",
  ];

  Future<String> getAccessToken() async {
    return Future.value("kjadf");
  }
}
