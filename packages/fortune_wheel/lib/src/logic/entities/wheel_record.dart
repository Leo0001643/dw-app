

class WheelRecordEntity {
  int? limit;
  int? page;
  int? total;
  List<WheelRecord>? items;

  WheelRecordEntity({this.limit, this.page, this.total, this.items});

  WheelRecordEntity.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    page = json['page'];
    total = json['total'];
    if (json['items'] != null) {
      items = <WheelRecord>[];
      json['items'].forEach((v) {
        items!.add(WheelRecord.fromJson(v));
      });
    }
  }
  
}

class WheelRecord {
  String? round;
  int? time;
  int? rewardId;
  String? rewardName;
  String? rewardAmount;
  String? ordernumber;
  int? itemType;

  WheelRecord(
      {this.round,
        this.time,
        this.rewardId,
        this.rewardName,
        this.rewardAmount,
        this.ordernumber,
        this.itemType});

  WheelRecord.fromJson(Map<String, dynamic> json) {
    round = json['round'];
    time = json['time'];
    rewardId = json['reward_id'];
    rewardName = json['reward_name'];
    rewardAmount = json['reward_amount'];
    ordernumber = json['ordernumber'];
    itemType = json['item_type'];
  }
}
