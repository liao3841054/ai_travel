import 'package:get/get_navigation/get_navigation.dart';
import 'package:sq_chatgpt/pages/checkbox_list/index.dart';
import 'package:sq_chatgpt/pages/travel/index.dart';
import 'package:sq_chatgpt/pages/travel_timeline/index.dart';
import 'package:sq_chatgpt/route.dart';

import 'pages/login/login_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.kLoginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
        name: Routes.kTravelScreen,
        page: () => const TravelPage(),
        binding: TravelBinding()),
    GetPage(
        name: Routes.kTravelTimelineScreen,
        page: () => const TravelTimelinePage(),
        binding: TravelTimelineBinding()),
    GetPage(
        name: Routes.kCheckBoxcreen,
        page: () => const CheckboxListPage(),
        binding: CheckboxListBinding()),
  ];
}
