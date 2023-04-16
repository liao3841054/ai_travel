class ChatResponse<T> {
  int? code;
  String? message;
  String? encryptData;
  T? data;
  bool? isEncryptData;

  bool get success {
    return code == 200;
  }

  ChatResponse({code, message, data, isEncryptData});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] is String) {
      encryptData = json['data'];
    } else {
      data = json['data'];
    }
    isEncryptData = json['isEncryptData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = data;
    data['isEncryptData'] = isEncryptData;
    return data;
  }
}
