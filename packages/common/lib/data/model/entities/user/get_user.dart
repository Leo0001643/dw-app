class MoneyEntity {
  MoneyInfoEntity? infoEntity;
  int? statusCode;

  MoneyEntity({this.infoEntity, this.statusCode});

  MoneyEntity.fromJson(Map<String, dynamic> json) {
    infoEntity =
        json['info'] != null ? MoneyInfoEntity.fromJson(json['info']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (infoEntity != null) {
      data['info'] = infoEntity!.toJson();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class MoneyInfoEntity {
  int? setPwd;
  String? userName;
  String? money;
  int? messageCount;
  int? xml;
  int? isauth;
  int? userId;
  String? regPhone;
  String? regWeixin;
  String? regQq;
  String? truename;
  bool? qkpass;
  bool? regMobilecode;
  String? regWen;
  int? resetSecurityQuestion;
  String? regWenD;
  String? regWenT;
  int? regDay;
  int? joinHb;

  MoneyInfoEntity(
      {this.setPwd,
      this.userName,
      this.money,
      this.messageCount,
      this.xml,
      this.isauth,
      this.userId,
      this.regPhone,
      this.regWeixin,
      this.regQq,
      this.truename,
      this.qkpass,
      this.regMobilecode,
      this.regWen,
      this.resetSecurityQuestion,
      this.regWenD,
      this.regWenT,
      this.regDay,
      this.joinHb});

  MoneyInfoEntity.fromJson(Map<String, dynamic> json) {
    setPwd = json['set_pwd'];
    userName = json['user_name'];
    money = json['money'];
    messageCount = json['message_count'];
    xml = json['xml'];
    isauth = json['isauth'];
    userId = json['user_id'];
    regPhone = json['reg_phone'];
    regWeixin = json['reg_weixin'];
    regQq = json['reg_qq'];
    truename = json['truename'];
    qkpass = json['qkpass'];
    regMobilecode = json['reg_mobilecode'];
    regWen = json['reg_wen'];
    resetSecurityQuestion = json['reset_security_question'];
    regWenD = json['reg_wen_d'];
    regWenT = json['reg_wen_t'];
    regDay = json['reg_day'];
    joinHb = json['join_hb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['set_pwd'] = setPwd;
    data['user_name'] = userName;
    data['money'] = money;
    data['message_count'] = messageCount;
    data['xml'] = xml;
    data['isauth'] = isauth;
    data['user_id'] = userId;
    data['reg_phone'] = regPhone;
    data['reg_weixin'] = regWeixin;
    data['reg_qq'] = regQq;
    data['truename'] = truename;
    data['qkpass'] = qkpass;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_wen'] = regWen;
    data['reset_security_question'] = resetSecurityQuestion;
    data['reg_wen_d'] = regWenD;
    data['reg_wen_t'] = regWenT;
    data['reg_day'] = regDay;
    data['join_hb'] = joinHb;
    return data;
  }
}
