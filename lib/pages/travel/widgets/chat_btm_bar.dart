import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/travel/index.dart';

import 'shadow_white_container.dart';

class ChatBottomBar extends StatelessWidget {
  final bool? enabled;
  const ChatBottomBar({super.key, this.enabled});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ShadowWhiteContainer(
            height: 44, width: double.infinity, child: Text("")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 44,
              decoration: BoxDecoration(
                  // color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(25)),
              child: SizedBox(
                child: Center(
                  child: Image.asset(
                    "images/openai_icon.png",
                    fit: BoxFit.fitHeight,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
            Expanded(
                child: TextField(
              controller: Get.find<TravelController>().textFieldController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 5),
                  hintText: "开始规划你行程",
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14)),
              enabled: enabled,
            )),
            GestureDetector(
              onTap: () {
                print("点击了发送按钮");
                TextEditingController textController =
                    Get.find<TravelController>().textFieldController;

                Get.find<TravelController>()
                    .sendChatMessage(textController.text);
              },
              child: Container(
                width: 55,
                height: 44,
                decoration: BoxDecoration(
                    // color: const Color.fromRGBO(250, 201, 203, 1),
                    // 渐变色
                    gradient: const LinearGradient(
                      colors: [Color(0xffE9DEF4), Color(0xffF2B7A9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                  child: Image.asset(
                    "images/send_icon.png",
                    fit: BoxFit.fitHeight,
                    width: 21,
                    height: 21,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
