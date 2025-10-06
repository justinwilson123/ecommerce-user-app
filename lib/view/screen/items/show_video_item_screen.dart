import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/show_video_item_controller.dart';

class ShowVideoItemScreen extends StatelessWidget {
  const ShowVideoItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ShowVideoItemController controllerI = Get.put(ShowVideoItemController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (controllerI.flickManager.flickControlManager!.isFullscreen) {
            controllerI.flickManager.flickControlManager!.exitFullscreen();
            return false;
          } else {
            controllerI.flickManager.flickControlManager!.autoPause();
            // controllerI.flickManager.dispose();
            Get.back();
            return false;
          }
        },
        child: SafeArea(
          child: Container(
            color: Colors.black,
            child: GetBuilder<ShowVideoItemController>(
              builder: (controller) => Center(
                child: AspectRatio(
                  aspectRatio: 13 / 10,
                  child: FlickVideoPlayer(
                    flickManager: controller.flickManager,
                    flickVideoWithControls: const FlickVideoWithControls(
                      closedCaptionTextStyle: TextStyle(fontSize: 8),
                      controls: FlickPortraitControls(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
