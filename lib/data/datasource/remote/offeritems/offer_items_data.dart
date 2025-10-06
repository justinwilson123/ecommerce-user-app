import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OfferItemsData {
  Crud crud;
  OfferItemsData(this.crud);

  getData(String userid, String page) async {
    var response = await crud.postData(Applink.itemsOfferPage, {
      "favorite_user_id": userid,
      "page": page,
    });
    return response.fold((l) => l, (r) => r);
  }
}
