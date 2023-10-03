class WidthdrawEntity {
  int? total;
  String? money;
  List<WidthdrawItem>? items;
  int? statusCode;

  WidthdrawEntity({this.total, this.items, this.statusCode});

  WidthdrawEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <WidthdrawItem>[];
      json['items'].forEach((v) {
        items!.add(new WidthdrawItem.fromJson(v));
      });
    }
    statusCode = json['status_code'];
    money = '${json['money']}';
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

class WidthdrawItem {
  int? id;
  String? txTotal;
  String? ordernumber;
  String? bankcard;
  String? tx_total_true;
  String? bankusername;
  String? remarks;
  int? addTime;
  int? state;
  int? type;
  String? txSxf;
  String? url;
  int? isQuery;
  int? tx_card_type;

  WidthdrawItem(
      {this.id,
      this.txTotal,
      this.addTime,
      this.ordernumber,
      this.tx_total_true,
      this.bankcard,
      this.bankusername,
      this.remarks,
      this.type,
      this.state,
      this.txSxf,
      this.tx_card_type});

  WidthdrawItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    txTotal = json['tx_total'];
    addTime = json['add_time'];
    type = json['type'];
    state = json['state'];
    ordernumber = json['ordernumber'];
    txSxf = json['tx_sxf'];
    tx_total_true = json['tx_total_true'];
    bankcard = json['bankcard'];
    bankusername = json['bankusername'];
    remarks = json['remarks'];
    isQuery = json['isQuery'];
    url = json['url'];
    tx_card_type = json['tx_card_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tx_total'] = this.txTotal;
    data['add_time'] = this.addTime;
    data['type'] = this.type;
    data['state'] = this.state;
    data['tx_sxf'] = this.txSxf;
    data['ordernumber'] = this.ordernumber;
    data['tx_total_true'] = this.tx_total_true;
    data['bankcard'] = this.bankcard;
    data['bankusername'] = this.bankusername;
    data['remarks'] = this.remarks;
    data['isQuery'] = this.isQuery;
    data['url'] = this.url;
    data['tx_card_type'] = this.tx_card_type;
    return data;
  }
}
