import 'package:dawah_mobile_application/feature/common/controller/video_open_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(VideoOpenController());
  }
}