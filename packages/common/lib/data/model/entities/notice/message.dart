class MessageEntity {
  Config? config;
  int? total;
  List<MessageItems>? items;
  int? statusCode;

  MessageEntity({this.config, this.total, this.items, this.statusCode});

  MessageEntity.fromJson(Map<String, dynamic> json) {
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
    total = json['total'];
    if (json['items'] != null) {
      items = <MessageItems>[];
      json['items'].forEach((v) {
        items!.add(new MessageItems.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.config != null) {
      data['config'] = this.config!.toJson();
    }
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class Config {
  String? tagvalue;

  Config({this.tagvalue});

  Config.fromJson(Map<String, dynamic> json) {
    tagvalue = json['tagvalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagvalue'] = this.tagvalue;
    return data;
  }
}

class MessageItems {
  int? id;
  int? addTime;
  bool? isShowDetail;
  String? title;
  String? titleEn;
  String? body;
  int? isRead;
  int? isState;
  int? userCount;
  int? isCount;
  int? isHudong;
  int? isPopup;
  int? upTime;

  MessageItems(
      {this.id,
      this.addTime,
      this.title,
      this.titleEn,
      this.body,
      this.isRead,
      this.isState,
      this.userCount,
      this.isCount,
      this.isHudong,
      this.isPopup,
      this.upTime});

  MessageItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addTime = json['add_time'];
    title = json['title'];
    titleEn = json['title_en'];
    body = json['body'];
    isRead = json['is_read'];
    isState = json['is_state'];
    userCount = json['user_count'];
    isCount = json['is_count'];
    isHudong = json['is_hudong'];
    isPopup = json['is_popup'];
    upTime = json['up_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['add_time'] = this.addTime;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['body'] = this.body;
    data['is_read'] = this.isRead;
    data['is_state'] = this.isState;
    data['user_count'] = this.userCount;
    data['is_count'] = this.isCount;
    data['is_hudong'] = this.isHudong;
    data['is_popup'] = this.isPopup;
    data['up_time'] = this.upTime;
    return data;
  }
}
