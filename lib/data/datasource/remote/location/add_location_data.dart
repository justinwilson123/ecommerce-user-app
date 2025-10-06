import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class AddLocationData {
  Crud crud;
  AddLocationData(this.crud);

  addData(
    String country,
    String state,
    String city,
    String street,
    String longtudes,
    String latitudes,
    String locationUserId,
    String namelocation,
    String detailslocation,
    String phoneNumber,
    String yourName,
  ) async {
    var response = await crud.postData(Applink.addLocation, {
      "country": country,
      "state": state,
      "city": city,
      "street": street,
      "longtudes": longtudes,
      "latitudes": latitudes,
      "location_user_id": locationUserId,
      "namelocation": namelocation,
      "details_location": detailslocation,
      "phone_number": phoneNumber,
      "your_name": yourName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
