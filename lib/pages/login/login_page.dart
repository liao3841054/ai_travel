import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:sq_chatgpt/pages/chagpt/api/chat_response.dart';
import 'package:sq_chatgpt/pages/chagpt/biz_api/login_api.dart';
import 'package:sq_chatgpt/pages/chagpt/models/user.dart';
import 'package:sq_chatgpt/pages/chagpt/user_controller.dart';
import 'package:sq_chatgpt/util/login_helper.dart';
// import 'dashboard_screen.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    Response responseJson =
        await LoginBizApi().accountLogin(data.name!, data.password!);
    debugPrint(responseJson.bodyString);
    ChatResponse response = ChatResponse.fromJson(responseJson.body);
    if (response.success) {
      String? token = response.data["token"];
      debugPrint("token: $token");

      if (token != null) {
        User loginUser = User.fromJson(response.data["user"]);
        loginUser.token = token;
        LoginHelper.saveUser(loginUser);

        Get.find<UserServiceController>().login();
      }

      return null;
    }
    return response.message;
  }

  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    Response responseJson =
        await LoginBizApi().register(data.name!, data.password!);
    ChatResponse response = ChatResponse.fromJson(responseJson.body);
    if (response.success) {
      return null;
    }
    return response.message;
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: FlutterLogin(
        title: '语音行程助手',
        logo: const AssetImage('images/60@2x.png'),
        onLogin: _authUser,
        onSignup: _signupUser,
        loginAfterSignUp: false,
        // footer: "测测次猜测猜测额",
        onSubmitAnimationCompleted: () {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   builder: (context) => DashboardScreen(),
          // ));
          debugPrint("打包");
          Get.back();
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }
}
