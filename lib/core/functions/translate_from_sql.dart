import 'package:get/get.dart';
import 'package:ecommerce/core/services/servicer.dart';

MyService myService = Get.find();
translateFromSpl(celectarbic, celectenglish) {
  print(myService.sharedPreferences.getString("lang"));
  if (myService.sharedPreferences.getString("lang") == "ar") {
    return celectarbic;
  } else if (myService.sharedPreferences.getString("lang") == "en") {
    return celectenglish;
  }
}
