
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/ws_bet_result_entity.g.dart';

@JsonSerializable()
class WsBetResultEntity {
  String? moneyType;
  String? nickname;
  String? term;
  String? avatar;
  String? time;
  String? type;
  List<BetContent>? content;
  String? username;
  String? status;

  WsBetResultEntity(
      {this.moneyType,
        this.nickname,
        this.term,
        this.avatar,
        this.time,
        this.type,
        this.content,
        this.username,
        this.status});


  factory WsBetResultEntity.fromJson(Map<String, dynamic> json) => $WsBetResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $WsBetResultEntityToJson(this);



}

@JsonSerializable()
class BetContent {
  String? a;
  String? b;
  String? c;
  String? d;
  String? e;

  BetContent({this.a, this.b, this.c, this.d, this.e});


  factory BetContent.fromJson(Map<String, dynamic> json) => $BetContentFromJson(json);

  Map<String, dynamic> toJson() => $BetContentToJson(this);

}
