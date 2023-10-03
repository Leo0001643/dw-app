import 'dart:convert' as convert;
import 'dart:typed_data';

import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeEntity {
  HomeItems? itmes;
  List<Navconfig>? navconfig;
  int? statusCode;

  HomeEntity({this.itmes, this.navconfig, this.statusCode});

  HomeEntity.fromJson(Map<String, dynamic> json) {
    itmes = json['itmes'] != null ? HomeItems.fromJson(json['itmes']) : null;
    if (json['navconfig'] != null) {
      navconfig = <Navconfig>[];
      var cleanNavConfig = convert.json.decode(json['navconfig']);
      cleanNavConfig.forEach((v) {
        navconfig!.add(Navconfig.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (itmes != null) {
      data['itmes'] = itmes!.toJson();
    }
    if (navconfig != null) {
      data['navconfig'] = navconfig!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class HomeItems {
  Bases? bases;
  String? navs;
  List<Slides>? slides;
  List<Notices>? notices;
  String? agentDomian;
  String? logoRect;
  String? logoSquare;
  String? appIcon;

  HomeItems({
    this.bases,
    this.navs,
    this.slides,
    this.notices,
    this.agentDomian,
    this.logoRect,
    this.logoSquare,
    this.appIcon,
  });

  HomeItems.fromJson(Map<String, dynamic> json) {
    bases = json['bases'] != null ? Bases.fromJson(json['bases']) : null;
    navs = json['navs'];
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(Slides.fromJson(v));
      });
    }
    if (json['notices'] != null) {
      notices = <Notices>[];

      json['notices'].forEach((v) {
        notices!.add(Notices.fromJson(v));
      });
    }
    agentDomian = json['agent_domian'];
    logoRect = json['logo_rect'];
    logoSquare = json['logo_square'];
    appIcon = json['app_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bases != null) {
      data['bases'] = bases!.toJson();
    }
    data['navs'] = navs;
    if (slides != null) {
      data['slides'] = slides!.map((v) => v.toJson()).toList();
    }
    if (notices != null) {
      data['notices'] = notices!.map((v) => v.toJson()).toList();
    }
    data['agent_domian'] = agentDomian;
    data['logo_rect'] = logoRect;
    data['logo_square'] = logoSquare;
    data['app_icon'] = appIcon;
    return data;
  }
}

class Bases {
  String? contactKefu;
  String? contactQq;
  String? contactQqewm;
  String? contactWeixin;
  String? contactWeixinewm;
  String? contactEmail;
  String? contactSkype;
  String? contactTelegram;
  String? deviceAndroid;
  String? deviceIos;
  String? siteTitle;
  String? siteDesc;
  String? contactTel;
  String? contactKefuApp;
  String? siteDomain;
  String? deviceAndroidImg;
  String? deviceIosImg;
  String? contactAgentQq;
  String? contactAgentWeixin;
  String? qmOpen;

  Bases({
    this.contactKefu,
    this.contactQq,
    this.contactQqewm,
    this.contactWeixin,
    this.contactWeixinewm,
    this.contactEmail,
    this.contactSkype,
    this.contactTelegram,
    this.deviceAndroid,
    this.deviceIos,
    this.siteTitle,
    this.siteDesc,
    this.contactTel,
    this.contactKefuApp,
    this.siteDomain,
    this.deviceAndroidImg,
    this.deviceIosImg,
    this.contactAgentQq,
    this.contactAgentWeixin,
    this.qmOpen,
  });

  Bases.fromJson(Map<String, dynamic> json) {
    contactKefu = json['contact_kefu'];
    contactQq = json['contact_qq'];
    contactQqewm = json['contact_qqewm'];
    contactWeixin = json['contact_weixin'];
    contactWeixinewm = json['contact_weixinewm'];
    contactEmail = json['contact_email'];
    contactSkype = json['contact_skype'];
    contactTelegram = json['contact_telegram'];
    deviceAndroid = json['device_android'];
    deviceIos = json['device_ios'];
    siteTitle = json['siteTitle'];
    siteDesc = json['siteDesc'];
    contactTel = json['contact_tel'];
    contactKefuApp = json['contact_kefu_app'];
    siteDomain = json['siteDomain'];
    deviceAndroidImg = json['device_android_img'];
    deviceIosImg = json['device_ios_img'];
    contactAgentQq = json['contact_agent_qq'];
    contactAgentWeixin = json['contact_agent_weixin'];
    qmOpen = json['qm_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_kefu'] = contactKefu;
    data['contact_qq'] = contactQq;
    data['contact_qqewm'] = contactQqewm;
    data['contact_weixin'] = contactWeixin;
    data['contact_weixinewm'] = contactWeixinewm;
    data['contact_email'] = contactEmail;
    data['contact_skype'] = contactSkype;
    data['contact_telegram'] = contactTelegram;
    data['device_android'] = deviceAndroid;
    data['device_ios'] = deviceIos;
    data['siteTitle'] = siteTitle;
    data['siteDesc'] = siteDesc;
    data['contact_tel'] = contactTel;
    data['contact_kefu_app'] = contactKefuApp;
    data['siteDomain'] = siteDomain;
    data['device_android_img'] = deviceAndroidImg;
    data['device_ios_img'] = deviceIosImg;
    data['contact_agent_qq'] = contactAgentQq;
    data['contact_agent_weixin'] = contactAgentWeixin;
    data['qm_open'] = qmOpen;
    return data;
  }
}

class Slides {
  int? id;
  String? title;
  String? thumb;
  int? addTime;
  int? weizhi;
  String? path;
  String? bgcolor;
  String? body;
  RxBool isHidden = RxBool(false);

  Slides(
      {this.id,
      this.title,
      this.thumb,
      this.addTime,
      this.weizhi,
      this.path,
      this.bgcolor,
      this.body});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumb = json['thumb'];
    addTime = json['add_time'];
    weizhi = json['weizhi'];
    path = json['path'];
    bgcolor = json['bgcolor'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumb'] = thumb;
    data['add_time'] = addTime;
    data['weizhi'] = weizhi;
    data['path'] = path;
    data['bgcolor'] = bgcolor;
    data['body'] = body;
    return data;
  }
}

class Notices {
  int? id;
  String? title;
  String? body;
  int? tag;
  int? addTime;
  int? isBk;
  String? popupWindowDisplayPage;
  String? announcementTheStyle;
  String? oldAnnouncementTheStyle;

  Notices(
      {this.id,
      this.title,
      this.body,
      this.tag,
      this.addTime,
      this.isBk,
      this.popupWindowDisplayPage,
      this.announcementTheStyle,
      this.oldAnnouncementTheStyle});

  Notices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    tag = json['tag'];
    addTime = json['add_time'];
    isBk = json['is_bk'];
    popupWindowDisplayPage = json['popup_window_display_page'];
    announcementTheStyle = json['announcement_the_style'];
    oldAnnouncementTheStyle = json['old_announcement_the_style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['tag'] = tag;
    data['add_time'] = addTime;
    data['is_bk'] = isBk;
    data['popup_window_display_page'] = popupWindowDisplayPage;
    data['announcement_the_style'] = announcementTheStyle;
    data['old_announcement_the_style'] = oldAnnouncementTheStyle;
    return data;
  }
}

class Navconfig {
  String? nameCn;
  String? nameEn;
  String? image;
  String? isYs;
  int? tag;
  String? name;
  List<SubChildren>? subChildren;
  bool? color;
  String? colorStart;
  String? colorEnd;
  String? href;
  bool isCheck = false;
  int? number;

  Navconfig(
      {this.nameCn,
      this.nameEn,
      this.image,
      this.isYs,
      this.tag,
      this.name,
      this.subChildren,
      this.color,
      this.colorStart,
      this.colorEnd,
      this.href,
      this.number});

  Navconfig.fromJson(Map<String, dynamic> map) {
    var json = map.trJson;
    nameCn = json['name_cn'];
    nameEn = json['name_en'];
    image = (json['image'] ?? "").toString().trim();
    isYs = json['is_ys'];
    tag = json['tag'];
    name = json['name'];
    if (json['subChildren'] != null) {
      subChildren = <SubChildren>[];
      json['subChildren'].forEach((v) {
        subChildren!.add(SubChildren.fromJson(v));
      });
    }
    color = json['color'];
    colorStart = json['colorStart'];
    colorEnd = json['colorEnd'];
    href = json['href'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_cn'] = nameCn;
    data['name_en'] = nameEn;
    data['image'] = image;
    data['is_ys'] = isYs;
    data['tag'] = tag;
    data['name'] = name;
    if (subChildren != null) {
      data['subChildren'] = subChildren!.map((v) => v.toJson()).toList();
    }
    data['color'] = color;
    data['colorStart'] = colorStart;
    data['colorEnd'] = colorEnd;
    data['href'] = href;
    data['number'] = number;
    return data;
  }
}

class SubChildren extends OnGameParams {
  int? tag;
  String? image;
  bool? color;
  String? colorStart;
  String? colorEnd;

  int? isVertical;
  String? image2;
  String? imgCn;
  String? href;
  int? number;
  int? heat;
  int? is_collect;

  SubChildren(
      {this.tag,
      this.image,
      this.imgCn,
      this.color,
      this.colorStart,
      this.colorEnd,
      this.isVertical,
      this.image2,
      this.href,
      this.number,
      this.heat,
      this.is_collect});

  SubChildren.fromJson(Map<String, dynamic> json) {
    // "2" "4,2'//只取第一个，这样取怎么会有问题
    try {
      tag = (json['tag'] ?? "0").toString().split(',')[0].toInt;
    } catch (e) {
      tag = (json['tag'] ?? "0").toString().toInt;
    }

    image = (json['image'] ?? "").toString().trim();
    imgCn = (json['img_cn'] ?? "").toString().trim(); //子游戏图片
    nameCn = json['name_cn'];
    nameEn = json['name_en'];
    gameTag = json['game_tag'];
    subTag = json['sub_tag'];
    ischangshang = json['ischangshang'];
    type = json['type'];
    color = json['color'];
    colorStart = json['colorStart'];
    colorEnd = json['colorEnd'];
    isVertical = json['is_vertical'];
    image2 = (json['image2'] ?? "").toString().trim();
    href = json['href'];
    number = json['number'];
    heat = (json['heat'] ?? "0").toString().toInt;
    is_collect = json['is_collect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tag'] = tag;
    data['image'] = image;
    data['img_cn'] = imgCn;
    data['name_cn'] = nameCn;
    data['name_en'] = nameEn;
    data['game_tag'] = gameTag;
    data['sub_tag'] = subTag;
    data['ischangshang'] = ischangshang;
    data['type'] = type;
    data['color'] = color;
    data['colorStart'] = colorStart;
    data['colorEnd'] = colorEnd;
    data['is_vertical'] = isVertical;
    data['image2'] = image2;
    data['href'] = href;
    data['number'] = number;
    data['heat'] = heat;
    data['is_collect'] = is_collect;

    return data;
  }
}
