class HandleFsEntity {
  String? items;
  int? type;
  int? statusCode;

  HandleFsEntity({this.items, this.type, this.statusCode});

  HandleFsEntity.fromJson(Map<String, dynamic> json) {
    items = json['items'];
    type = json['type'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = items;
    data['type'] = type;
    data['status_code'] = statusCode;
    return data;
  }
}
