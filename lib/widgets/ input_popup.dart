import 'package:flutter/material.dart';

class InputPopup extends StatelessWidget {
  final String title;
  final String hint;
  final String? value;
  final Function(String)? onConfirm;

  InputPopup(
    this.title,
    this.hint, {
    this.onConfirm,
    this.value,
    super.key,
  });

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: hint,
                labelText: value,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('取消'),
                ),
                TextButton(
                  onPressed: () {
                    if (onConfirm != null) {
                      onConfirm!(_textEditingController.text);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('确定'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
