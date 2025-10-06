import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData(String userName, String userEmail, String userPass) async {
    var response = await crud.postData(
      Applink.test,
      {
        "username": userName,
        "useremail": userEmail,
        "userpassword": userPass,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
