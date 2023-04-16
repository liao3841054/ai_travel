import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../travel_timeline/widgets/time_line.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class CheckboxListPage extends GetView<CheckboxListController> {
  const CheckboxListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const CheckBoxWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckboxListController>(
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("checkbox_list")),
          body: SafeArea(
            child: Container(
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
                  Expanded(child: _buildView()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
