class ForgetPasswordEntity {
  String? wen;
  String? wenT;

  ForgetPasswordEntity({this.wen, this.wenT});

  ForgetPasswordEntity.fromJson(Map<String, dynamic> json) {
    wen = (json['wen']??"").toString();
    wenT = (json['wen_t']??"").toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wen'] = wen;
    data['wen_t'] = wenT;
    return data;
  }
}

class CommonTipsEntity {
  String? message;
  int? statusCode;
  int? code;

  CommonTipsEntity({this.message, this.statusCode});

  CommonTipsEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
    statusCode = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    data['code'] = this.code;

    return data;
  }
}
