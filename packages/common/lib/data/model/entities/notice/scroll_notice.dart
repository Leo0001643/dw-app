class ScrollNoticeEntity {
  int? total;
  List<ScrollNoticeItem>? items;
  int? statusCode;

  ScrollNoticeEntity({this.total, this.items, this.statusCode});

  ScrollNoticeEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <ScrollNoticeItem>[];
      json['items'].forEach((v) {
        items!.add(ScrollNoticeItem.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class ScrollNoticeItem {
  int? id;
  String? body;
  String? bodyEn;
  int? order;
  int? addTime;
  int? device;
  int? lang;
  int? state;


  String? title;
  String? titleEn;
  int? tag;
  int? isBk;
  int? isshow;
  String? popupWindowDisplayPage;
  Map<String, dynamic>? announcementTheStyle;


  ScrollNoticeItem({
    this.id,
    this.body,
    this.bodyEn,
    this.order,
    this.addTime,
    this.device,
    this.lang,
    this.state,
  });

  ScrollNoticeItem.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['body'] = body;
    data['body_en'] = bodyEn;
    data['order'] = order;
    data['add_time'] = addTime;
    data['device'] = device;
    data['lang'] = lang;
    data['state'] = state;
    return data;
  }
}
