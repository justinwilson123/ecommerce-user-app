import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class ViewFavoriteData {
  Crud crud;
  ViewFavoriteData(this.crud);

  getData(userid) async {
    var response = await crud.postData(Applink.viewFavorite, {
      "favorite_user_id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletdata(favoriteid) async {
    var response = await crud.postData(Applink.deletFavorite, {
      "favorite_id": favoriteid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
