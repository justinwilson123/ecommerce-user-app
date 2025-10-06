import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String itemsCategoriesId, String userid, String page) async {
    var response = await crud.postData(Applink.itemsview, {
      "items_categories_id": itemsCategoriesId,
      "favorite_user_id": userid,
      "page": page,
    });
    return response.fold((l) => l, (r) => r);
  }

  getDataimages(String itemImageId) async {
    var response = await crud.postData(Applink.itemImages, {
      "item_image_id": itemImageId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getDataVideo(String itemVideoId) async {
    var response = await crud.postData(Applink.itemVideo, {
      "item_video_id": itemVideoId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
