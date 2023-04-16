import 'package:get/get.dart';

import 'controller.dart';

class TravelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelController>(() => TravelController());
  }
}
