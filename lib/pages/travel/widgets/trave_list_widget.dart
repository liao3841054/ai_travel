import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/route.dart';
import 'package:sq_chatgpt/util/comm_util.dart';

import '../index.dart';
import 'chat_bottom_sheet.dart';
import 'chat_btm_bar.dart';
import 'icon_text_widget.dart';
import 'shadow_white_container.dart';

/// hello
class TraveListWidget extends GetView<TravelController> {
  const TraveListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const HeaderWidget(),
            const SizedBox(
              height: 10,
            ),

            ///一个大的Text 文本标题，黑色字体
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Plan your trip \nwith Ai asistance",
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Roboto', // 指定使用 Roboto 字体
                  fontWeight: FontWeight.w200,
                  fontSize: 25,
                ),
              ),
            ),

            // 一个圆角矩形，里面左边一个无边框图片，右边是Column布局的 文字标题 描述
            const SizedBox(
              height: 15,
            ),

            TravelTimeWidget(),

            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.kCheckBoxcreen);
                    },
                    child: CheckBoxListWidget()),
                const SizedBox(
                  width: 15,
                ),
                Expanded(child: MapWidget())
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ShadowWhiteContainer(
              height: 110,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Tips", style: TextStyle(color: Colors.black)),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: const [
                        Text(
                            "•云南观在光照强烈，速议出行帮上足坊的防酒獨 \n•北京南站现在十分網诺。建改 16:50 就出发。以免塔车",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),

            GestureDetector(
                onTap: () {
                  // Get.to(ChatBottomSheet());
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return const ChatActionSheetContent();
                    },
                  );
                },
                child: const ChatBottomBar(
                  enabled: false,
                )),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
            fit: BoxFit.cover,
          ),
          // 阴影
        ));
  }
  // 紫色渐变

}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CommUtils.openMap(39.865862, 116.378956);
      },
      child: ShadowWhiteContainer(
        // width: 100,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Next to do", style: TextStyle(color: Colors.black)),
              const SizedBox(
                height: 5,
              ),
              const Text("去北京南站", style: TextStyle(color: Colors.black)),
              const SizedBox(
                height: 5,
              ),
              ShadowWhiteContainer(
                child: Image.asset(
                  "images/travel_map_icon.png",
                  fit: BoxFit.fitHeight,
                ),
                height: 50,
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Spacer(),
                  IconTextWidget(
                    text: "38 sunny",
                    icon: Icons.sunny,
                    fontSize: 8,
                    iconSize: 10,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxListWidget extends StatelessWidget {
  const CheckBoxListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowWhiteContainer(
      width: 100,
      height: 160,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text("Check Box", style: TextStyle(color: Colors.black)),
            Column(
              children: const [
                MyCheckbox(
                  title: "签证",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "护照",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "转借口",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "信用卡 ",
                  isChecked: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //一个圆角iconText邀请按钮
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: ShadowWhiteContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              child: Row(
                children: [
                  Image.asset(
                    "images/invite_icon.png",
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "Invite",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ),

        const Spacer(),
        SizedBox(
          width: 70,
          child: Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/11.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 20.0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "images/22.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40.0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 0),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "images/33.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {
  final String title;
  final bool isChecked;

  const MyCheckbox({super.key, required this.title, required this.isChecked});
  @override
  // ignore: library_private_types_in_public_api
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _checked = false;

  @override
  void initState() {
    super.initState();
    _checked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _checked = !_checked;
          });
        },
        child: Row(
          children: [
            Icon(
              _checked ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.black38,
              size: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.title,
                style: const TextStyle(color: Colors.black, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class ChatModalBottomSheet extends StatefulWidget {
  @override
  _MyModalBottomSheetState createState() => _MyModalBottomSheetState();
}

class _MyModalBottomSheetState extends State<ChatModalBottomSheet> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Bottom Sheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              labelText: 'Enter some text',
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Text('Show Modal Bottom Sheet'),
        ),
      ),
    );
  }
}

class TravelTimeWidget extends StatelessWidget {
  const TravelTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.kTravelTimelineScreen);
      },
      child: ShadowWhiteContainer(
          height: 135,
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(2530),
                  ),
                ),
                height: 134,
                width: 111,
                child: Image.asset(
                  "images/travel_small_icon.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          ShadowWhiteContainer(
                            color: Color(0xffBBB0EA),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("云南之旅",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Spacer(),
                          IconTextWidget(
                            text: "4day",
                            icon: Icons.calendar_today,
                            fontSize: 8,
                            iconSize: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconTextWidget(
                            text: "9stop",
                            icon: Icons.map,
                            fontSize: 8,
                            iconSize: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Text("云南之旅",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("大理两天一夜，香格里拉一天一夜，交通预算1500/人，住宿980/人",
                          maxLines: 2,
                          style: TextStyle(fontSize: 10, color: Colors.black)),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
