import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:video_player/video_player.dart';

class ShowVideoItemController extends GetxController {
  late String videoName;
  late FlickManager flickManager;
  // late VideoPlayerController pc;

  ifPlayVideo() {}

  @override
  void onClose() async {
    await flickManager.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    videoName = Get.arguments["videoName"];

    // pc = VideoPlayerController.networkUrl(
    //     Uri.parse("${Applink.linkVideoItem}$videoName"))
    //   ..initialize().then((_) {
    //     update();
    //   });

    flickManager = FlickManager(
      autoInitialize: false,
      videoPlayerController:
          VideoPlayerController.networkUrl(
              Uri.parse("${Applink.linkVideoItem}$videoName"),
            )
            ..initialize().then((_) {
              update();
            }),
    );
  }
}
