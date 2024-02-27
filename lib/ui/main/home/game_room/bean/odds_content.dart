
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/odds_content.g.dart';

@JsonSerializable()
class OddsContent {
  int? level;
  String? createTime;
  String? enabled;
  String? id;
  String? jsonKey;
  String? name;
  String? parentId;
  String? play;
  String? tableId;
  String? type;
  String? updateTime;
  bool? check=false;
  double? money;
  String? play2;
  int? color=0xFF091722;
  int? titleColor=0xFF091722;
  // Map<String,String>? contentMap;
  OddsContent(
      {this.createTime,
        this.enabled,
        this.id,
        this.jsonKey,
        this.name,
        this.parentId,
        this.play,
        this.play2,
        this.tableId,
        this.type,
        this.check,
        this.money,
        this.level,
        this.color,
        this.titleColor,
        this.updateTime});

  factory OddsContent.fromJson(Map<String, dynamic> json) => $OddsContentFromJson(json);

  Map<String, dynamic> toJson() => $OddsContentToJson(this);



}
