// ignore_for_file: unnecessary_const
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/chagpt/user_controller.dart';
import 'package:sq_chatgpt/pages/chat/widgets/widgets.dart';
import 'package:sq_chatgpt/widgets/sq_text.dart';

import 'index.dart';

class ChatPage extends GetView<ChatController> {
  // final QuestionList question;
  const ChatPage({Key? key}) : super(key: key);

  Widget _buildGridView(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Get.find<UserServiceController>().loadFinish.value
            ? buidBody(context)
            : Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 20),
                      const Text("加载中..."),
                    ]),
              ));
  }

  buidBody(BuildContext context) {
    return Get.find<UserServiceController>().showVip
        ? buildConttentView(context)
        : const ChatListWidget(
            noTitle: true,
          );
  }

  buildConttentView(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int gridCount = width ~/ ((300) / 2); // 每个网格项的宽度
    if (gridCount <= 1) {
      gridCount = 1;
    }
    return CustomScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: <Widget>[
        Obx((() => SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                //Grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCount, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),

                delegate: SliverChildBuilderDelegate(
                  childCount: controller.menuList.length,
                  (BuildContext context, int index) {
                    Map<String, dynamic> data = controller.menuList[index];

                    //创建子widget
                    return InkWell(
                      onTap: () {
                        Get.toNamed(data["route"]);
                      },
                      child: Card(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(12),
                          // color:]
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: SQText(
                                  data['emoji'],
                                  fontSize: 30,
                                ),
                              ),
                              SQText(
                                data["title"],
                                fontSize: 26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ))),
      ],
    );
  }

  toOpenGpt() async {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (_) {
        return Scaffold(
          appBar: kDebugMode
              ? AppBar()
              : AppBar(
                  title: Image.asset(
                  "images/11.png",
                  height: 30,
                  width: 30,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.white,
                    width: 10,
                    height: 10,
                  ),
                )),
          body: SafeArea(
            // child: _buildView(),
            child: _buildGridView(context),
          ),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return RouterOutlet.builder(
  //     delegate: Get.nestedKey(null),
  //     builder: (context) {
  //       // final title = context.location;
  //       return Scaffold(
  //         drawer: const DrawerWidget(),
  //         appBar: AppBar(
  //           title: Text(title),
  //           centerTitle: true,
  //         ),
  //         //body: HomeView(),

  //         body: GetRouterOutlet(
  //           initialRoute: Routes.home,
  //           delegate: Get.nestedKey(null),
  //           anchorRoute: '/',
  //           filterPages: (afterAnchor) {
  //             // print(afterAnchor);
  //             // print('dddddddddddddddddd');
  //             // print(afterAnchor.take(1));
  //             return afterAnchor.take(1);
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}
