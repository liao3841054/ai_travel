import 'package:get/get.dart';

class UserServiceController extends GetxController {
  UserServiceController();

  RxInt remainTime = 0.obs;
  RxBool loadFinish = false.obs;

  bool showVip = true;
  String qrCodeUrl = "";
  String appKey = "";

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void loadData() async {}

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  void logoout() {
    remainTime.value = 0;
    update();
  }

  void login() {}
}
