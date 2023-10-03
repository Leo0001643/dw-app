

class RechargeEntity {
  int? total;
  String? money;
  List<Items>? items;
  int? statusCode;

  RechargeEntity({this.total, this.money, this.items, this.statusCode});

  RechargeEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    money = '${json['money']}';
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['money'] = this.money;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Items {
  int? id;
  int? userId;
  String? userName;
  String? ordernumber;
  String? pt_name;
  String? yhtotal;
  String? xml_total;
  String? remarks;
  String? cunkuanren;
  String? operateUser;
  int? type;
  String? payTotal;
  int? state;
  int? addTime;
  int? isQuery;
  String? url;

  Items(
      {this.id,
        this.userId,
        this.userName,
        this.operateUser,
        this.ordernumber,
        this.pt_name,
        this.yhtotal,
        this.xml_total,
        this.remarks,
        this.cunkuanren,
        this.type,
        this.payTotal,
        this.state,
        this.addTime});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    operateUser = json['operate_user'];
    ordernumber = json['ordernumber'];
    pt_name = json['pt_name'];
    yhtotal = json['yhtotal'];
    xml_total = json['xml_total'];
    type = json['type'];
    remarks = json['remarks'];
    cunkuanren = json['cunkuanren'];
    payTotal = json['pay_total'];
    state = json['state'];
    addTime = json['add_time'];
    isQuery = json['isQuery'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['operate_user'] = this.operateUser;
    data['ordernumber'] = this.ordernumber;
    data['pt_name'] = this.pt_name;
    data['xml_total'] = this.xml_total;
    data['yhtotal'] = this.yhtotal;
    data['xml_total'] = this.xml_total;
    data['remarks'] = this.remarks;
    data['type'] = this.type;
    data['pay_total'] = this.payTotal;
    data['state'] = this.state;
    data['add_time'] = this.addTime;
    data['isQuery'] = this.isQuery;
    data['url'] = this.url;
    return data;
  }
}