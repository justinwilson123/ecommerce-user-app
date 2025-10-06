import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OtpForgetPasswordData {
  Crud crud;
  OtpForgetPasswordData(this.crud);

  getData(String useremail, String userverificode) async {
    var response = await crud.postData(Applink.otpForgetPassword, {
      "useremail": useremail,
      "userverificode": userverificode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
