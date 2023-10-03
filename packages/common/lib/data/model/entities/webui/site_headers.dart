class SiteHeadersEntity {
  int? sendtime;
  int? szRegForbid;
  String? szRegForbidMsg;
  int? isQd;
  int? isSecurity;
  int? isHbrw;
  int? newdzp;
  int? fwtime;
  int? ggtime;
  String? device;
  String? language;
  String? site;
  String? siteTag;
  String? agent;
  int? isLogin;
  String? currencySymbol;
  String? timeZone;
  String? necCaptchaId;
  String? necMode;
  String? necStaticUrl;
  int? isAjax;
  bool? zhanweifu;
  bool? pageSwitch;
  int? newjtfs;

  SiteHeadersEntity({
    this.sendtime,
    this.szRegForbid,
    this.szRegForbidMsg,
    this.isQd,
    this.isSecurity,
    this.isHbrw,
    this.newdzp,
    this.fwtime,
    this.ggtime,
    this.device,
    this.language,
    this.site,
    this.siteTag,
    this.agent,
    this.isLogin,
    this.currencySymbol,
    this.timeZone,
    this.necCaptchaId,
    this.necMode,
    this.necStaticUrl,
    this.isAjax,
    this.zhanweifu,
    this.pageSwitch,
    this.newjtfs
  });

  SiteHeadersEntity.fromJson(Map<String, dynamic> json) {
    
    sendtime = json['sendtime'];
    szRegForbid = json['sz_reg_forbid'];
    szRegForbidMsg = json['sz_reg_forbid_msg'];
    isQd = json['is_qd'];
    isSecurity = json['is_security'];
    isHbrw = json['is_hbrw'];
    newdzp = json['newdzp'];
    fwtime = json['fwtime'];
    ggtime = json['ggtime'];
    device = json['device'];
    language = json['language'];
    site = json['site'];
    siteTag = json['site_tag'];
    agent = json['agent'];
    isLogin = json['isLogin'];
    currencySymbol = json['currencySymbol'];
    timeZone = json['timeZone'];
    necCaptchaId = json['nec_captchaId'];
    necMode = json['nec_mode'];
    necStaticUrl = json['nec_staticUrl'];
    isAjax = json['is_ajax'];
    zhanweifu = json['zhanweifu'];
    pageSwitch = json['page_switch'];
    newjtfs = json['newjtfs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sendtime'] = sendtime;
    data['sz_reg_forbid'] = szRegForbid;
    data['sz_reg_forbid_msg'] = szRegForbidMsg;
    data['is_qd'] = isQd;
    data['is_security'] = isSecurity;
    data['is_hbrw'] = isHbrw;
    data['newdzp'] = newdzp;
    data['fwtime'] = fwtime;
    data['ggtime'] = ggtime;
    data['device'] = device;
    data['language'] = language;
    data['site'] = site;
    data['site_tag'] = siteTag;
    data['agent'] = agent;
    data['isLogin'] = isLogin;
    data['currencySymbol'] = currencySymbol;
    data['timeZone'] = timeZone;
    data['nec_captchaId'] = necCaptchaId;
    data['nec_mode'] = necMode;
    data['nec_staticUrl'] = necStaticUrl;
    data['is_ajax'] = isAjax;
    data['zhanweifu'] = zhanweifu;
    data['page_switch'] = pageSwitch;
    data['newjtfs'] = newjtfs;
    return data;
  }
}
