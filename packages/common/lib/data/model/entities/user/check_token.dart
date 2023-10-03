
class CheckTokenEntity {
  int? statusCode;
  bool? token;

  CheckTokenEntity({this.statusCode, this.token});

  CheckTokenEntity.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['token'] = token;
    return data;
  }
}
