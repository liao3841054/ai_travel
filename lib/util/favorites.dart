// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:shared_preferences/shared_preferences.dart';

import '../pages/chagpt/models/chatgpt_response.dart';

const int kMaxHistoryLength = 20;

class HiveFavorite {
  // static Box<ChatGPTResponse>? favoriteBooksBox;

  static initHive() async {
    // await Hive.initFlutter();
    // await Hive.openBox<ChatGPTResponse>("favoritesBox");
    // favoriteBooksBox = Hive.box<ChatGPTResponse>("favoritesBox");

    // prefs = await SharedPreferences.getInstance();
  }

  static Future<void> addFavorite(ChatGPTResponse response) async {
    // if ((favoriteBooksBox?.length ?? 0) > kMaxHistoryLength) {
    //   final oldestPage = favoriteBooksBox!.getAt(0);
    //   await favoriteBooksBox!.delete(oldestPage);
    // }
    // await favoriteBooksBox?.add(response);
  }

  static List<ChatGPTResponse>? listFavorite() {
    // return favoriteBooksBox?.values.toList();
  }
}
