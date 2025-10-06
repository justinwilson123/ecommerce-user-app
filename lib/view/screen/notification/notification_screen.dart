import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/notification/get_notification_conatroller.dart';
import 'package:ecommerce/controller/notification/notifiction_not_read_and_read_all_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GetNotificationConatrollerImp());
    NotificationNotReadAndReadAllController controllerNot = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimarycolor,
        title: Text("99".tr, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          controllerNot.readAllNotification();
          Get.back();
          return true;
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          color: AppColor.backgroundappcolor,
          child: GetBuilder<GetNotificationConatrollerImp>(
            builder: (controller) => ViewHandLingData(
              statusRequst: controller.statusRequst,
              widget: ListView.builder(
                itemCount: controller.myNotification.length,
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.myNotification[i].isRead == 0
                          ? Colors.black12
                          : Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.myNotification[i].titleNotification}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      controller.myNotification[i].isRead == 0
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                "${controller.myNotification[i].bodyNotification}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      controller.myNotification[i].isRead == 0
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outlined),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
