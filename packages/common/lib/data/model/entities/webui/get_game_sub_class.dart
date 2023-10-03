

/// remind: converted items to list
class GameSubClassEntity {
  List<GameSubClassItem>? items;
  int? statusCode;

  GameSubClassEntity({this.items, this.statusCode});

  GameSubClassEntity.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? mapItems = json['items'];
    if (mapItems != null) {
      items = mapItems.values.map((value) => GameSubClassItem.fromJson(value)).toList();
    }
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((e) => e.toJson());
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class GameSubClassItem {
  int? classId;
  int? pid;
  String? name;

  GameSubClassItem({this.classId, this.pid, this.name});

  GameSubClassItem.fromJson(Map<String, dynamic> json) {
    classId = json['class_id'];
    pid = json['pid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['class_id'] = classId;
    data['pid'] = pid;
    data['name'] = name;
    return data;
  }
}
