import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/chagpt/biz_api/biz_api.dart';
import 'package:sq_chatgpt/pages/chagpt/user_controller.dart';

import 'controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChatBizApi>(ChatBizApi());
    Get.put<ChatController>(ChatController());
    Get.put<UserServiceController>(UserServiceController());
  }
}
