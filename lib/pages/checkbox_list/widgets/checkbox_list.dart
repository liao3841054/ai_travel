import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/travel/widgets/shadow_white_container.dart';

import '../../travel/widgets/widgets.dart';
import '../index.dart';

/// hello
class CheckBoxWidget extends GetView<CheckboxListController> {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
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

        const SizedBox(
          height: 25,
        ),
        CheckBoxListWidget()
      ],
    ));
  }
}

class CheckBoxListWidget extends StatelessWidget {
  const CheckBoxListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowWhiteContainer(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Check Box",
                style: TextStyle(color: Colors.black, fontSize: 16)),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: const [
                MyCheckbox(
                  title: "签证",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "护照",
                  isChecked: true,
                ),
                MyCheckbox(
                  title: "转借口",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "信用卡 ",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "转借口",
                  isChecked: false,
                ),
                MyCheckbox(
                  title: "信用卡 ",
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
