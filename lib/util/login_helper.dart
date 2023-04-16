import 'package:get_storage/get_storage.dart';
import 'package:sq_chatgpt/pages/chagpt/models/user.dart';

const kUserLoginCache = "kUserLoginCache";
const kUserVipCache = "kUserVipCache";

const kUserLoginAPIKeyCache = "kUserLoginAPIKeyCache";

class LoginHelper {
  static GetStorage loginStorage = GetStorage();

  static saveUser(User user) {
    loginStorage.write(kUserLoginCache, user);
  }

  static User? getUser() {
    dynamic userMap = loginStorage.read(kUserLoginCache);

    if (userMap != null) {
      if (userMap is User) {
        return userMap;
      }
      return User.fromJson(userMap);
    }
    return null;
  }

  static saveVipUser(dynamic user) {
    loginStorage.write(kUserVipCache, user);
  }

  static getVipUser() {
    dynamic userVipMap = loginStorage.read(kUserVipCache);
    return userVipMap;
  }

  static isLogin() {
    User? loginUser = getUser();
    return loginUser?.token != null && loginUser!.token?.isNotEmpty == true;
  }

  static logout() {
    loginStorage.write(kUserLoginCache, null);
  }

  static void saveApiKey(String apiKey) {
    loginStorage.write(kUserLoginAPIKeyCache, apiKey);
  }

  static String? getApiKey() {
    return loginStorage.read(kUserLoginAPIKeyCache);
  }
}
