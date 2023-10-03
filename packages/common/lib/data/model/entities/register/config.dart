class RegisterConfigEntity {
  RegisterConfigInfo? info;
  Bt? bt;
  Ainfo? ainfo;
  Abt? abt;
  List<String>? ques;
  int? statusCode;

  RegisterConfigEntity(
      {this.info, this.bt, this.ainfo, this.abt, this.ques, this.statusCode});

  RegisterConfigEntity.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? RegisterConfigInfo.fromJson(json['info']) : null;
    bt = json['bt'] != null ? Bt.fromJson(json['bt']) : null;
    ainfo = json['ainfo'] != null ? Ainfo.fromJson(json['ainfo']) : null;
    abt = json['abt'] != null ? Abt.fromJson(json['abt']) : null;
    ques = json['ques'].cast<String>();
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (bt != null) {
      data['bt'] = bt!.toJson();
    }
    if (ainfo != null) {
      data['ainfo'] = ainfo!.toJson();
    }
    if (abt != null) {
      data['abt'] = abt!.toJson();
    }
    data['ques'] = ques;
    data['status_code'] = statusCode;
    return data;
  }
}

class RegisterConfigInfo {
  String? regPhone;
  String? regQq;
  String? regWeixin;
  String? regEmail;
  String? regSkype;
  String? regQkpass;
  String? regTruename;
  String? regBank;
  String? regCustom;
  String? regTuijianren;
  String? regTiaokuan;
  String? regAgent;
  String? regMobilecode;
  String? regCaptchaKey;
  String? regAllowIp;
  String? regPhonecf;
  String? regLine;
  String? regFacebook;
  String? invitationCode;
  String? szDomain;

  RegisterConfigInfo(
      {this.regPhone,
        this.regQq,
        this.regWeixin,
        this.regEmail,
        this.regSkype,
        this.regQkpass,
        this.regTruename,
        this.regBank,
        this.regCustom,
        this.regTuijianren,
        this.regTiaokuan,
        this.regAgent,
        this.regMobilecode,
        this.regCaptchaKey,
        this.regAllowIp,
        this.regPhonecf,
        this.regLine,
        this.regFacebook,
        this.invitationCode,
        this.szDomain});

  RegisterConfigInfo.fromJson(Map<String, dynamic> json) {
    regPhone = json['reg_phone'];
    regQq = json['reg_qq'];
    regWeixin = json['reg_weixin'];
    regEmail = json['reg_email'];
    regSkype = json['reg_skype'];
    regQkpass = json['reg_qkpass'];
    regTruename = json['reg_truename'];
    regBank = json['reg_bank'];
    regCustom = json['reg_custom'];
    regTuijianren = json['reg_tuijianren'];
    regTiaokuan = json['reg_tiaokuan'];
    regAgent = json['reg_agent'];
    regMobilecode = json['reg_mobilecode'];
    regCaptchaKey = json['reg_captcha_key'];
    regAllowIp = json['reg_allow_ip'];
    regPhonecf = json['reg_phonecf'];
    regLine = json['reg_line'];
    regFacebook = json['reg_facebook'];
    invitationCode = json['invitation_code'];
    szDomain = json['sz_domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reg_phone'] = regPhone;
    data['reg_qq'] = regQq;
    data['reg_weixin'] = regWeixin;
    data['reg_email'] = regEmail;
    data['reg_skype'] = regSkype;
    data['reg_qkpass'] = regQkpass;
    data['reg_truename'] = regTruename;
    data['reg_bank'] = regBank;
    data['reg_custom'] = regCustom;
    data['reg_tuijianren'] = regTuijianren;
    data['reg_tiaokuan'] = regTiaokuan;
    data['reg_agent'] = regAgent;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_captcha_key'] = regCaptchaKey;
    data['reg_allow_ip'] = regAllowIp;
    data['reg_phonecf'] = regPhonecf;
    data['reg_line'] = regLine;
    data['reg_facebook'] = regFacebook;
    data['invitation_code'] = invitationCode;
    data['sz_domain'] = szDomain;
    return data;
  }
}

