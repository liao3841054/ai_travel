import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class TravelTimelinePage extends GetView<TravelTimelineController> {
  const TravelTimelinePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const TimelineListWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TravelTimelineController>(
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("travel_timeline")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
