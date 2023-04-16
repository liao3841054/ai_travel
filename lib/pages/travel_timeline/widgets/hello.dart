import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/travel/widgets/shadow_white_container.dart';
import 'package:sq_chatgpt/widgets/sq_text.dart';

import '../../travel/widgets/icon_text_widget.dart';
import '../index.dart';

/// hello
class HelloWidget extends GetView<TravelTimelineController> {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
        // 阴影
      ),
      child: Column(
        children: [
          const NavBackBar(),
          const TimelineTitleWidget(),
          TimelineTicketWidget(),
        ],
      ),
    );
  }
}

class TimelineTicketWidget extends StatelessWidget {
  const TimelineTicketWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShadowWhiteContainer(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
            circular: 20,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    SQText(
                      "北京南站",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    SQText(
                      "云南北",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SQText(
                      "18.00",
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                    SQText(
                      "24h36min",
                      fontWeight: FontWeight.normal,
                      fontSize: 5,
                    ),
                    SQText(
                      "20:56",
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  ],
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
        SizedBox(
          width: 10,
        ),
        ShadowWhiteContainer(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          circular: 20,
          width: 73,
          height: 95,
          child: Center(
            child: SQText(
              "请在16:50前出发,记得带身份证",
              fontWeight: FontWeight.normal,
              fontSize: 6,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineTitleWidget extends StatelessWidget {
  const TimelineTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SQText(
            "Timeline",
            fontWeight: FontWeight.bold,
          ),
          SQText(
            "Ai Note",
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

class NavBackBar extends StatelessWidget {
  const NavBackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsets.only(top: 35),
              child: ShadowWhiteContainer(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
