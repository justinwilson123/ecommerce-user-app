import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/itemcontroller.dart';
import 'package:ecommerce/controller/search/search_contoller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/appbarscreenwidget.dart';
import 'package:ecommerce/view/widget/items/listicategoriesitemswidget.dart';
import 'package:ecommerce/view/widget/items/listitemspagewidet.dart';
import 'package:ecommerce/view/widget/search/seach_widget.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemControllerImp controller = Get.put(ItemControllerImp());
    SearchContoller controllersearch = Get.put(SearchContoller());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.praimarycolor,
        onPressed: () {
          controller.goToFavoriteItems();
        },
        child: const Icon(Icons.favorite),
      ),
      body: Container(
        color: AppColor.backgroundappcolor,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                AppbarScreeWidget(
                  onPressedMess: () {
                    controller.goToMessaging();
                  },
                  controller: controllersearch.search,
                  onChanged: (val) {
                    controllersearch.onoffsearchfinction(val);
                  },
                  onPressedNotifi: () {
                    controller.goToNotification();
                  },
                  onPressedSearch: () {
                    controllersearch.searchitem(controllersearch.search.text);
                  },
                ),
                GetBuilder<SearchContoller>(
                  builder: (controllerseach) =>
                      controllerseach.onoffsearsh == false
                      ? const Column(
                          children: [
                            ListCatrgoriesItemsWidget(),
                            ListItemsPageWidget(),
                          ],
                        )
                      : WillPopScope(
                          onWillPop: () async {
                            controllersearch.refrish();
                            return false;
                          },
                          child: SearchWidget(
                            shrinkWrap: false,
                            physics: const AlwaysScrollableScrollPhysics(),
                            height: context.isLandscape
                                ? Get.height - 115
                                : Get.height - 115,
                            // onWillPop: () async {
                            //   controllersearch.refrish();
                            //   return false;
                            // },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
