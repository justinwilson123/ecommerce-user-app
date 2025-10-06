import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class ReviewItmeData {
  Crud crud;
  ReviewItmeData(this.crud);

  getData(String ratingItemId) async {
    var response = await crud.postData(Applink.reviewItem, {
      "rating_item_id": ratingItemId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
