class RedTaskInfoEntity {
  int? isShow;
  int? id;
  int? weizhi;
  String? jiaotu;
  String? img;
  int? statusCode;

  RedTaskInfoEntity({
    this.isShow,
    this.id,
    this.weizhi,
    this.jiaotu,
    this.img,
    this.statusCode,
  });

  RedTaskInfoEntity.fromJson(Map<String, dynamic> json) {
    isShow = json['is_show'];
    id = json['id'];
    weizhi = json['weizhi'];
    jiaotu = "${json['jiaotu']}";
    img = json['img'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_show'] = isShow;
    data['id'] = id;
    data['weizhi'] = weizhi;
    data['jiaotu'] = jiaotu;
    data['img'] = img;
    data['status_code'] = statusCode;
    return data;
  }
}
