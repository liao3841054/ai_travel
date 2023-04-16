import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/chagpt/api/chat_response.dart';
import 'package:sq_chatgpt/pages/chagpt/models/role.dart';
import 'package:sq_chatgpt/pages/chagpt/user_controller.dart';
import 'package:sq_chatgpt/util/login_helper.dart';

import '../api/api_env.dart';
import '../api/base_chat_api.dart';

class ChatBizApi extends BaseChatApi {
  List messageList = [];

  Future<Response> chatGptWithPrompt(ChatRole? role, String prompt) {
    GetConnect connect = GetConnect(timeout: const Duration(seconds: 60));

    List message = [];

    if (role != null) {
      message.add(role.toJSON());
    }
    ChatRole userRole = ChatRole("user", "用户", prompt, role?.demoInput ?? "");
    message.add(userRole.toJSON());

    var body = {'prompt': "", 'messages': message, 'model': 'gpt-3.5-turbo'};
    debugPrint("打印请求参数：");
    debugPrint(body.toString());

    String key = Get.find<UserServiceController>().appKey;

    String? userApiKey = LoginHelper.getApiKey();
    if (userApiKey != null && userApiKey.isNotEmpty) {
      key = userApiKey;
      debugPrint('是用来自定义：$key');
    }

    return connect.post('https://api.com/api/v1/text?key=$key', body);
  }

  Future<Response> chatGptWithMessageList(
      List<Map<String, dynamic>> messageList) {
    GetConnect connect = GetConnect(timeout: const Duration(seconds: 60));

    var body = {
      'prompt': "",
      'messages': messageList,
      'model': 'gpt-3.5-turbo'
    };
    debugPrint("打印请求参数：");
    debugPrint(messageList.toString());

    debugPrint(body.toString());

    String key = Get.find<UserServiceController>().appKey;

    String? userApiKey = LoginHelper.getApiKey();
    if (userApiKey != null && userApiKey.isNotEmpty) {
      key = userApiKey;
      debugPrint('是用来自定义：$key');
    }

    return connect.post('https://api.com/api/v1/text?key=$key', body);
  }

  /////-------------------- 演示

  Future<ChatResponse> simpleDtemo() async {
    Response res = await get('$kChatApiBaseUrl/user/times');
    return getBizResponse(res);
  }

  /// 通用解析下
  ChatResponse getBizResponse(Response res) {
    debugPrint(res.bodyString);
    if (!res.isOk) {
      return ChatResponse(code: res.statusCode, message: res.statusText);
    }
    ChatResponse response = ChatResponse.fromJson(res.body);

    return response;
  }
}
