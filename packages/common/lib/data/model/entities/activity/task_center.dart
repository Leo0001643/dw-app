import 'dart:math';

import 'package:get/get.dart';

class TaskCenterEntity {
  bool? isZs;
  int? total;
  List<TaskItem>? items;
  int? statusCode;

  TaskCenterEntity({this.isZs, this.total, this.items, this.statusCode});

  TaskCenterEntity.fromJson(Map<String, dynamic> json) {
    isZs = json['is_zs'];
    total = json['total'];
    if (json['items'] != null) {
      items = <TaskItem>[];
      json['items'].forEach((v) {
        items!.add(TaskItem.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }
}

class TaskItem {
  int? id; // 活动id
  String? title; // 标题
  String? titleEn;
  int? stime; // 开始时间
  int? etime; // 结束时间
  JoinCond? joinCond;
  int? state; // 参与状态 待确认
  List<TaskAward>? taskAward;
  List<Process>? process;

  TaskItem({
    this.id,
    this.title,
    this.titleEn,
    this.stime,
    this.etime,
    this.joinCond,
    this.state,
    this.taskAward,
    this.process,
  });

  TaskItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    stime = json['stime'];
    etime = json['etime'];
    joinCond =
        json['join_cond'] != null ? JoinCond.fromJson(json['join_cond']) : null;
    state = json['state'];
    if (json['task_award'] != null) {
      taskAward = <TaskAward>[];
      json['task_award'].forEach((key, v) {
        taskAward!.add(TaskAward.fromJson(key, v));
      });
    }
    if (json['process'] != null) {
      process = <Process>[];

      ///返回的数据不稳定 为空时 返回list 不为空时 返回{}
      if (json['process'].isNotEmpty) {
        json['process'].forEach((_, v) {
          if (v != null) {
            process!.add(Process.fromJson(v));
          }
        });
      }
    }
  }
}

class JoinCond {
  //join_cond.apply=1 走 申请参与流程,join_cond.apply=0 走 前去完成流程
  int? apply;
  String? dml;
  String? dmlFinish;
  String? deposit;
  String? depositFinish;
  String? message;
  int? errCode;

  JoinCond({this.apply});

  JoinCond.fromJson(Map<String, dynamic> json) {
    apply = json['apply'];
    dml = json['dml'];
    dmlFinish = json['dml_finish'];
    deposit = json['deposit'];
    depositFinish = json['deposit_finish'];
    message = json['message'];
    errCode = json['err_code'];
  }
}

class Process {
  int? recieveWay;
  List<String>? conds;
  // 1今天 2次日 3每天 4每周 5每两周 6每月 7活动时间 8其他时间 结算周期
  int? cycle;
  String? title;
  int? taskId;
  TimePeriod? pjTime;
  TimePeriod? jsTime;
  List<ChildTask>? value;

  Process({
    this.recieveWay,
    this.conds,
    this.cycle,
    this.title,
    this.taskId,
    this.pjTime,
    this.jsTime,
    this.value,
  });

  Process.fromJson(Map<String, dynamic> json) {
    recieveWay = json['recieve_way'];
    conds = json['conds'].cast<String>();
    cycle = json['cycle'];
    title = json['title'];
    taskId = json['task_id'];
    pjTime =
        json['pj_time'] != null ? TimePeriod.fromJson(json['pj_time']) : null;
    jsTime =
        json['js_time'] != null ? TimePeriod.fromJson(json['js_time']) : null;
    if (json['value'] != null) {
      value = <ChildTask>[];
      json['value'].forEach((v) {
        value!.add(ChildTask.fromJson(v));
      });
    }
  }
}

class TimePeriod {
  int? stime;
  int? etime;

  TimePeriod({this.stime, this.etime});

  TimePeriod.fromJson(Map<String, dynamic> json) {
    stime = json['stime'];
    etime = json['etime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stime'] = stime;
    data['etime'] = etime;
    return data;
  }
}

class ChildTask {
  int? status;
  int? itemId;
  TaskProgress? value;
  int? paicaiType;
  double? ratio;
  String? award;
  String? gameType;
  String? gameType2;
  String? gameTagName;
  String? gameTagName2;
  bool? show;
  int? paicaiState;

  ChildTask({
    this.status,
    this.itemId,
    this.value,
    this.paicaiType,
    this.ratio,
    this.award,
    this.gameType,
    this.gameType2,
    this.gameTagName,
    this.gameTagName2,
    this.show,
    this.paicaiState,
  });

  ChildTask.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    itemId = json['item_id'];
    value = json['value'] != null ? TaskProgress.fromJson(json['value']) : null;
    paicaiType = json['paicai_type'];
    ratio = double.tryParse('${json['ratio']}') ?? 0.0;
    award = '${json['award']}';
    gameType = json['game_type'];
    gameType2 = json['game_type2'];
    gameTagName = json['game_tag_name'];
    gameTagName2 = json['game_tag_name2'];
    show = json['show'];
    paicaiState = json['paicai_state'];
  }
}

class TaskProgress {
  // deposit 充值 dml 打码量 profit 负盈利 fs 反水 ： finish 完成了多少
  String? depositFinish;
  String? deposit;
  String? dmlFinish;
  String? dml;
  String? profitFinish;
  String? profit;
  String? fsFinish;
  String? fs;
  double? percent;
  String? percentStr;

  TaskProgress({
    this.depositFinish,
    this.deposit,
    this.dmlFinish,
    this.dml,
    this.profitFinish,
    this.profit,
    this.fsFinish,
    this.fs,
  });

  TaskProgress.fromJson(Map<String, dynamic> json) {
    depositFinish = "${json['deposit_finish']}";
    deposit = json['deposit'];
    dmlFinish = "${json['dml_finish']}";
    dml = json['dml'];
    profitFinish = "${json['profit_finish']}";
    profit = json['profit'];
    fsFinish = "${json['fs_finish']}";
    fs = json['fs'];
    percent = _resolveProgress(this);
  }

  double _resolveProgress(TaskProgress item) {
    int dividedBy = 0;
    double total = 0;
    if (item.deposit != null) {
      dividedBy++;
      total += _calculateTotal(item.depositFinish!, item.deposit!);
    }
    if (item.profit != null) {
      dividedBy++;
      total += _calculateTotal(item.profitFinish!, item.profit!);
    }
    if (item.fs != null) {
      dividedBy++;
      total += _calculateTotal(item.fsFinish!, item.fs!);
    }
    if (item.dml != null) {
      dividedBy++;
      total += _calculateTotal(item.dmlFinish!, item.dml!);
    }
    print(
        'total = ${total}dividedBy = ${dividedBy} 最后${((total / dividedBy).roundToDouble())}');

    return ((total / dividedBy).roundToDouble());
  }

  double _calculateTotal(String userDone, String target) {
    double _difference = (double.parse(userDone) / double.parse(target));

    double _percent = _difference * 100;
    double _val = min(_percent.roundToDouble(), 100.0);

    print('_difference = ${_difference}_percent = ${_percent}  _val = ${_val}');
    return _val;
  }

  calculateTotalWith(String userDone, String target, int postion) {
    double num = double.parse(userDone) / double.parse(target) * 100;
    if (userDone == '0') {
      return '0';
    }
    if (num >= 100) {
      return '100';
    }
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      //小数点后有几位小数
      return (num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    } else {
      return (num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString());
    }
  }
}

class TaskAward {
  int? taskId;
  String? award;

  TaskAward({this.taskId, this.award});

  TaskAward.fromJson(dynamic key, dynamic value) {
    taskId = int.parse(key);
    award = value;
  }
}

class TaskCenterApplyEntities {
  String? message;
  int? errCode;
  int? statusCode;
  String? depositFinish;
  String? deposit;
  String? dmlFinish;
  String? dml;

  TaskCenterApplyEntities({this.message, this.errCode, this.statusCode});

  TaskCenterApplyEntities.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errCode = json['err_code'];
    statusCode = json['status_code'];
    depositFinish = "${json['deposit_finish']}";
    deposit = json['deposit'];
    dmlFinish = "${json['dml_finish']}";
    dml = json['dml'];
  }
}
