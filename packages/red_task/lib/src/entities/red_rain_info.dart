class RedRainEntity {
  String? message;
  int? code;
  int? statusCode;

  RedRainEntity({
    this.message,
    this.code,
    this.statusCode,
  });

  RedRainEntity.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    
    code = json['code'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['status_code'] = statusCode;
    return data;
  }
}