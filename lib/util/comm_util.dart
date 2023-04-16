import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_macos_webview/flutter_macos_webview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:sq_chatgpt/pages/chagpt/models/user.dart';
import 'package:sq_chatgpt/util/cache_util.dart';
import 'package:sq_chatgpt/util/login_helper.dart';
import 'package:sq_chatgpt/widgets/sq_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CommUtils {
  // tap
  static void showMessage(String text) {
    Get.snackbar(
      "",
      text,
    );
  }

  /// 复制
  ///
  static Future<void> copyToClipboard(String copyText) async {
    return Clipboard.setData(ClipboardData(text: copyText));
  }

  static showRatingBar(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) => Dialog(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 280 * 0.518,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SQText(
                      "给一个好评",
                      fontSize: 16,
                    ),
                    const SQText(
                      "你的好评是我们不断优化的动力！",
                    ),
                    // const SQText(
                    //   "五星好评可以解锁更多隐藏功能哦！",
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        if (rating > 3.5) {
                          CommUtils.launchAppReview();
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ))));
  }

  static gotoAppStoreUpdate(String appUpdateUrl) async {}

  static void openUrl(String webUrl) async {
    String url = webUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      CommUtils.showMessage('Could not launch $url');
    }
  }

  static void launchAppReview() async {}

  static openAppStore() async {}

  static sendMail() async {
    User user = LoginHelper.getUser()!;
    final Uri params = Uri(
        scheme: 'mailto',
        path: '251180323@qq.com',
        query: 'subject=账号注册&body=账号:${user.account}\nid: ${user.id}');

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void triggerLaunchAppReview() {}

  static Future<void> onOpenMacOSWebView(
      PresentationStyle presentationStyle) async {
    final webview = FlutterMacOSWebView(
      onOpen: () => print('Opened'),
      onClose: () => print('Closed'),
      onPageStarted: (url) => print('Page started: $url'),
      onPageFinished: (url) => print('Page finished: $url'),
      onWebResourceError: (err) {
        print(
          'Error: ${err.errorCode}, ${err.errorType}, ${err.domain}, ${err.description}',
        );
      },
    );

    await webview.open(
      url: 'https://www.baidu.com',
      presentationStyle: presentationStyle,
      size: Size(400.0, 400.0),
      userAgent:
          'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1',
    );

    // await Future.delayed(Duration(seconds: 5));
    // await webview.close();
  }

  static getAppPlatformInfo() {
    return kIsWeb
        ? 'Web'
        : Platform.isAndroid
            ? 'Android'
            : Platform.isIOS
                ? 'iOS'
                : Platform.isLinux
                    ? 'Linux'
                    : Platform.isMacOS
                        ? 'MacOS'
                        : Platform.isWindows
                            ? 'Windows'
                            : '';
  }

  static bool checkNewVersion(String v1, String v2) {
    final version1 = Version.parse(v1);
    final version2 = Version.parse(v2);
    if (version1 < version2) {
      debugPrint('version2 is newer than version1');
      return true;
    } else if (version1 > version2) {
      debugPrint('version1 is newer than version2');
    } else {
      debugPrint('version1 and version2 are the same');
    }

    return false;
  }

  // String _parseVersionFromPubspec() {
  //   final String yamlString = rootBundle.loadString('pubspec.yaml').toString();
  //   final Map<dynamic, dynamic> yamlMap = loadYaml(yamlString);
  //   return yamlMap['version'];
  // }
}
