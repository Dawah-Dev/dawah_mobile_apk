import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoOpenController extends GetxController {
  bool _miniPlayerIsVisible = false;

  bool get miniPlayerIsVisible => _miniPlayerIsVisible;
  late YoutubePlayerController youtubePlayerController;

  Future<YoutubePlayerController> clickForVideoPlay(Map<String,dynamic> videoinfo) async {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoinfo['id'],
      flags: YoutubePlayerFlags(
        hideControls: true,
        autoPlay: true,
        mute: false,
      ),
    );
    openvideo();
    return youtubePlayerController;
  }

  void openvideo() {
    _miniPlayerIsVisible = true;
    update();
  }

  void closeVideo() {
    _miniPlayerIsVisible = false;
    update();
  }
}
