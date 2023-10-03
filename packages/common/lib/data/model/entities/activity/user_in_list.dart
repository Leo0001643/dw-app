class ActivitiesEntity {
  bool? isZs;
  int? total;
  List<ActivityInfo>? items;
  int? statusCode;

  ActivitiesEntity({this.isZs, this.total, this.items, this.statusCode});

  ActivitiesEntity.fromJson(Map<String, dynamic> json) {
    isZs = json['is_zs'];
    total = json['total'];
    if (json['items'] != null) {
      items = <ActivityInfo>[];
      json['items'].forEach((v) {
        items!.add(ActivityInfo.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_zs'] = isZs;
    data['total'] = total;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class ActivityInfo {
  int? id;
  int? type;
  String? title;
  String? titleEn;
  int? stime;
  int? etime;
  String? userFcId;
  int? qtYkShow;
  int? qtIsShow;
  int? actionId;
  int? qtShowEtime;
  int? qtShowStime;
  String? qtBiao;
  String? qtPcSlmg;
  String? qtAppSlmg;
  String? qtPcMiaoshu;
  String? qtPcMiaoshuEn;
  String? qtAppMiaoshu;
  String? qtAppMiaoshuEn;
  String? qtPcContent;
  String? qtPcContentEn;
  String? qtAppContent;
  String? qtAppContentEn;
  String? dataJson;
  int? order;
  String? agentId;
  String? qtPcSlmgEn;
  String? qtAppSlmgEn;
  String? lang;
  String? qtAppSlmg1;

  ActivityInfo(
      {this.id,
      this.type,
      this.title,
      this.titleEn,
      this.stime,
      this.etime,
      this.userFcId,
      this.qtYkShow,
      this.qtIsShow,
      this.actionId,
      this.qtShowEtime,
      this.qtShowStime,
      this.qtBiao,
      this.qtPcSlmg,
      this.qtAppSlmg,
      this.qtPcMiaoshu,
      this.qtPcMiaoshuEn,
      this.qtAppMiaoshu,
      this.qtAppMiaoshuEn,
      this.qtPcContent,
      this.qtPcContentEn,
      this.qtAppContent,
      this.qtAppContentEn,
      this.dataJson,
      this.order,
      this.agentId,
      this.qtPcSlmgEn,
      this.qtAppSlmgEn,
      this.lang,
      this.qtAppSlmg1});

  ActivityInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    titleEn = json['title_en'];
    stime = json['stime'];
    etime = json['etime'];
    userFcId = json['user_fc_id'];
    qtYkShow = json['qt_yk_show'];
    qtIsShow = json['qt_is_show'];
    actionId = json['action_id'];
    qtShowEtime = json['qt_show_etime'];
    qtShowStime = json['qt_show_stime'];
    qtBiao = json['qt_biao'];
    qtPcSlmg = json['qt_pc_slmg'];
    qtAppSlmg = json['qt_app_slmg'];
    qtPcMiaoshu = json['qt_pc_miaoshu'];
    qtPcMiaoshuEn = json['qt_pc_miaoshu_en'];
    qtAppMiaoshu = json['qt_app_miaoshu'];
    qtAppMiaoshuEn = json['qt_app_miaoshu_en'];
    qtPcContent = json['qt_pc_content'];
    qtPcContentEn = json['qt_pc_content_en'];
    qtAppContent = json['qt_app_content'];
    qtAppContentEn = json['qt_app_content_en'];
    dataJson = json['data_json'];
    order = json['order'];
    agentId = json['agent_id'];
    qtPcSlmgEn = json['qt_pc_slmg_en'];
    qtAppSlmgEn = json['qt_app_slmg_en'];
    lang = json['lang'];
    qtAppSlmg1 = json['qt_app_slmg1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['title_en'] = titleEn;
    data['stime'] = stime;
    data['etime'] = etime;
    data['user_fc_id'] = userFcId;
    data['qt_yk_show'] = qtYkShow;
    data['qt_is_show'] = qtIsShow;
    data['action_id'] = actionId;
    data['qt_show_etime'] = qtShowEtime;
    data['qt_show_stime'] = qtShowStime;
    data['qt_biao'] = qtBiao;
    data['qt_pc_slmg'] = qtPcSlmg;
    data['qt_app_slmg'] = qtAppSlmg;
    data['qt_pc_miaoshu'] = qtPcMiaoshu;
    data['qt_pc_miaoshu_en'] = qtPcMiaoshuEn;
    data['qt_app_miaoshu'] = qtAppMiaoshu;
    data['qt_app_miaoshu_en'] = qtAppMiaoshuEn;
    data['qt_pc_content'] = qtPcContent;
    data['qt_pc_content_en'] = qtPcContentEn;
    data['qt_app_content'] = qtAppContent;
    data['qt_app_content_en'] = qtAppContentEn;
    data['data_json'] = dataJson;
    data['order'] = order;
    data['agent_id'] = agentId;
    data['qt_pc_slmg_en'] = qtPcSlmgEn;
    data['qt_app_slmg_en'] = qtAppSlmgEn;
    data['lang'] = lang;
    data['qt_app_slmg1'] = qtAppSlmg1;
    return data;
  }
}

class ActivityApplyEntity {
  int? jztime;
  int? kstime;
  String? joinsum;
  String? joincount;
  int? sqtype;
  List<ExtArgsEntity>? extArgs;

  ActivityApplyEntity.fromJson(Map<String, dynamic> json) {
    jztime = json['jztime'];
    kstime = json['kstime'];
    joinsum = json['joinsum'];
    joincount = json['joincount'];
    sqtype = json['sqtype'];

    if (json['ext_args'] != null) {
      extArgs = <ExtArgsEntity>[];
      json['ext_args'].forEach((v) {
        extArgs!.add(ExtArgsEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jztime'] = jztime;
    data['kstime'] = kstime;
    data['joinsum'] = joinsum;
    data['joincount'] = joincount;
    data['sqtype'] = sqtype;

    if (extArgs != null) {
      data['ext_args'] = extArgs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExtArgsEntity {
  String? extShowName;
  String? extShowDesc;
  var isrequired;
  String? extType;
  int? extName;

  ExtArgsEntity({
    this.extShowName,
    this.extShowDesc,
    this.isrequired,
    this.extType,
    this.extName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ext_show_name'] = extShowName;
    data['ext_show_desc'] = extShowDesc;
    data['isrequired'] = isrequired;
    data['ext_type'] = extType;
    data['ext_name'] = extName;

    return data;
  }

  ExtArgsEntity.fromJson(Map<String, dynamic> json) {
    extShowName = json['ext_show_name'];
    extShowDesc = json['ext_show_desc'];
    isrequired = json['isrequired'];
    extType = json['ext_type'];
    extName = json['ext_name'];
  }
}
