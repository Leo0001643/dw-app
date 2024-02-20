
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/ws_game_odds_server.g.dart';

@JsonSerializable()
class WSGameOddsServer {
  List<OddsContent>? content;

  WSGameOddsServer({this.content});


  factory WSGameOddsServer.fromJson(Map<String, dynamic> json) => $WSGameOddsServerFromJson(json);

  Map<String, dynamic> toJson() => $WSGameOddsServerToJson(this);

}

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
  double? money ;
  int? color=0xFF091722;
  int? titleColor=0xFF091722;
  Map<String,String> contentMap={};
  OddsContent(
      {this.createTime,
        this.enabled,
        this.id,
        this.jsonKey,
        this.name,
        this.parentId,
        this.play,
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
