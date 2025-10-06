import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class NewPasswordData {
  Crud crud;
  NewPasswordData(this.crud);

  getData(String useremail, String userpassword) async {
    var response = await crud.postData(Applink.newpassword, {
      "useremail": useremail,
      "userpassword": userpassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
