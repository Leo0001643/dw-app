
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/odds_content.g.dart';

@JsonSerializable()
class OddsContent {
  int? level;
  String? createTime;
  String? enabled;
  String? id;
  String? name;
  String? parentId;
  String? play;
  String? tableId;
  String? type;
  String? updateTime;
  bool? check=false;
  double? money;
  String? play2;
  String? showName;
  String? sendType;
  int? color=0xFF091722;
  int? titleColor=0xFF091722;
  // Map<String,String>? contentMap;
  OddsContent(
      {this.createTime,
        this.enabled,
        this.id,
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
        this.updateTime,
      this.showName,
      this.sendType,
      });

  factory OddsContent.fromJson(Map<String, dynamic> json) => $OddsContentFromJson(json);

  Map<String, dynamic> toJson() => $OddsContentToJson(this);



}
