import 'package:get/get.dart';

import 'controller.dart';

class TravelTimelineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelTimelineController>(() => TravelTimelineController());
  }
}
