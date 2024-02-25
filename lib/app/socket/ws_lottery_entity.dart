
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/ws_lottery_entity.g.dart';

@JsonSerializable()
class WSLotteryEntity {
  List<WSLotteryEntityData>? data;
  int? time;
  String? type;
  String? status;

  WSLotteryEntity({this.data, this.time, this.type, this.status});

  factory WSLotteryEntity.fromJson(Map<String, dynamic> json) => $WSLotteryEntityFromJson(json);

  Map<String, dynamic> toJson() => $WSLotteryEntityToJson(this);


}

@JsonSerializable()
class WSLotteryEntityData {
  String? originalNum;
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