class Bt {
  int? regPhone;
  int? regQq;
  int? regWeixin;
  int? regEmail;
  int? regSkype;
  int? regQkpass;
  int? regTruename;
  int? regBank;
  int? regCustom;
  int? regTuijianren;
  int? regTiaokuan;
  int? regAgent;
  int? regMobilecode;
  int? regCaptchaKey;
  int? regAllowIp;
  int? regPhonecf;
  int? regLine;
  int? regFacebook;
  int? invitationCode;
  int? szDomain;

  Bt(
      {this.regPhone,
        this.regQq,
        this.regWeixin,
        this.regEmail,
        this.regSkype,
        this.regQkpass,
        this.regTruename,
        this.regBank,
        this.regCustom,
        this.regTuijianren,
        this.regTiaokuan,
        this.regAgent,
        this.regMobilecode,
        this.regCaptchaKey,
        this.regAllowIp,
        this.regPhonecf,
        this.regLine,
        this.regFacebook,
        this.invitationCode,
        this.szDomain});

  Bt.fromJson(Map<String, dynamic> json) {
    regPhone = json['reg_phone'];
    regQq = json['reg_qq'];
    regWeixin = json['reg_weixin'];
    regEmail = json['reg_email'];
    regSkype = json['reg_skype'];
    regQkpass = json['reg_qkpass'];
    regTruename = json['reg_truename'];
    regBank = json['reg_bank'];
    regCustom = json['reg_custom'];
    regTuijianren = json['reg_tuijianren'];
    regTiaokuan = json['reg_tiaokuan'];
    regAgent = json['reg_agent'];
    regMobilecode = json['reg_mobilecode'];
    regCaptchaKey = json['reg_captcha_key'];
    regAllowIp = json['reg_allow_ip'];
    regPhonecf = json['reg_phonecf'];
    regLine = json['reg_line'];
    regFacebook = json['reg_facebook'];
    invitationCode = json['invitation_code'];
    szDomain = json['sz_domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reg_phone'] = regPhone;
    data['reg_qq'] = regQq;
    data['reg_weixin'] = regWeixin;
    data['reg_email'] = regEmail;
    data['reg_skype'] = regSkype;
    data['reg_qkpass'] = regQkpass;
    data['reg_truename'] = regTruename;
    data['reg_bank'] = regBank;
    data['reg_custom'] = regCustom;
    data['reg_tuijianren'] = regTuijianren;
    data['reg_tiaokuan'] = regTiaokuan;
    data['reg_agent'] = regAgent;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_captcha_key'] = regCaptchaKey;
    data['reg_allow_ip'] = regAllowIp;
    data['reg_phonecf'] = regPhonecf;
    data['reg_line'] = regLine;
    data['reg_facebook'] = regFacebook;
    data['invitation_code'] = invitationCode;
    data['sz_domain'] = szDomain;
    return data;
  }
}

class Ainfo {
  String? regAgent;
  String? regMobilecode;
  String? regCaptchaKey;
  String? regaPhone;
  String? regaQq;
  String? regaWeixin;
  String? regaEmail;
  String? regaSkype;
  String? regaQkpass;
  String? regaTruename;
  String? regaBank;
  String? regaCustom;
  String? regaTiaokuan;
  String? regaAllowIp;
  String? regaLine;
  String? regaFacebook;
  String? szDomain;

  Ainfo(
      {this.regAgent,
        this.regMobilecode,
        this.regCaptchaKey,
        this.regaPhone,
        this.regaQq,
        this.regaWeixin,
        this.regaEmail,
        this.regaSkype,
        this.regaQkpass,
        this.regaTruename,
        this.regaBank,
        this.regaCustom,
        this.regaTiaokuan,
        this.regaAllowIp,
        this.regaLine,
        this.regaFacebook,
        this.szDomain});

