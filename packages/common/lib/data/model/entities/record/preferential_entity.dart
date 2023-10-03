class PreferentialEntity {
  int? total;
  List<YhItem>? items;
  int? statusCode;

  PreferentialEntity({this.total, this.items, this.statusCode});

  PreferentialEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <YhItem>[];
      json['items'].forEach((v) {
        items!.add(new YhItem.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class YhItem {
  int? id;
  int? userId;
  String? activityTitle;
  String? ordernumber;
  int? get_time;
  String? user_name;
  String? yh_total;
  String? yh_bs;
  String? xml_bs;
  String? xml_total;
  String? remarks;
  String? activity_title;
  String? type;
  int? upTime;
  int? yh_type;
  int? state;
  String? yhTotal;
  String? sh_user;

  YhItem(
      {this.id,
      this.userId,
      this.activityTitle,
      this.ordernumber,
      this.get_time,
      this.user_name,
      this.yh_total,
      this.yh_bs,
      this.xml_total,
      this.xml_bs,
      this.remarks,
      this.activity_title,
      this.upTime,
      this.state,
        this.type,
      this.yh_type,
      this.yhTotal,
      this.sh_user});

  YhItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    activityTitle = json['activity_title'];
    ordernumber = json['ordernumber'];
    get_time = json['get_time'];
    user_name = json['user_name'];
    yh_total = json['yh_total'];
    yh_bs = json['yh_bs'];
    xml_total = json['xml_total'];
    xml_bs = json['xml_bs'];
    remarks = json['remarks'];
    activity_title = json['activity_title'];
    upTime = json['up_time'];
    state = json['state'];
    yh_type = json['yh_type'];
    yhTotal = json['yh_total'];
    sh_user = json['sh_user'];
    type = json['type'];

    print('remarks == ${remarks}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['activity_title'] = this.activityTitle;
    data['ordernumber'] = this.ordernumber;
    data['get_time'] = this.get_time;
    data['user_name'] = this.user_name;
    data['yh_total'] = this.yh_total;
    data['yh_bs'] = this.yh_bs;
    data['xml_total'] = this.xml_total;
    data['xml_bs'] = this.xml_bs;
    data['remarks'] = this.remarks;
    data['activity_title'] = this.activity_title;
    data['up_time'] = this.upTime;
    data['state'] = this.state;
    data['yh_type'] = this.yh_type;
    data['yh_total'] = this.yhTotal;
    data['sh_user'] = this.sh_user;
    data['type'] = this.type;
    return data;
  }
}
