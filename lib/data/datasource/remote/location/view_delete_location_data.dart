import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class ViewAndDeleteLocationData {
  Crud crud;
  ViewAndDeleteLocationData(this.crud);

  getData(String locationUserId) async {
    var response = await crud.postData(Applink.viewLocation, {
      "location_user_id": locationUserId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String locationid) async {
    var response = await crud.postData(Applink.deleteLocation, {
      "location_id": locationid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
