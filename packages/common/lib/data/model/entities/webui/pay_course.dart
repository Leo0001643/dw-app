class PayCourseEntity {
  int? total;
  List<PayCourseItem>? items;
  int? statusCode;

  PayCourseEntity({this.total, this.items, this.statusCode});

  PayCourseEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <PayCourseItem>[];
      json['items'].forEach((v) {
        items!.add(PayCourseItem.fromJson(v));
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

class PayCourseItem {
  int? id;
  int? classId;
  int? type;
  String? title;
  String? titleVi;
  String? titleEn;
  String? body;
  String? bodyVi;
  String? bodyEn;
  int? device;
  int? addTime;
  int? upTime;
  String? icon;
  String? iconVi;
  String? iconEn;
  String? className;

  PayCourseItem(
      {this.id,
        this.classId,
        this.type,
        this.title,
        this.titleVi,
        this.titleEn,
        this.body,
        this.bodyVi,
        this.bodyEn,
        this.device,
        this.addTime,
        this.upTime,
        this.icon,
        this.iconVi,
        this.iconEn,
        this.className});

  PayCourseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['class_id'];
    type = json['type'];
    title = json['title'];
    titleVi = json['title_vi'];
    titleEn = json['title_en'];
    body = json['body'];
    bodyVi = json['body_vi'];
    bodyEn = json['body_en'];
    device = json['device'];
    addTime = json['add_time'];
    upTime = json['up_time'];
    icon = json['icon'];
    iconVi = json['icon_vi'];
    iconEn = json['icon_en'];
    className = json['class_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['class_id'] = classId;
    data['type'] = type;
    data['title'] = title;
    data['title_vi'] = titleVi;
    data['title_en'] = titleEn;
    data['body'] = body;
    data['body_vi'] = bodyVi;
    data['body_en'] = bodyEn;
    data['device'] = device;
    data['add_time'] = addTime;
    data['up_time'] = upTime;
    data['icon'] = icon;
    data['icon_vi'] = iconVi;
    data['icon_en'] = iconEn;
    data['class_name'] = className;
    return data;
  }
}
