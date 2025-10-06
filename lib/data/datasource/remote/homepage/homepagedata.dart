import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class HomePageData {
  Crud crud;
  HomePageData(this.crud);

  getData() async {
    var response = await crud.postData(Applink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}
