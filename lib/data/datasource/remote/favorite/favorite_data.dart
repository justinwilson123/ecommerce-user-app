import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addfavorite(userid, itemid) async {
    var response = await crud.postData(Applink.addFavorite, {
      "favorite_user_id": userid,
      "favorite_items_id": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removefavorite(userid, itemid) async {
    var response = await crud.postData(Applink.removeFavorite, {
      "favorite_user_id": userid,
      "favorite_items_id": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
