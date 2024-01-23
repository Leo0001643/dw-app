class CountDownLotteryEntity {
  int? time;
  String? term;
  String? status;
  CountDownLotteryEntity({this.time, this.term, this.status});
  CountDownLotteryEntity.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    term = json['term'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['term'] = this.term;
    data['status'] = this.status;
    return data;
  }
}
