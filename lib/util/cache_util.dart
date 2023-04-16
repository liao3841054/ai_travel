import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sq_chatgpt/pages/chagpt/models/role.dart';
import 'package:sq_chatgpt/pages/chagpt/user_controller.dart';

import 'comm_util.dart';

const kSendCountKey = "kSendCountKey";
const kAddRecordCountKey = "kAddRecordCountKey";

const kCustomRoleListKey = "kAddCustomRoleListKey";

const kCustomLimtSendKey = "kCustomLimtSendKey";

class AppCacheUtils {
  static GetStorage appStorage = GetStorage();

////////////////////////////////
  /// 缓存
  static int getSendChatCount() {
    return appStorage.read<int>(kSendCountKey) ?? 0;
  }

  static void saveSendSuccesCount() {
    int count = getSendChatCount();
    appStorage.write(kSendCountKey, count + 1);
  }

  static int getAddRecordCount() {
    return appStorage.read<int>(kAddRecordCountKey) ?? 0;
  }

  static void saveAddRecordCount() {
    int count = getAddRecordCount();
    appStorage.write(kAddRecordCountKey, count + 1);
  }

  static List<ChatRole> getCustomRoleList() {
    List<dynamic> dataList = appStorage.read(kCustomRoleListKey) ?? [];
    if (dataList.isNotEmpty && dataList.first is ChatRole) {
      return dataList as List<ChatRole>;
    }
    return dataList.map((e) => ChatRole.fromJson(e)).toList();
  }

  static saveCustomRoleList(List<dynamic>? list) {
    return appStorage.write(kCustomRoleListKey, list);
  }

  static bool canSendRequest() {
    int remainTime = Get.find<UserServiceController>().remainTime.value;
    if (!kDebugMode && remainTime <= 0) {
      CommUtils.showMessage("今日问答次数已上线.请明天再来吧！");
      return false;
    }

    return true;
  }

  static int getFreeSendCount() {
    String key = kCustomLimtSendKey + getYMDString();
    return appStorage.read<int>(key) ?? 0;
  }

  static void saveFreeSendCount() {
    int count = getFreeSendCount();
    String key = kCustomLimtSendKey + getYMDString();
    appStorage.write(key, count + 1);
  }

  static getYMDString() {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }
}
