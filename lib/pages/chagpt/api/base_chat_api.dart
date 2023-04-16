import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:sq_chatgpt/util/comm_util.dart';
import 'package:sq_chatgpt/util/login_helper.dart';

import 'aes_api.dart';

class BaseChatApi extends GetConnect {
  @override
  void onInit() {
    // httpClient.addAuthenticator(authInterceptor);

    debugPrint("-----------BaseChatApi init------------");

    // httpClient.baseUrl = kChatApiBaseUrl;
    httpClient.timeout = const Duration(seconds: 20);

    httpClient.addRequestModifier<void>((request) async {
      debugPrint("-----------BaseTodoApi request------------");
      debugPrint("url: ${request.url}");
      debugPrint("method: ${request.method}");

      if (AESApi.aeskey == null) {
        // 如果为空展示
        await AESApi().getKeyRequest();
      }

      // String token =
      // "eyJhbGciOiJIUzUxMiJ9.eyJuYW1lIjoi5oiR5Lus55qE5pel5bi4IiwiX2lkIjoiMTg1MjgzMzQ0YmQ2NGIyNmEyYmQ1MzczOTU5NzczMWYiLCJleHAiOjE2Nzc0MjQ3NjMsImlhdCI6MTY3NDgzMjc2MywiYmluZGlkIjo2MTcwfQ.n-6wHndaRP1CxAo14qEZhFBYp2sOlk5mFdRPftnAnuGWkoN5l1za7O7r7Rp8Z48aZtWcd3-SrlWEOQWZrvogAQ";

      String? token = LoginHelper.getUser()?.token;
      debugPrint("token: $token");
      if (token != null) {
        request.headers["Authorization"] = 'Bearer $token';
      }
      request.headers["version"] = "2.0";
      request.headers["platform"] = CommUtils.getAppPlatformInfo();
      //print(request.headers);
      return request;
    });

    httpClient.addResponseModifier((request, response) {
      debugPrint("-----------BaseTodoApi response------------");
      debugPrint("url: ${request.url}");

      debugPrint(response.bodyString);
      return response;
    });

    // super.onInit();
  }
}
