import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/travel/index.dart';
import 'package:sq_chatgpt/widgets/sq_text.dart';

import 'chat_btm_bar.dart';

class ChatBottomSheet extends StatefulWidget {
  @override
  _MyChatBottomSheet createState() => _MyChatBottomSheet();
}

class _MyChatBottomSheet extends State<ChatBottomSheet> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return ChatActionSheetContent();
              },
            );
          },
          child: Text('Show Modal Bottom Sheet'),
        ),
      ),
    );
  }
}

class ChatActionSheetContent extends StatelessWidget {
  const ChatActionSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          Container(color: Colors.white, child: const ChatBottomBar()),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          controller: Get.find<TravelController>().scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() {
                  return Column(
                    children: Get.find<TravelController>().messageList.map((e) {
                      ChatMessage message = e;
                      return ChatItem(
                        text: message.messageContent,
                        isChatBot: message.isAnswer,
                      );
                    }).toList(),
                  );
                }),
                const SizedBox(height: 16.0),
                Obx(() {
                  return Get.find<TravelController>().showPlanButton == true
                      ? TextButton(
                          onPressed: () {
                            Get.find<TravelController>().reShowPlan();
                          },
                          child: const SQText(
                            "生成行程🚗",
                            color: Colors.blue,
                          ))
                      : Container();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String text;
  final bool isChatBot;
  const ChatItem({super.key, required this.text, required this.isChatBot});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isChatBot ? Container() : const Spacer(),
        Container(
          margin: const EdgeInsets.all(15.0),
          constraints: BoxConstraints(
            maxWidth: Get.width * 0.6,
          ),
          alignment: isChatBot ? Alignment.centerLeft : Alignment.centerRight,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
