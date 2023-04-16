import 'package:flutter/material.dart';

class AlertPopup extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? okCallback;
  final VoidCallback? cancleCallback;

  const AlertPopup(this.title, this.content,
      {super.key, this.okCallback, this.cancleCallback});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: const Text('取消'),
          onPressed: () {
            if (cancleCallback != null) {
              cancleCallback!();
            }
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('确定'),
          onPressed: () {
            if (okCallback != null) {
              okCallback!();
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
