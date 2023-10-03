class RedTaskCenterEntity {
  String? title;
  List<String>? time;
  List<String>? jsTime;
  List<RedTaskItem>? item;
  RedTaskCycle? cycle;
  int? taskCycle;
  Grab? grab;
  int? isGrap;
  int? style;
  int? isOver;
  int? statusCode;
  int? isTheLast;

  RedTaskCenterEntity({
    this.title,
    this.time,
    this.jsTime,
    this.item,
    this.cycle,
    this.taskCycle,
    this.grab,
    this.isGrap,
    this.style,
    this.isOver,
    this.statusCode,
    this.isTheLast,
  });

  RedTaskCenterEntity.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['time'] != null) {
      time = json['time'].cast<String>();
    }
    jsTime = json['js_time'].cast<String>();
    if (json['item'] != null) {
      item = <RedTaskItem>[];
      json['item'].forEach((v) {
        item!.add(RedTaskItem.fromJson(v));
      });
    }
    cycle = json['cycle'] != null ? RedTaskCycle.fromJson(json['cycle']) : null;
    taskCycle = json['task_cycle'];
    grab = json['grab'] != null ? Grab.fromJson(json['grab']) : null;
    isGrap = json['is_grap'];
    style = json['style'];
    isOver = json['is_over'];
    statusCode = json['status_code'];
    isTheLast = json['is_the_last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['time'] = time;
    data['js_time'] = jsTime;
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    if (cycle != null) {
      data['cycle'] = cycle!.toJson();
    }
    data['task_cycle'] = taskCycle;
    if (grab != null) {
      data['grab'] = grab!.toJson();
    }
    data['is_grap'] = isGrap;
    data['style'] = style;
    data['is_over'] = isOver;
    data['status_code'] = statusCode;
    data['is_the_last'] = isTheLast;
    return data;
  }
}

class RedTaskItem {
  int? id;
  int? itemId;
  String? gameType;
  String? gameTagName;
  int? redCount;
  String? deposit;
  int? finishDeposit;
  String? dml;
  int? finishDml;
  String? profit;
  int? finishProfit;
  String? award;
  int? status;
  int? condAllCount;
  int? condCount;

  RedTaskItem(
      {this.id,
      this.itemId,
      this.gameType,
      this.gameTagName,
      this.redCount,
      this.deposit,
      this.finishDeposit,
      this.dml,
      this.finishDml,
      this.profit,
      this.finishProfit,
      this.award,
      this.status,
      this.condAllCount,
      this.condCount});

  RedTaskItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    gameType = json['game_type'];
    gameTagName = json['game_tag_name'];
    redCount = json['red_count'];
    deposit = json['deposit'];
    finishDeposit = json['finish_deposit'];
    dml = json['dml'];
    finishDml = json['finish_dml'];
    profit = json['profit'];
    finishProfit = json['finish_profit'];
    award = '${json['award']}';
    status = json['status'];
    condAllCount = json['cond_all_count'];
    condCount = json['cond_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item_id'] = itemId;
    data['game_type'] = gameType;
    data['game_tag_name'] = gameTagName;
    data['red_count'] = redCount;
    data['deposit'] = deposit;
    data['finish_deposit'] = finishDeposit;
    data['dml'] = dml;
    data['finish_dml'] = finishDml;
    data['profit'] = profit;
    data['finish_profit'] = finishProfit;
    data['award'] = award;
    data['status'] = status;
    data['cond_all_count'] = condAllCount;
    data['cond_count'] = condCount;
    return data;
  }
}

class RedTaskCycle {
  int? cid;
  int? stime;
  int? etime;
  int? offset;

  RedTaskCycle({this.cid, this.stime, this.etime, this.offset});

  RedTaskCycle.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    stime = json['stime'];
    etime = json['etime'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['stime'] = stime;
    data['etime'] = etime;
    data['offset'] = offset;
    return data;
  }
}

class Grab {
  int? envelopeTime;
  List<int>? weekDay;
  List<int>? hour;
  String? day;

  Grab({this.envelopeTime, this.weekDay, this.hour, this.day});

  Grab.fromJson(Map<String, dynamic> json) {
    envelopeTime = json['envelope_time'];
    if (json['week_day'] != null) {
      weekDay = json['week_day'].cast<int>();
    } else {
      weekDay = [];
    }
    if (json['hour'] != null) {
      hour = json['hour'].cast<int>();
    }
    if (json['day'] != null) {
      day = json['day'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['envelope_time'] = envelopeTime;
    data['week_day'] = weekDay;
    data['hour'] = hour;
    data['data'] = day;
    return data;
  }
}
