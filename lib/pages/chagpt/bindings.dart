import 'package:get/get.dart';

import 'controller.dart';

class ChagptBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChagptController>(() => ChagptController());
  }
}
