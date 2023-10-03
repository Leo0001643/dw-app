

class YongJinEntity {
  String? message;
  int? statusCode;
  Map? data;

  YongJinEntity({this.message, this.statusCode,this.data});

  YongJinEntity.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    data = json["data"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status_code'] = statusCode;
    data['data'] = data;
    return data;
  }
}

