import 'package:flutter/material.dart';

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
              enabled: enabled,
            )),
            Container(
              width: 55,
              height: 44,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 201, 203, 1),
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Image.asset(
                  "images/send_icon.png",
                  fit: BoxFit.fitHeight,
                  width: 25,
                  height: 25,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
