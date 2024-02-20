
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/count_down_lottery_entity.g.dart';

@JsonSerializable()
class CountDownLotteryEntity {
  int? time;
  String? term;
  String? title;
  String? type;
  String? subTitile;
  int? titleColor;
  String? status;

  CountDownLotteryEntity({this.time, this.term, this.status});


  factory CountDownLotteryEntity.fromJson(Map<String, dynamic> json) => $CountDownLotteryEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountDownLotteryEntityToJson(this);

}
