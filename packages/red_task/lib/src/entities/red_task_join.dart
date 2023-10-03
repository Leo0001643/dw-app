class RedTaskJoinEntity {
  int? statusCode;
  int? isOk;
  String? message;

  RedTaskJoinEntity({
    this.statusCode,
    this.isOk,
    this.message,
  });

  RedTaskJoinEntity.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    isOk = json['is_ok'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['is_ok'] = isOk;
    data['message'] = message;
    return data;
  }
}
