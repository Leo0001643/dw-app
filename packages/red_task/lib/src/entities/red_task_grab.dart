class RedTaskGrabEntity {
  dynamic message;
  int? isOk;
  int? statusCode;

  RedTaskGrabEntity({
    this.message,
    this.isOk,
    this.statusCode,
  });

  RedTaskGrabEntity.fromJson(Map<String, dynamic> json) {

    message = json['message'];
    isOk = json['is_ok'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['is_ok'] = isOk;
    data['status_code'] = statusCode;
    return data;
  }
}
