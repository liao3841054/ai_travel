import 'package:get/get.dart';
import 'aes_api.dart';

class ChatApiService extends GetxService {
  Future<ChatApiService> init() async {
    await AESApi().getKeyRequest();
    return this;
  }
}
