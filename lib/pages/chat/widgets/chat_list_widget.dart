import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/chagpt/models/chatgpt_response.dart';
import 'package:sq_chatgpt/pages/login/login_page.dart';
import 'package:sq_chatgpt/util/cache_util.dart';
import 'package:sq_chatgpt/util/comm_util.dart';
import 'package:sq_chatgpt/util/login_helper.dart';
import 'package:sq_chatgpt/widgets/sq_text.dart';
import 'package:sq_chatgpt/widgets/typing_effect.dart';

import '../index.dart';

class ChatListWidget extends GetView<ChatController> {
  final bool noTitle;
  const ChatListWidget({Key? key, this.noTitle = false}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const ChatListWidgetContent();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (_) {
        return Scaffold(
          appBar: noTitle ? null : AppBar(title: const Text("问答")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

class ChatListWidgetContent extends GetView<ChatController> {
  const ChatListWidgetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("专家问答"),
      // ),
      body: Obx((() => ListView.builder(
          padding: const EdgeInsets.only(bottom: 44),
          controller: controller.scrollController,
          itemCount: controller.list.length + 1,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: ((context, index) {
            if (index == controller.list.length) {
              return SizedBox(
                height: Get.height * 0.4,
              );
            }

            ChatGPTResponse response = controller.list[index];

            if (index == 0) {
              return Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SQText(
                      response.choices![0].text!,
                      maxLines: 10,
                      fontSize: 13,
                    ),
                  ));
            }
            return ChatGPTResultView(
              response: response,
            );
          })))),

      bottomNavigationBar: const BottomInput(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class BottomInput extends GetView<ChatController> {
  const BottomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        // height: 44,
        child: Row(
          children: [
            Expanded(
              child: RawKeyboardListener(
                focusNode: FocusNode(), // controller.focusNode,
                onKey: keyboardListener,
                child: TextField(
                  maxLines: null,
                  controller: controller.chatEditingController,
                  decoration: const InputDecoration(
                    hintText: '问AI',
                  ),
                  onSubmitted: (value) =>
                      {controller.bottomSendButtonClicked()},
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                controller.bottomSendButtonClicked();
              },
            )
          ],
        ),
      ),
    );
  }

  void keyboardListener(event) {
    if (event.runtimeType == RawKeyUpEvent) {
      // if (event.physicalKey == PhysicalKeyboardKey.arrowUp) {
      //   _onTapKey(KeyCode.dpadUp);
      // } else if (event.physicalKey == PhysicalKeyboardKey.arrowDown) {
      //   _onTapKey(KeyCode.dpadDown);
      // } else if (event.physicalKey == PhysicalKeyboardKey.arrowLeft) {
      //   _onTapKey(KeyCode.dpadLeft);
      // } else if (event.physicalKey == PhysicalKeyboardKey.arrowRight) {
      //   _onTapKey(KeyCode.dpadRight);
      // } else
      if (event.physicalKey == PhysicalKeyboardKey.enter) {
        controller.bottomSendButtonClicked();
      }
    }
  }
}

class ChatGPTResultView extends GetView<ChatController> {
  final ChatGPTResponse response;
  const ChatGPTResultView({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.only(top: 12, left: 12, right: 12),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (response.roleName != null)
                  SQText(
                    response.roleName ?? "",
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    maxLines: 1,
                    color: Colors.white.withAlpha(100),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SQText(
                        response.question ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        maxLines: null,
                        selectable: true,
                      ),
                    ),
                    IconButton(
                        tooltip: "重新发起提问",
                        onPressed: () async {
                          controller.chatEditingController.text =
                              response.question ?? "";
                        },
                        icon: const Icon(
                          Icons.repeat,
                          color: Colors.greenAccent,
                        )),
                    // IconButton(
                    //     tooltip: "复制",
                    //     onPressed: () async {
                    //       await CommUtils.copyToClipboard(
                    //           response.choices![0].text!);
                    //       CommUtils.showMessage("复制成功");
                    //     },
                    //     icon: const Icon(
                    //       Icons.copy_all,
                    //       color: Colors.greenAccent,
                    //     )),
                    // IconButton(
                    //     tooltip: "收藏",
                    //     onPressed: () async {
                    //       if (!LoginHelper.isLogin()) {
                    //         Get.to(const LoginScreen());
                    //         return;
                    //       }
                    //       controller.addCollect(response);

                    //       AppCacheUtils.saveAddRecordCount();
                    //       CommUtils.triggerLaunchAppReview();
                    //     },
                    //     icon: const Icon(
                    //       Icons.favorite,
                    //       color: Colors.greenAccent,
                    //     ))
                  ],
                ),
                const Divider(),
                if (response.requesting)
                  const SQText(
                    "AI 回答中...",
                  ),
                if (response.error != null)
                  SQText(
                    response.error!,
                    color: Colors.redAccent,
                  ),
                if ((response.choices?.length ?? 0) > 0)
                  TypingEffect(
                    text: response.choices?[0].text ?? "",
                    isAnimateEnd: response.isAnimateEnd,
                    typingChangeCallBack: () {
                      // controller.listViewScrollToEnd();
                      response.isAnimateEnd = true;
                    },
                  ),
                // SQText(
                //   response.choices?[0].text ?? "",
                //   color: Colors.white,
                //   fontSize: 14,
                //   maxLines: 1000,
                // )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    if (!LoginHelper.isLogin()) {
                      Get.to(const LoginScreen());
                      return;
                    }
                    AppCacheUtils.saveAddRecordCount();
                    CommUtils.triggerLaunchAppReview();
                  },
                  child: const SQText(
                    "收藏",
                    color: Colors.blueGrey,
                  )),
              TextButton(
                  onPressed: () async {
                    String text = response.question ?? "";
                    String answer = response.choices?[0].text ?? "";

                    await CommUtils.copyToClipboard("问题：$text\n\n$answer");
                    CommUtils.showMessage("复制成功");
                  },
                  child: const SQText(
                    "复制",
                    color: Colors.blueGrey,
                  )),
              // TextButton(
              //     onPressed: () {},
              //     child: const SQText(
              //       "分享",
              //       color: Colors.blueGrey,
              //     ))
            ],
          ),
        )
      ],
    );
  }
}
