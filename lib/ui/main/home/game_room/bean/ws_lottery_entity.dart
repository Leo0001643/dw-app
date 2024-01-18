class WSLotteryEntity {
  List<WSLotteryEntityData>? data;
  int? time;
  String? type;
  String? status;

  WSLotteryEntity({this.data, this.time, this.type, this.status});

  WSLotteryEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WSLotteryEntityData>[];
      json['data'].forEach((v) {
        data!.add(new WSLotteryEntityData.fromJson(v));
      });
    }
    time = json['time'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['time'] = this.time;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}

class WSLotteryEntityData {
  String?   originalNum;
  String? gameType;
  String? billCount;
  String? closeTime;
  String? term;
  String? state;
  String? openTime;
  String? luckyNum;

  WSLotteryEntityData(
      {this.originalNum,
        this.gameType,
        this.billCount,
        this.closeTime,
        this.term,
        this.state,
        this.openTime,
        this.luckyNum});

  WSLotteryEntityData.fromJson(Map<String, dynamic> json) {
    originalNum = "${json['originalNum']}";
    gameType = "${json['gameType']}";
    billCount = "${json['billCount']}";
    closeTime = "${json['closeTime']}";
    term ="${json['term']}";
    state = "${json['state']}";
    openTime = "${json['openTime']}";
    luckyNum ="${json['luckyNum']}";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['originalNum'] = this.originalNum;
    data['gameType'] = this.gameType;
    data['billCount'] = this.billCount;
    data['closeTime'] = this.closeTime;
    data['term'] = this.term;
    data['state'] = this.state;
    data['openTime'] = this.openTime;
    data['luckyNum'] = this.luckyNum;
    return data;
  }
}
