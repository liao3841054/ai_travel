import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ChatMessage {
  final String messageContent;
  final bool isAnswer;

  ChatMessage({required this.messageContent, required this.isAnswer});
}

class TravelController extends GetxController {
  TravelController();

  final state = TravelState();

  TextEditingController textFieldController = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxList messageList = [].obs;
  var showPlan = false.obs;
  var showPlanButton = false.obs;

  List<Map<String, String>> qaList = [
    {"number": "1", "question": '请帮我规划一个北京前往香港的旅程', "answer": '好的，您想要哪天出发？'},
    {"number": "2", "question": '4月21日', "answer": '好的，我帮您挑选一下航班；您想住在哪里的酒店？'},
    {
      "number": "3",
      "question": '我想坐地铁去机场',
      "answer": '好的，北京首都机场有地铁线路，您需要我告诉您怎么坐吗？'
    },
    {
      "number": "4",
      "question": '请告诉我从北京首都机场到香港国际机场的航班信息',
      "answer": '好的，请问您需要经济舱还是商务舱？'
    },
    {
      "number": "5",
      "question": '我需要一间酒店，距离香港湾仔比较近的',
      "answer": '好的，我为您查找附近的酒店。请问您的预算是多少？'
    },
    {
      "number": "6",
      "question": '我想打车去酒店，您能帮我预订吗？',
      "answer": '好的，我会为您预订出租车。请问您的到达时间是什么时候？'
    },
    {
      "number": "7",
      "question": '我想去香港岛的海港城购物，怎么走比较方便？',
      "answer": '好的，您可以乘坐地铁到达，也可以乘坐的士或者巴士。请问您需要我为您查找具体的交通线路吗？'
    },
    {
      "number": "8",
      "question": '我想在香港体验当地美食，有什么好的推荐吗？',
      "answer": '好的，香港有很多著名的美食餐厅，如何选择会根据您的口味而定。请问您喜欢哪种口味的菜肴？'
    }
  ];

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    textFieldController.dispose();
  }

  void reShowPlan() {
    showPlan.value = true;
    textFieldController.clear();
    Get.back();
  }

  void sendChatMessage(String message) {
    for (var element in qaList) {
      if (element['number'] == message) {
        messageList.add(ChatMessage(
            isAnswer: false, messageContent: element['question'] ?? ""));
        messageList.add(ChatMessage(
            isAnswer: true, messageContent: element['answer'] ?? ""));
        if (messageList.length > 3) {
          showPlanButton.value = true;
        }
        break;
      }
    }
    textFieldController.clear();
    Future.delayed(const Duration(seconds: 1), () {
      istViewScrollToEnd();
    });
  }

  istViewScrollToEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 360), curve: Curves.bounceIn);
  }
}
