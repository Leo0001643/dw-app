class ReportEntity {
  int? total;
  List<ReportItems>? items;
  ReportSum? sum;

  ReportEntity({this.total, this.items});

  ReportEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    sum = ReportSum.fromJson(json['sum']);
    if (json['items'] != null) {
      items = <ReportItems>[];
      json['items'].forEach((v) {
        items!.add(new ReportItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReportItems {
  int? id;
  int? userId;
  String? userName;
  String? ordernumber;
  int? type;
  String? ptName;
  String? total;
  String? info;
  int? jyTime;
  String? jyhTotal;
  String? xml;
  String? jyhXml;
  String? ptTotal;

  ReportItems(
      {this.id,
        this.userId,
        this.userName,
        this.ordernumber,
        this.type,
        this.ptName,
        this.total,
        this.info,
        this.jyTime,
        this.jyhTotal,
        this.xml,
        this.jyhXml,
        this.ptTotal});

  ReportItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    ordernumber = json['ordernumber'];
    type = json['type'];
    ptName = json['pt_name'];
    total = json['total'];
    info = json['info'];
    jyTime = json['jy_time'];
    jyhTotal = json['jyh_total'];
    xml = json['xml'];
    jyhXml = json['jyh_xml'];
    ptTotal = json['pt_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['ordernumber'] = this.ordernumber;
    data['type'] = this.type;
    data['pt_name'] = this.ptName;
    data['total'] = this.total;
    data['info'] = this.info;
    data['jy_time'] = this.jyTime;
    data['jyh_total'] = this.jyhTotal;
    data['xml'] = this.xml;
    data['jyh_xml'] = this.jyhXml;
    data['pt_total'] = this.ptTotal;
    return data;
  }
}



class ReportSum {

  String? jyh_total;
  String? total;


  ReportSum(
      {this.jyh_total,
        this.total
       });

  ReportSum.fromJson(Map<String, dynamic> json) {
    jyh_total = json['jyh_total'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jyh_total'] = this.jyh_total;
    data['total'] = this.total;
    return data;
  }
}