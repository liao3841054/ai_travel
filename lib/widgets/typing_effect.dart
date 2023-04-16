// 导入必要的库
import 'package:flutter/material.dart';
import 'package:sq_chatgpt/widgets/sq_text.dart';

class TypingEffect extends StatefulWidget {
  final String text;
  final int? timeGap;
  final VoidCallback? typingChangeCallBack;
  final bool isAnimateEnd;

  const TypingEffect(
      {super.key,
      required this.text,
      this.timeGap = 150,
      this.isAnimateEnd = false,
      this.typingChangeCallBack});

  @override
  State<TypingEffect> createState() => _TypingEffectState();
}

class _TypingEffectState extends State<TypingEffect> {
  // 定义一个变量来存储要显示的文本
  String textToShow = "";
  // 定义一个变量来存储要显示的文本的索引
  int currentCharacterIndex = 0;
  // 定义一个变量来存储要显示的文本的总长度
  int textLength = 0;
  // 定义一个变量来存储每次显示文本的时间间隔
  bool isTypingEnd = false;

  // 定义一个函数来显示文本
  void showText() {
    if (!mounted) return;
    // 获取要显示的文本
    String originTextToShow = widget.text;
    // 获取要显示的文本的总长度
    textLength = originTextToShow.length;
    // 如果当前显示的文本的索引小于文本的总长度

    if (isTypingEnd) {
      setState(() {
        textToShow = originTextToShow;
        // originTextToShow.substring(0, currentCharacterIndex + 1);
      });
      return;
    }

    if (currentCharacterIndex < textLength) {
      // 将要显示的文本加上当前显示的文本的索引位置的字符
      setState(() {
        textToShow = originTextToShow.substring(0, currentCharacterIndex + 1);
      });

      /// 外面进行刷新
      if (textToShow.length == originTextToShow.length &&
          widget.typingChangeCallBack != null) {
        widget.typingChangeCallBack!();
      }
      // 将当前显示的文本的索引加1
      currentCharacterIndex = currentCharacterIndex + 1;
      // 设置一个定时器，每隔一段时间调用一次showText函数
      Future.delayed(Duration(milliseconds: widget.timeGap!), showText);
    }
  }

  @override
  void initState() {
    super.initState();
    // 在initState函数中调用showText函数

    isTypingEnd = widget.isAnimateEnd;

    showText();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        if (isTypingEnd == false && widget.typingChangeCallBack != null) {
          widget.typingChangeCallBack!();
          setState(() {
            isTypingEnd = true;
          });
        }
      },
      child: SQText(
        textToShow,
        selectable: true,
        maxLines: null,
        style: const TextStyle(fontSize: 14.0),
      ),
      // child: Markdown(
      //   data: textToShow,
      //   selectable: true,
      //   shrinkWrap: true,
      //   physics: const NeverScrollableScrollPhysics(),
      // ),
    );
  }
}
