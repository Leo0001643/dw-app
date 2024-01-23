class CountDownLotteryEntity {
  int? time;
  String? term;
  String? title;
  String? type;
  String? subTitile;
  int? titleColor;
  String? status;
  CountDownLotteryEntity({this.time, this.term, this.status});
  CountDownLotteryEntity.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    term = json['term'];
    type = json['type'];
    title = json['title'];
    titleColor = json['titleColor'];
    status = json['status'];
    subTitile = json['subTitile'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['term'] = this.term;
    data['status'] = this.status;
    data['titleColor'] = this.titleColor;
    data['title'] = this.title;
    data['type'] = this.type;
    data['subTitile'] = this.subTitile;


    return data;
  }
}
