import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/messaging/main_messaging_controller.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class MainMessagingScreen extends StatelessWidget {
  const MainMessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainMessagingController controller = Get.put(MainMessagingController());
    return Scaffold(
      appBar: AppBar(title: Text("Messages"), backgroundColor: Colors.green),
      body: Obx(
        () => Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: controller.myChats.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 70,
                child: Card(
                  color: Colors.green.shade100,
                  child: ListTile(
                    onTap: () {
                      if (controller.myChats[index].senderId !=
                          controller.myID) {
                        controller.updateCounter(
                          controller.myChats[index].uids!,
                        );
                      }
                      controller.goToSendMessage(
                        imageOtherUser: controller.imageOtherName(
                          controller.myChats[index].nameimage1!,
                          controller.myChats[index].nameimage2!,
                        ),
                        otherID: controller.otheID(
                          controller.myChats[index].uids!,
                        ),
                        otherUserName: controller.otherUserName(
                          controller.myChats[index].username1!,
                          controller.myChats[index].username2!,
                        ),
                        uids: controller.myChats[index].uids!,
                      );
                    },
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${controller.myChats[index].time!.hour}:${controller.myChats[index].time!.minute}",
                        ),
                        if (controller.myChats[index].senderId !=
                                controller.myID &&
                            controller.myChats[index].counter != 0)
                          Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 20, 214, 26),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("${controller.myChats[index].counter}"),
                          ),
                      ],
                    ),
                    subtitle: SizedBox(
                      height: 20,
                      child: Text(
                        "${controller.myChats[index].text}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    title: SizedBox(
                      height: 30,
                      child: Text(
                        controller.otherUserName(
                          controller.myChats[index].username1!,
                          controller.myChats[index].username2!,
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    leading: ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                        imageUrl:
                            "${Applink.linkImageUser}${controller.imageOtherName(controller.myChats[index].nameimage1!, controller.myChats[index].nameimage2!)}",
                      ),
                    ),
                    //  CircleAvatar(
                    //   backgroundImage: CachedNetworkImageProvider(
                    //     "${Applink.linkImageUser}${controller.imageOtherName(controller.myChats[index].nameimage1!, controller.myChats[index].nameimage2!)}",
                    //   ),
                    // ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
