//签到配置信息
import '../../../../utils/formatter.dart';

class SininConfigData {
  SininConfigInfo? sininConfigInfo;
  int? statusCode;

  SininConfigData({this.sininConfigInfo, this.statusCode});

  SininConfigData.fromJson(Map<String, dynamic> json) {
    sininConfigInfo =
        json['info'] != null ? SininConfigInfo.fromJson(json['info']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (sininConfigInfo != null) {
      data['info'] = sininConfigInfo!.toJson();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class SininConfigInfo {
  int? todayMoney;
  int? lxCount;
  int? trueQd;
  int? isQd;
  List<Null>? qdData;

  SininConfigInfo(
      {this.todayMoney, this.lxCount, this.trueQd, this.isQd, this.qdData});

  SininConfigInfo.fromJson(Map<String, dynamic> json) {
    todayMoney = json['today_money'];
    lxCount = json['lx_count'];
    trueQd = json['true_qd'];
    isQd = json['is_qd'];
    if (json['qd_data'] != null) {
      qdData = <Null>[];
      json['qd_data'].forEach((v) {
        // qdData!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['today_money'] = todayMoney;
    data['lx_count'] = lxCount;
    data['true_qd'] = trueQd;
    data['is_qd'] = isQd;
    if (qdData != null) {
      // data['qd_data'] = this.qdData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SininData {
  SininEntivity? sininEntivity;
  int? statusCode;

  SininData({this.sininEntivity, this.statusCode});

  SininData.fromJson(Map<String, dynamic> json) {
    sininEntivity =
        json['data'] != null ? SininEntivity.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (sininEntivity != null) {
      data['data'] = sininEntivity!.toJson();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class SininEntivity {
  List<SevenDay>? sevenDay;
  List<SevenDay>? qiandaoRecord;
  HdInfo? hdInfo;
  UserQiandaoInfo? userQiandaoInfo;
  bool? sininBreak;
  bool? todayIsQiandao;
  bool? isShowReissue;
  int? resumeLimit;

  SininEntivity(
      {this.sevenDay,
      this.qiandaoRecord,
      this.hdInfo,
      this.userQiandaoInfo,
      this.sininBreak,
      this.todayIsQiandao,
      this.isShowReissue,
      this.resumeLimit});

  SininEntivity.fromJson(Map<String, dynamic> json) {
    if (json['seven_day'] != null) {
      sevenDay = <SevenDay>[];
      json['seven_day'].forEach((v) {
        sevenDay!.add(SevenDay.fromJson(v));
      });
    }
    if (json['qiandao_record'] != null) {
      qiandaoRecord = <SevenDay>[];
      json['qiandao_record'].forEach((v) {
        qiandaoRecord!.add(SevenDay.fromJson(v));
      });
    }
    hdInfo = json['hd_info'] != null ? HdInfo.fromJson(json['hd_info']) : null;

    // if (json['user_qiandao_info'] != null) {
    //   // userQiandaoInfo = <Null>[];
    //   // json['user_qiandao_info'].forEach((v) { userQiandaoInfo!.add(new Null.fromJson(v)); });
    //   // userQiandaoInfo = json['user_qiandao_info'] != null
    //   //     ? UserQiandaoInfo.fromJson(json['user_qiandao_info'])
    //   //     : null;
    // }
    userQiandaoInfo = json['user_qiandao_info'] != null
        ? UserQiandaoInfo.fromJson(json['user_qiandao_info'])
        : null;

    sininBreak = json['break'];
    todayIsQiandao = json['today_is_qiandao'];
    isShowReissue = json['is_show_reissue'];
    resumeLimit = json['resume_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (sevenDay != null) {
      data['seven_day'] = sevenDay!.map((v) => v.toJson()).toList();
    }

    if (qiandaoRecord != null) {
      // data['qiandao_record'] = this.qiandaoRecord!.map((v) => v.toJson()).toList();
    }
    if (hdInfo != null) {
      data['hd_info'] = hdInfo!.toJson();
    }
    if (userQiandaoInfo != null) {
      data['user_qiandao_info'] = userQiandaoInfo?.toJson();
    }
    data['break'] = sininBreak;
    data['today_is_qiandao'] = todayIsQiandao;
    data['is_show_reissue'] = isShowReissue;
    data['resume_limit'] = resumeLimit;
    return data;
  }
}

class SevenDay {
  String? riqiDate;
  String? qiandaoMoney;
  String? extraMoney;
  int? state;
  String? dataIndex;

  SevenDay(
      {this.riqiDate,
      this.qiandaoMoney,
      this.extraMoney,
      this.state,
      this.dataIndex});

  SevenDay.fromJson(Map<String, dynamic> json) {
    riqiDate = json['riqi_date'];
    qiandaoMoney = decimalString(json['qiandao_money'], 2);
    extraMoney = decimalString(json['extra_money'], 2);
    state = json['state'];
    dataIndex = json['data_index'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['riqi_date'] = riqiDate;
    data['qiandao_money'] = qiandaoMoney;
    data['extra_money'] = extraMoney;
    data['state'] = state;
    data['data_index'] = dataIndex;
    return data;
  }
}

class HdInfo {
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
  int? agentId;
  String? qtPcSlmgEn;
  String? qtAppSlmgEn;
  String? lang;

  HdInfo(
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
      this.lang});

  HdInfo.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    return data;
  }
}

//签到、补签返回
class SininBackEntivity {
  int? statusCode;
  String? message;
  String? qiandaoMoney;
  String? extraMoney;
  int? lxCount;
  String? czDiff;
  String? dmlDiff;

  SininBackEntivity({
    this.statusCode,
    this.message,
    this.czDiff,
    this.dmlDiff,
    this.qiandaoMoney,
    this.extraMoney,
    this.lxCount,
  });

  SininBackEntivity.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    czDiff = json['cz_diff'];
    dmlDiff = json['dml_diff'];
    qiandaoMoney = json['qiandao_money'];
    extraMoney = json['extra_money'];
    lxCount = json['lx_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['status_code'] = statusCode;
    data['message'] = message;
    data['cz_diff'] = czDiff;
    data['dml_diff'] = dmlDiff;
    data['qiandao_money'] = qiandaoMoney;
    data['extra_money'] = extraMoney;
    data['lx_count'] = lxCount;

    return data;
  }
}

class UserQiandaoInfo {
  int? id;
  int? userId;
  String? userName;
  int? activityId;
  int? addTime;
  int? upTime;
  int? qdCount;
  int? lxCount;
  String? qdMoney;
  String? dataJson;
  int? reissueCount;
  String? clientIp;
  String? lastReissueDate;
  int? lastReissueCount;

  UserQiandaoInfo(
      {this.id,
      this.userId,
      this.userName,
      this.activityId,
      this.addTime,
      this.upTime,
      this.qdCount,
      this.lxCount,
      this.qdMoney,
      this.dataJson,
      this.reissueCount,
      this.clientIp,
      this.lastReissueDate,
      this.lastReissueCount});

  UserQiandaoInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    activityId = json['activity_id'];
    addTime = json['add_time'];
    upTime = json['up_time'];
    qdCount = json['qd_count'];
    lxCount = json['lx_count'];
    qdMoney = json['qd_money'];
    dataJson = json['data_json'];
    reissueCount = json['reissue_count'];
    clientIp = json['client_ip'];
    lastReissueDate = json['last_reissue_date'];
    lastReissueCount = json['last_reissue_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['activity_id'] = activityId;
    data['add_time'] = addTime;
    data['up_time'] = upTime;
    data['qd_count'] = qdCount;
    data['lx_count'] = lxCount;
    data['qd_money'] = qdMoney;
    data['data_json'] = dataJson;
    data['reissue_count'] = reissueCount;
    data['client_ip'] = clientIp;
    data['last_reissue_date'] = lastReissueDate;
    data['last_reissue_count'] = lastReissueCount;
    return data;
  }
}
