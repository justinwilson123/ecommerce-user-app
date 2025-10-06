import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  searchtData(String search) async {
    var response = await crud.postData(Applink.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
