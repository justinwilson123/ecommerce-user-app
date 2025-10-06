import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/messaging/current_messaging_controller.dart';

class CurrentUserMessagingScreen extends StatelessWidget {
  const CurrentUserMessagingScreen({super.key});
  //  http://127.0.0.1:58026/drE5D0S5FPA=/

  @override
  Widget build(BuildContext context) {
    CurrentMessagingController controllerI = Get.put(
      CurrentMessagingController(),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: 50,
                height: 50,
                imageUrl: controllerI.imageUrl,
              ),
            ),
          ),
        ],

        title: Text(controllerI.otherUserName),
        backgroundColor: Colors.green,
        shadowColor: Colors.green.shade900,
      ),
      body: WillPopScope(
        onWillPop: () async {
          await controllerI.updateCounter();

          return true;
        },
        child: GetBuilder<CurrentMessagingController>(
          builder: (controller) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Obx(
                () => DashChat(
                  quickReplyOptions: QuickReplyOptions(
                    onTapQuickReply: (dsk) {},
                  ),
                  inputOptions: InputOptions(
                    inputToolbarStyle: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    cursorStyle: const CursorStyle(
                      color: Colors.green,
                      width: 1,
                    ),
                    inputDecoration: const InputDecoration(
                      iconColor: Colors.green,
                      focusColor: Colors.grey,
                      hoverColor: Colors.grey,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    leading: [
                      IconButton(
                        onPressed: () async {
                          await controller.choosImageFromCamera();
                          if (controller.file != null) {
                            await controller.getImageName(controller.file!);
                          }
                        },
                        icon: const Icon(Icons.camera, color: Colors.green),
                      ),
                      IconButton(
                        onPressed: () async {
                          await controller.choosImageFromGallery();
                          if (controller.file != null) {
                            await controller.getImageName(controller.file!);
                          }
                        },
                        icon: const Icon(Icons.photo, color: Colors.green),
                      ),
                    ],
                    alwaysShowSend: true,
                  ),
                  messageOptions: const MessageOptions(
                    showOtherUsersAvatar: true,
                    showOtherUsersName: true,
                    timeFontSize: 7,
                    textColor: Colors.black,
                    currentUserTextColor: Colors.black,
                    currentUserTimeTextColor: Colors.white,
                    timeTextColor: Colors.grey,
                    showTime: true,
                    containerColor: Colors.orange,
                    currentUserContainerColor: Colors.green,
                  ),
                  currentUser: controller.currentUser,
                  onSend: controller.onsend,
                  messages: controller.changMessages(controller.message),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
