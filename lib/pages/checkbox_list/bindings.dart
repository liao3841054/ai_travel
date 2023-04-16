import 'package:get/get.dart';

import 'controller.dart';

class CheckboxListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckboxListController>(() => CheckboxListController());
  }
}
