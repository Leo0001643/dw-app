
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/ws_lottery_entity.g.dart';

@JsonSerializable()
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

@JsonSerializable()
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


  factory WSLotteryEntityData.fromJson(Map<String, dynamic> json) => $WSLotteryEntityDataFromJson(json);

  Map<String, dynamic> toJson() => $WSLotteryEntityDataToJson(this);



}
