

class CheckUpdateEntity {
  String? message;
  int? statusCode;
  String? items;
  String? version;

  CheckUpdateEntity({this.message, this.statusCode, this.items, this.version});

  CheckUpdateEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
    items = json['items'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status_code'] = statusCode;
    data['items'] = items;
    data['version'] = version;
    return data;
  }
}