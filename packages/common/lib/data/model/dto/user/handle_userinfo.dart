class HandleUserinfoDto {
  String? userName;
  String? userId;
  String? regQq;
  String? regWeixin;
  String? regPhone;
  String? regMobilecode;
  String? regWen;
  String? regWend;
  String? regWent;
  String? regPhoneAreacode;

  HandleUserinfoDto({
    this.userName,
    this.userId,
    this.regQq,
    this.regWeixin,
    this.regPhone,
    this.regMobilecode,
    this.regWen,
    this.regWend,
    this.regWent,
    this.regPhoneAreacode,
  });

  HandleUserinfoDto.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    userId = json['user_id'];
    regQq = json['reg_qq'];
    regWeixin = json['reg_weixin'];
    regPhone = json['reg_phone'];
    regMobilecode = json['reg_mobilecode'];

    regWen = json['reg_wen'];
    regWend = json['reg_wen_d'];
    regWent = json['reg_wen_t'];
    regPhoneAreacode = json['reg_phone_area_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = userName;
    data['user_id'] = userId;
    data['reg_qq'] = regQq;
    data['reg_weixin'] = regWeixin;
    data['reg_phone'] = regPhone;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_wen'] = regWen;
    data['reg_wen_d'] = regWend;
    data['reg_wen_t'] = regWent;

    data['reg_phone_area_code'] = regPhoneAreacode;
    return data;
  }
}
