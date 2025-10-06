import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OtpLoginData {
  Crud crud;
  OtpLoginData(this.crud);

  postData(String useremail, String userverificode) async {
    var response = await crud.postData(Applink.otplogin, {
      "useremail": useremail,
      "userverificode": userverificode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
