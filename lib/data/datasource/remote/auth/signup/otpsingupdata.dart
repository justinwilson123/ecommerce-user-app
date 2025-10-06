import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OtpSignUpData {
  Crud crud;
  OtpSignUpData(this.crud);

  postData(String useremail, String userverificode) async {
    var response = await crud.postData(Applink.otpsigup, {
      "useremail": useremail,
      "userverificode": userverificode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
