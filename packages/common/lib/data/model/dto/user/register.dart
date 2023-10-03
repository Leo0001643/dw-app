class UserRegisterDto {
  String? tuijianName;
  String? regWenT;
  String? userName;
  String? password;
  String? repassword;
  String? truename;
  String? bankname;
  String? bankkaihu;
  String? bankcard;
  String? qkpass;
  String? regPhone;
  String? genTime;
  String? regQq;
  String? regWeixin;
  String? regEmail;
  String? regSkype;
  String? regWen;
  String? area;
  String? regWenD;
  String? captchaCode;
  String? captchaKey;
  String? regMobilecode;
  int? regXieyi;
  String? regFacebook;
  String? regLine;
  String? codeImage;
  String? dev;
  String? validate;
  String? openurl;
  String? invitationCode;

  String? agentName;
  String? regaTruename;
  String? regAgent;
  String? regaPhone;
  String? regaQq;
  String? regaWeixin;
  String? regaEmail;
  String? regaSkype;
  String? regaQkpass;
  String? regaBank;
  String? regaCustom;
  String? regaTiaokuan;
  String? regaLine;
  String? regaFacebook;

  String? lotNumber;
  String? captchaOutput;
  String? passToken;
  String? signToken;
  //根据sign取验证码
  String? sign;

  UserRegisterDto(
      {this.tuijianName,
      this.regWenT,
      this.userName,
      this.password,
      this.repassword,
      this.truename,
      this.bankname,
      this.bankkaihu,
      this.bankcard,
      this.qkpass,
      this.regPhone,
      this.regQq,
      this.regWeixin,
      this.regEmail,
      this.regSkype,
      this.regWen,
      this.regWenD,
      this.captchaCode,
      this.captchaKey,
      this.regMobilecode,
      this.regXieyi,
      this.regFacebook,
      this.regLine,
      this.codeImage,
      this.dev,
      this.validate,
      this.openurl,
      this.agentName,
      this.regaTruename,
      this.regAgent,
      this.regaPhone,
      this.regaQq,
      this.regaWeixin,
      this.regaEmail,
      this.regaSkype,
      this.area,
      this.regaQkpass,
      this.regaBank,
      this.regaCustom,
      this.regaTiaokuan,
      this.regaLine,
      this.regaFacebook,
      this.sign});

  UserRegisterDto.fromJson(Map<String, dynamic> json) {
    tuijianName = json['tuijian_name'];
    regWenT = json['reg_wen_t'];
    userName = json['user_name'];
    password = json['password'];
    repassword = json['repassword'];
    truename = json['truename'];
    bankname = json['bankname'];
    area = json['area'];
    bankkaihu = json['bankkaihu'];
    bankcard = json['bankcard'];
    qkpass = json['qkpass'];
    regPhone = json['reg_phone'];
    regQq = json['reg_qq'];
    regWeixin = json['reg_weixin'];
    regEmail = json['reg_email'];
    regSkype = json['reg_skype'];
    regWen = json['reg_wen'];
    regWenD = json['reg_wen_d'];
    captchaCode = json['captcha_code'];
    captchaKey = json['captcha_key'];
    regMobilecode = json['reg_mobilecode'];
    regXieyi = json['reg_xieyi'];
    regFacebook = json['reg_facebook'];
    regLine = json['reg_line'];
    codeImage = json['code_image'];
    dev = json['dev'];
    validate = json['validate'];
    openurl = json['openurl'];
    invitationCode = json['invitation_code'];

    agentName = json['agent_name'];
    regaTruename = json['rega_truename'];
    regAgent = json['reg_agent'];
    regaPhone = json['rega_phone'];
    regaQq = json['rega_qq'];
    regaWeixin = json['rega_weixin'];
    regaEmail = json['rega_email'];
    regaSkype = json['rega_skype'];
    regaQkpass = json['rega_qkpass'];
    regaBank = json['rega_bank'];
    regaCustom = json['rega_custom'];
    regaTiaokuan = json['rega_tiaokuan'];
    regaLine = json['rega_line'];
    regaFacebook = json['rega_facebook'];

    lotNumber = json['lot_number'];
    captchaOutput = json['captcha_output'];
    passToken = json['pass_token'];
    genTime = json['gen_time'];
    signToken = json['sign_token'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tuijian_name'] = tuijianName;
    data['reg_wen_t'] = regWenT;
    data['reg_phone_area_code'] = area;
    data['user_name'] = userName;
    data['password'] = password;
    data['repassword'] = repassword;
    data['truename'] = truename;
    data['bankname'] = bankname;
    data['bankkaihu'] = bankkaihu;
    data['bankcard'] = bankcard;
    data['qkpass'] = qkpass;
    data['reg_phone'] = regPhone;
    data['reg_qq'] = regQq;
    data['reg_weixin'] = regWeixin;
    data['reg_email'] = regEmail;
    data['reg_skype'] = regSkype;
    data['reg_wen'] = regWen;
    data['reg_wen_d'] = regWenD;
    data['captcha_code'] = captchaCode;
    data['captcha_key'] = captchaKey;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_xieyi'] = regXieyi;
    data['reg_facebook'] = regFacebook;
    data['reg_line'] = regLine;
    data['code_image'] = codeImage;
    data['dev'] = dev;
    data['validate'] = validate;
    data['openurl'] = openurl;
    data['invitation_code'] = invitationCode;

    data['agent_name'] = agentName;
    data['rega_truename'] = regaTruename;
    data['reg_agent'] = regAgent;
    data['rega_phone'] = regaPhone;
    data['rega_qq'] = regaQq;
    data['rega_weixin'] = regaWeixin;
    data['rega_email'] = regaEmail;
    data['rega_skype'] = regaSkype;
    data['rega_qkpass'] = regaQkpass;
    data['rega_bank'] = regaBank;
    data['rega_custom'] = regaCustom;
    data['rega_tiaokuan'] = regaTiaokuan;
    data['rega_line'] = regaLine;
    data['rega_facebook'] = regFacebook;

    data['lot_number'] = lotNumber;
    data['captcha_output'] = captchaOutput;
    data['pass_token'] = passToken;
    data['gen_time'] = genTime;
    data['sign_token'] = signToken;
    data['sign'] = sign;

    print('rega_qkpass == ${data['rega_qkpass']}');
    return data;
  }
}
