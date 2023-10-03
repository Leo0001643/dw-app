class MessageSiteEntity {
  int? total;
  List<MessageSiteItems>? items;
  int? statusCode;

  MessageSiteEntity({this.total, this.items, this.statusCode});

  MessageSiteEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <MessageSiteItems>[];
      json['items'].forEach((v) {
        items!.add(new MessageSiteItems.fromJson(v));
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

class MessageSiteItems {
  int? id;
  String? body;
  Null? bodyEn;
  int? order;
  int? addTime;
  int? device;
  int? lang;
  int? state;

  MessageSiteItems(
      {this.id,
        this.body,
        this.bodyEn,
        this.order,
        this.addTime,
        this.device,
        this.lang,
        this.state});

  MessageSiteItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    body = json['body'];
    bodyEn = json['body_en'];
    order = json['order'];
    addTime = json['add_time'];
    device = json['device'];
    lang = json['lang'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['body_en'] = this.bodyEn;
    data['order'] = this.order;
    data['add_time'] = this.addTime;
    data['device'] = this.device;
    data['lang'] = this.lang;
    data['state'] = this.state;
    return data;
  }
}