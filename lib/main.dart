import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sq_chatgpt/app_pages.dart';
import 'package:sq_chatgpt/route.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyAppDemo extends StatefulWidget {
  const MyAppDemo({super.key});

  @override
  State<MyAppDemo> createState() => _MyAppDemoState();
}

class _MyAppDemoState extends State<MyAppDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: Routes.kTravelScreen,
        // builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        enableLog: kDebugMode,
        theme: ThemeData.light(useMaterial3: true),
        // theme: ThemeData.light(useMaterial3: true),
        getPages: AppPages.pages);
  }
}
