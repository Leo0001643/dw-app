class QuanmintgEchoImgEntity {
  int? code;
  String? img;
  String? message;
  int? statusCode;

  QuanmintgEchoImgEntity({this.code, this.img, this.message, this.statusCode});

  QuanmintgEchoImgEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    img = json['img'];
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['img'] = this.img;
    data['message'] = this.message;
    data['status_code'] = this.statusCode;
    return data;
  }
}
