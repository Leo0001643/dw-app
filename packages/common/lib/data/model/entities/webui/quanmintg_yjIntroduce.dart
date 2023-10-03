/**
 * 佣金说明 返回实体
 */
class QuanmintgYiIntroduce {
  List<QuanmintgYiIntroduceItems>? items;
  int? statusCode;

  QuanmintgYiIntroduce({this.items, this.statusCode});

  QuanmintgYiIntroduce.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <QuanmintgYiIntroduceItems>[];
      json['items'].forEach((v) {
        items!.add(QuanmintgYiIntroduceItems.fromJson(v));
      });
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class QuanmintgYiIntroduceItems {
  int? classId;
  String? className;
  List<QuanmintgYiIntroduceItem>? item;

  QuanmintgYiIntroduceItems({this.classId, this.className, this.item});

  QuanmintgYiIntroduceItems.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    className = json['class_name'];
    if (json['item'] != null) {
      item = <QuanmintgYiIntroduceItem>[];
      json['item'].forEach((v) {
        item!.add(QuanmintgYiIntroduceItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class_id'] = classId;
    data['class_name'] = className;
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuanmintgYiIntroduceItem {
  int? id;
  String? name;
  int? gameType;
  int? qujian;
  int? fytotalYi;
  int? fytotalEr;
  int? fytotalSan;
  String? nameEn;

  QuanmintgYiIntroduceItem(
      {this.id,
        this.name,
        this.gameType,
        this.qujian,
        this.fytotalYi,
        this.fytotalEr,
        this.fytotalSan,
        this.nameEn});

  QuanmintgYiIntroduceItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gameType = json['game_type'];
    qujian = json['qujian'];
    fytotalYi = json['fytotal_yi'];
    fytotalEr = json['fytotal_er'];
    fytotalSan = json['fytotal_san'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['game_type'] = gameType;
    data['qujian'] = qujian;
    data['fytotal_yi'] = fytotalYi;
    data['fytotal_er'] = fytotalEr;
    data['fytotal_san'] = fytotalSan;
    data['name_en'] = nameEn;
    return data;
  }
}
