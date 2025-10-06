import 'dart:io';

import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);

  postData(
    String username,
    String useremail,
    String userphone,
    String userpassword,
    File image,
  ) async {
    var response = await crud.addRequstWithImageOne(Applink.singup, {
      "username": username,
      "useremail": useremail,
      "userphone": userphone,
      "userpassword": userpassword,
    }, image);
    return response.fold((l) => l, (r) => r);
  }

  postDataWithGoogle(String userName, String userEmail, String userPass) async {
    var response = await crud.postData(Applink.singUPWithGoogle, {
      "username": userName,
      "useremail": userEmail,
      "userpassword": userPass,
    });
    return response.fold((l) => l, (r) => r);
  }
}
