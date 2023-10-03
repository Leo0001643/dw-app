class GeneralModel {
  String? message;
  int? statusCode;

  GeneralModel({
    this.message,
    this.statusCode,
  });

  GeneralModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}
