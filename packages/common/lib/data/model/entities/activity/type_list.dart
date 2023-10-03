class ActivityTypesEntity {
  int? total;
  List<ActivityType>? items;
  int? statusCode;

  ActivityTypesEntity({this.total, this.items, this.statusCode});

  ActivityTypesEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <ActivityType>[];
      json['items'].forEach((v) {
        items!.add(ActivityType.fromJson(v));
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

class ActivityType {
  int? id;
  String? classNameCn;
  int? order;

  ActivityType({this.id, this.classNameCn, this.order});

  ActivityType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classNameCn = json['class_name_cn'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['class_name_cn'] = classNameCn;
    data['order'] = order;
    return data;
  }
}
