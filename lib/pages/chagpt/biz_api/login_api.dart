import 'package:get/get_connect.dart';

import '../api/api_env.dart';
import '../api/base_chat_api.dart';

class LoginBizApi extends BaseChatApi {
  // "account": "账号",
  //   "password": "密码",
  //   "phone": "手机号"
  Future<Response> register(String account, String password, {String? phone}) {
    return post('$kChatApiBaseUrl/user/account/register',
        {"account": account, "password": password, "phone": phone});
  }

  Future<Response> accountLogin(String account, String password) {
    return post('$kChatApiBaseUrl/user/account/login',
        {"account": account, "password": password});
  }

  Future<Response> authApple(data) {
    return post('$kChatApiBaseUrl/auth/apple', data);
  }

  // 删除账户
  Future<Response> deleteAccount(data) {
    return post('$kChatApiBaseUrl/user/delete', data);
  }
}
