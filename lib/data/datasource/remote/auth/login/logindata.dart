import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  getData(String useremail, String userpassword, String token) async {
    var response = await crud.postData(Applink.login, {
      "useremail": useremail,
      "userpassword": userpassword,
      "token_user": token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
