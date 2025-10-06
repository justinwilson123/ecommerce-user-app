import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class EnterYourEmailData {
  Crud crud;
  EnterYourEmailData(this.crud);

  getData(String useremail) async {
    var response = await crud.postData(Applink.enteryouremail, {
      "useremail": useremail,
    });
    return response.fold((l) => l, (r) => r);
  }
}
