import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/hoempagecontroller/homepagecontroller.dart';
import 'package:ecommerce/controller/notification/notifiction_not_read_and_read_all_controller.dart';
import 'package:ecommerce/controller/search/search_contoller.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/class/view_status_requset.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/appbarscreenwidget.dart';
import 'package:ecommerce/view/widget/homepage/home_page_new_item_widget.dart';
import 'package:ecommerce/view/widget/homepage/home_page_top_rating_items_widget.dart';
import 'package:ecommerce/view/widget/homepage/home_page_top_sell_item_widget.dart';
import 'package:ecommerce/view/widget/homepage/homepagecategorieswidget.dart';
import 'package:ecommerce/view/widget/homepage/homepageitemswidget.dart';
import 'package:ecommerce/view/widget/homepage/homepageofferwidget.dart';
import 'package:ecommerce/view/widget/homepage/titletextwidget.dart';
import 'package:ecommerce/view/widget/search/seach_widget.dart';

class HomePage extends GetView<SearchContoller> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchContoller());
    HomepagecontrollerImp controllerImp = Get.put(HomepagecontrollerImp());
    NotificationNotReadAndReadAllController controllerNot = Get.find();

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      color: AppColor.backgroundappcolor,
      child: RefreshIndicator(
        onRefresh: () async {
          await controllerImp.getData();
          await controllerNot.getCountMessageNotRead();
          await controllerNot.getCountNotifiNotRead();
        },
        child: ListView(
          children: [
            AppbarScreeWidget(
              onPressedMess: () {
                controllerImp.goToMessaging();
              },
              controller: controller.search,
              onPressedNotifi: () {
                controllerImp.goToNotification();
              },
              onPressedSearch: () {
                controller.searchitem(controller.search.text);
              },
              onChanged: (val) {
                controller.onoffsearchfinction(val);
              },
            ),
            GetBuilder<SearchContoller>(
              builder: (controller) => controller.onoffsearsh == false
                  ? GetBuilder<HomepagecontrollerImp>(
                      builder: (controller) {
                        return controller.statusRequst == StatusRequst.loading
                            ? ViewStatusRequset(
                                statusRequst: controller.statusRequst,
                                size: Get.width / 2,
                                height: Get.height - 30,
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20),
                                  const Homepageofferwidget(),
                                  Center(
                                    child: TitleTextWidget(
                                      title: "65".tr,
                                      height: 20,
                                    ),
                                  ),
                                  const HoemPageCategoriesWidget(),
                                  TitleTextWidget(title: "66".tr, height: 20),
                                  const HomePageItemsWidget(),
                                  TitleTextWidget(title: "67".tr, height: 20),
                                  const HomePageItemsWidget(),
                                  TitleTextWidget(title: "72".tr, height: 20),
                                  const HomePageNewItemWidget(),
                                  TitleTextWidget(title: "73".tr, height: 20),
                                  const HomePageTopRatingItemsWidget(),
                                  TitleTextWidget(title: "74".tr, height: 20),
                                  const HomePageTopSellItemWidget(),
                                ],
                              );
                      },
                    )
                  : const SearchWidget(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
