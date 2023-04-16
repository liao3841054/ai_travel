import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class TravelPage extends GetView<TravelController> {
  const TravelPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const TraveListWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelController>(
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("travel")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
