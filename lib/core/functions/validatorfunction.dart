import 'package:get/get.dart';

validtorFunction(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "29".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "24".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "25".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "26".tr;
    }
  }
  if (val.length < min) {
    return "27".tr;
  }
  if (val.length > max) {
    return "28".tr;
  }
}