  Ainfo.fromJson(Map<String, dynamic> json) {
    regAgent = json['reg_agent'];
    regMobilecode = json['reg_mobilecode'];
    regCaptchaKey = json['reg_captcha_key'];
    regaPhone = json['rega_phone'];
    regaQq = json['rega_qq'];
    regaWeixin = json['rega_weixin'];
    regaEmail = json['rega_email'];
    regaSkype = json['rega_skype'];
    regaQkpass = json['rega_qkpass'];
    regaTruename = json['rega_truename'];
    regaBank = json['rega_bank'];
    regaCustom = json['rega_custom'];
    regaTiaokuan = json['rega_tiaokuan'];
    regaAllowIp = json['rega_allow_ip'];
    regaLine = json['rega_line'];
    regaFacebook = json['rega_facebook'];
    szDomain = json['sz_domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reg_agent'] = regAgent;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_captcha_key'] = regCaptchaKey;
    data['rega_phone'] = regaPhone;
    data['rega_qq'] = regaQq;
    data['rega_weixin'] = regaWeixin;
    data['rega_email'] = regaEmail;
    data['rega_skype'] = regaSkype;
    data['rega_qkpass'] = regaQkpass;
    data['rega_truename'] = regaTruename;
    data['rega_bank'] = regaBank;
    data['rega_custom'] = regaCustom;
    data['rega_tiaokuan'] = regaTiaokuan;
    data['rega_allow_ip'] = regaAllowIp;
    data['rega_line'] = regaLine;
    data['rega_facebook'] = regaFacebook;
    data['sz_domain'] = szDomain;
    return data;
  }
}

class Abt {
  int? regAgent;
  int? regMobilecode;
  int? regCaptchaKey;
  int? regaPhone;
  int? regaQq;
  int? regaWeixin;
  int? regaEmail;
  int? regaSkype;
  int? regaQkpass;
  int? regaTruename;
  int? regaBank;
  int? regaCustom;
  int? regaTiaokuan;
  int? regaAllowIp;
  int? regaLine;
  int? regaFacebook;
  int? szDomain;

  Abt(
      {this.regAgent,
        this.regMobilecode,
        this.regCaptchaKey,
        this.regaPhone,
        this.regaQq,
        this.regaWeixin,
        this.regaEmail,
        this.regaSkype,
        this.regaQkpass,
        this.regaTruename,
        this.regaBank,
        this.regaCustom,
        this.regaTiaokuan,
        this.regaAllowIp,
        this.regaLine,
        this.regaFacebook,
        this.szDomain});

  Abt.fromJson(Map<String, dynamic> json) {
    regAgent = json['reg_agent'];
    regMobilecode = json['reg_mobilecode'];
    regCaptchaKey = json['reg_captcha_key'];
    regaPhone = json['rega_phone'];
    regaQq = json['rega_qq'];
    regaWeixin = json['rega_weixin'];
    regaEmail = json['rega_email'];
    regaSkype = json['rega_skype'];
    regaQkpass = json['rega_qkpass'];
    regaTruename = json['rega_truename'];
    regaBank = json['rega_bank'];
    regaCustom = json['rega_custom'];
    regaTiaokuan = json['rega_tiaokuan'];
    regaAllowIp = json['rega_allow_ip'];
    regaLine = json['rega_line'];
    regaFacebook = json['rega_facebook'];
    szDomain = json['sz_domain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reg_agent'] = regAgent;
    data['reg_mobilecode'] = regMobilecode;
    data['reg_captcha_key'] = regCaptchaKey;
    data['rega_phone'] = regaPhone;
    data['rega_qq'] = regaQq;
    data['rega_weixin'] = regaWeixin;
    data['rega_email'] = regaEmail;
    data['rega_skype'] = regaSkype;
    data['rega_qkpass'] = regaQkpass;
    data['rega_truename'] = regaTruename;
    data['rega_bank'] = regaBank;
    data['rega_custom'] = regaCustom;
    data['rega_tiaokuan'] = regaTiaokuan;
    data['rega_allow_ip'] = regaAllowIp;
    data['rega_line'] = regaLine;
    data['rega_facebook'] = regaFacebook;
    data['sz_domain'] = szDomain;
    return data;
  }
}
