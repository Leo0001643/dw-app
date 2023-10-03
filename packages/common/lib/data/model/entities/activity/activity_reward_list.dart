
class ActivityRewardEntity {
  List<ActivityRewardList>? list;
  int? total;
  double? award;
  int? statusCode;

  ActivityRewardEntity({this.list, this.total, this.award, this.statusCode});

  ActivityRewardEntity.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ActivityRewardList>[];
      json['list'].forEach((v) {
        list!.add(ActivityRewardList.fromJson(v));
      });
    }
    total = json['total'];
    award = double.tryParse('${json['award']}');
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['award'] = award;
    data['status_code'] = statusCode;
    return data;
  }
}

class ActivityRewardList {
  int? id;
  String? activityType;
  int? activityId;
  int? taskId;
  int? itemId;
  String? orderNo;
  int? state;
  //过期时间
  int? expired;
  String? award;
  String? xml;
  int? ctime;
  int? utime;
  int? activityTypeNum;

  ActivityRewardList(
      {this.id,
        this.activityType,
        this.activityId,
        this.taskId,
        this.itemId,
        this.orderNo,
        this.state,
        this.expired,
        this.award,
        this.xml,
        this.ctime,
        this.utime,
        this.activityTypeNum});

  ActivityRewardList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityType = json['activity_type'];
    activityId = json['activity_id'];
    taskId = json['task_id'];
    itemId = json['item_id'];
    orderNo = json['order_no'];
    state = json['state'];
    expired = json['expired'];
    award = json['award'];
    xml = json['xml'];
    ctime = json['ctime'];
    utime = json['utime'];
    activityTypeNum = json['activity_type_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['activity_type'] = activityType;
    data['activity_id'] = activityId;
    data['task_id'] = taskId;
    data['item_id'] = itemId;
    data['order_no'] = orderNo;
    data['state'] = state;
    data['expired'] = expired;
    data['award'] = award;
    data['xml'] = xml;
    data['ctime'] = ctime;
    data['utime'] = utime;
    data['activity_type_num'] = activityTypeNum;
    return data;
  }
}
