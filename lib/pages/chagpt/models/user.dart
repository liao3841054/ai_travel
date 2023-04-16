class User {
  int? id;
  String? platform;
  String? account;
  String? password;
  String? salt;
  int? isVip;
  String? createTime;
  int? delFlag;

  String? vipEndTime;
  String? vipStartTime;
  int? questionTimes;

  bool get isVipFlag {
    return isVip == 1;
  }

  // 用户token
  String? token;

  User({id, platform, account, password, salt, isVip, createTime, delFlag});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    platform = json['platform'];
    account = json['account'];
    password = json['password'];
    salt = json['salt'];
    isVip = json['isVip'];
    createTime = json['createTime'];
    delFlag = json['delFlag'];
    token = json['token'];

    vipEndTime = json['vipEndTime'];
    vipStartTime = json['vipStartTime'];
    questionTimes = json['questionTimes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['platform'] = platform;
    data['account'] = account;
    data['password'] = password;
    data['salt'] = salt;
    data['isVip'] = isVip;
    data['createTime'] = createTime;
    data['delFlag'] = delFlag;
    data['token'] = token;
    data['vipEndTime'] = vipEndTime;
    data['vipStartTime'] = vipStartTime;
    data['questionTimes'] = questionTimes;
    return data;
  }
}

class VipUser {
  int? userId;
  int? isVip;
  String? vipEndTime;
  String? vipStartTime;
  int? questionTimes;

  bool get isVipFlag {
    return isVip == 1;
  }

  // 用户token
  String? token;

  VipUser({id, platform, account, password, salt, isVip, createTime, delFlag});

  VipUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    isVip = json['isVip'];
    vipEndTime = json['vipEndTime'];
    questionTimes = json['questionTimes'];
    vipStartTime = json['vipStartTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['isVip'] = isVip;
    data['vipEndTime'] = vipEndTime;
    data['vipStartTime'] = vipStartTime;

    data['questionTimes'] = questionTimes;
    return data;
  }
}
