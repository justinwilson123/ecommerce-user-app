import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/notification/notifiction_not_read_and_read_all_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class AppbarScreeWidget extends StatelessWidget {
  final void Function()? onPressedNotifi;
  final void Function()? onPressedSearch;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? onPressedMess;
  const AppbarScreeWidget({
    super.key,
    required this.onPressedNotifi,
    required this.onPressedSearch,
    required this.onChanged,
    required this.onPressedMess,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    NotificationNotReadAndReadAllController controllerNot = Get.find();
    return SizedBox(
      height: context.isLandscape ? Get.height / 7 : Get.height / 15,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Obx(
                () => controllerNot.countNotifi.value == 0
                    ? ClipOval(
                        child: Container(
                          width: context.isLandscape
                              ? Get.height / 7
                              : Get.height / 15,
                          color: Colors.orange[200],
                          child: IconButton(
                            color: AppColor.praimarycolor,
                            onPressed: onPressedNotifi,
                            icon: const Icon(Icons.notification_add_outlined),
                          ),
                        ),
                      )
                    : Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.red,
                              width: context.isLandscape
                                  ? Get.height / 7
                                  : Get.height / 15,
                              height: context.isLandscape
                                  ? Get.height / 7
                                  : Get.height / 15,
                              padding: const EdgeInsets.all(1),
                              child: ClipOval(
                                child: Container(
                                  width: context.isLandscape
                                      ? Get.height / 7
                                      : Get.height / 15,
                                  color: Colors.orange[200],
                                  child: IconButton(
                                    color: AppColor.praimarycolor,
                                    onPressed: onPressedNotifi,
                                    icon: const Icon(
                                      Icons.notification_add_outlined,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.red,
                              height: 15,
                              width: 15,
                              child: Text(
                                textAlign: TextAlign.center,
                                controllerNot.countNotifi.value > 9
                                    ? "+9"
                                    : "${controllerNot.countNotifi.value}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller,
                onChanged: onChanged,
                scrollPadding: const EdgeInsets.symmetric(vertical: 1),
                cursorColor: AppColor.praimarycolor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.orange[200],
                  prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: const Icon(
                      Icons.search_outlined,
                      size: 20,
                      color: AppColor.praimarycolor,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Obx(
                () => controllerNot.countMessaging.value == 0
                    ? ClipOval(
                        child: Container(
                          width: context.isLandscape
                              ? Get.height / 7
                              : Get.height / 15,
                          color: Colors.orange[200],
                          child: IconButton(
                            color: AppColor.praimarycolor,
                            onPressed: onPressedMess,
                            icon: const Icon(Icons.message),
                          ),
                        ),
                      )
                    : Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          ClipOval(
                            child: Container(
                              color: Colors.red,
                              width: context.isLandscape
                                  ? Get.height / 7
                                  : Get.height / 15,
                              height: context.isLandscape
                                  ? Get.height / 7
                                  : Get.height / 15,
                              padding: const EdgeInsets.all(1),
                              child: ClipOval(
                                child: Container(
                                  width: context.isLandscape
                                      ? Get.height / 7
                                      : Get.height / 15,
                                  color: Colors.orange[200],
                                  child: IconButton(
                                    color: AppColor.praimarycolor,
                                    onPressed: onPressedMess,
                                    icon: const Icon(Icons.message),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipOval(
                            child: Container(
                              color: Colors.red,
                              height: 15,
                              width: 15,
                              child: Text(
                                textAlign: TextAlign.center,
                                controllerNot.countMessaging.value > 9
                                    ? "+9"
                                    : "${controllerNot.countMessaging.value}",
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// SizedBox(
//               child: ClipOval(
//                 child: Container(
//                   width: context.isLandscape ? Get.height / 7 : Get.height / 15,
//                   color: Colors.orange[200],
//                   child: IconButton(
//                       color: AppColor.praimarycolor,
//                       onPressed: onPressedMess,
//                       icon: const Icon(Icons.messenger_outline_sharp)),
//                 ),
//               ),
//             ),