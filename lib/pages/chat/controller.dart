import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/chagpt/api/chat_response.dart';
import 'package:sq_chatgpt/pages/chagpt/models/role.dart';
import 'package:sq_chatgpt/pages/chagpt/models/user.dart';
import 'package:sq_chatgpt/pages/chagpt/user_controller.dart';
import 'package:sq_chatgpt/route.dart';
import 'package:sq_chatgpt/util/cache_util.dart';
import 'package:sq_chatgpt/util/comm_util.dart';
import 'package:sq_chatgpt/util/login_helper.dart';

import '../chagpt/biz_api/biz_api.dart';
import '../chagpt/models/category.dart';
import '../chagpt/models/chatgpt_response.dart';
import 'index.dart';

class ChatController extends GetxController {
  Rx<QuestionList> currQuestion = QuestionList.fromJson({}).obs;
  ChatRole? role;
  TextEditingController chatEditingController = TextEditingController(text: "");
  FocusNode focusNode = FocusNode();

  ScrollController scrollController = ScrollController();

  ChatBizApi api = Get.find<ChatBizApi>();

  RxList list = [].obs;

  RxList menuList = [
    {
      "title": "旅游",
      "emoji": "🆘",
      "icon": "assets/images/ic_setting.png",
      "route": Routes.kTravelScreen,
    },
  ].obs;

  RxList roleList = [].obs;

  ChatRole groupValue = kRoleList.first;

  final state = ChatState();
  bool isRequesting = false;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    // AppCacheUtils.saveCustomRoleList([]);

    ChatGPTResponse response = ChatGPTResponse();
    String text = '🤖 欢迎使用，有任何问题都可以向我提出，我会尽力为您提供最准确、最实用的答案。';
    response.choices = [Choices(text: text)];
    list.add(response);

    List<ChatRole> mList = AppCacheUtils.getCustomRoleList();
    if (mList.isEmpty) {
      mList = kRoleList;
    }
    roleList.value = mList;
    role = roleList.first;
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    debugPrint("onReady-----");

    dynamic arguments = Get.arguments;
    if (arguments != null) {
      currQuestion.value = arguments;
      currQuestion.refresh();

      buildHttpQuestions(currQuestion.value);

      debugPrint(currQuestion.toJson().toString());
    }
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    debugPrint("onClose---");
    chatEditingController.dispose();
    scrollController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    debugPrint("dispose---");
    super.dispose();
  }

  void bottomSendButtonClicked() {
    if (!LoginHelper.isLogin()) {
      Get.toNamed(Routes.kLoginScreen);
      CommUtils.showMessage("请先登录！！！");
      return;
    }
    if (LoginHelper.getUser()?.isVipFlag == false &&
        !AppCacheUtils.canSendRequest()) {
      return;
    }

    bool isRequesting = false;
    if (list.isNotEmpty) {
      isRequesting = (list.last as ChatGPTResponse).requesting;
    }
    if (!isRequesting) {
      String text = chatEditingController.text.trim();
      sendQuestion(text);
      chatEditingController.clear();
    } else {
      CommUtils.showMessage("等待Ai回答中..");
    }
  }

  void buildHttpQuestions(QuestionList questionList) async {
    ChatGPTResponse response = ChatGPTResponse();
    response.question = questionList.title;
    response.requesting = true;
    list.add(response);

    Future.delayed(const Duration(microseconds: 360), () {
      listViewScrollToEnd();
    });

    Future.delayed(const Duration(seconds: 3), () {
      response.requesting = false;
      Choices choices = Choices(text: questionList.answer);
      response.choices = [choices];
      response.error = null;
      list.refresh();
    });
  }

  /// 发送问题

  void sendQuestion(String text) async {
    debugPrint("发送文案===$text===");
    ChatGPTResponse response = ChatGPTResponse();
    response.question = text;
    response.roleName = role?.roleName;
    response.requesting = true;
    list.add(response);

    // listViewScrollToEnd();
    Future.delayed(const Duration(microseconds: 360), () {
      listViewScrollToEnd();
    });

    ChatGPTResponse chatResponse = await requestWithPrompt(role!, text);
    response.requesting = false;

    response.choices = chatResponse.choices;
    response.error = chatResponse.error;
    list.refresh();

    if (chatResponse.error == null) {
      AppCacheUtils.saveFreeSendCount();
      // 触发评分操作
      AppCacheUtils.saveSendSuccesCount();
      CommUtils.triggerLaunchAppReview();
    }
  }

  //// request
  Future<ChatGPTResponse> requestWithPrompt(
      ChatRole role, String prompt) async {
    Response response = await ChatBizApi().chatGptWithPrompt(role, prompt);
    debugPrint("chatGPT:${response.bodyString}");

    if (response.statusCode == 200 && response.body != null) {
      return ChatGPTResponse.fromJson(response.body);
    }
    debugPrint("chatGPT:${response.statusCode}");
    return ChatGPTResponse(error: "现在访问的人太多，请稍后再试");
  }

  listViewScrollToEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 360), curve: Curves.bounceIn);
  }

  listViewScrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(microseconds: 360), curve: Curves.bounceIn);
  }
}
