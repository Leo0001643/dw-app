
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/generated/json/ws_msg_get_pic_entity.g.dart';

@JsonSerializable()
class WsMsgGetPicEntity {
  List<String>? msg;
  String? uniqueId;
  String? nickname;
  String? siteId;
  String? avatar;
  int? time;
  String? type;
  String? tableId;
  String? username;
  int? status;

  WsMsgGetPicEntity(
      {this.msg,
        this.uniqueId,
        this.nickname,
        this.siteId,
        this.avatar,
        this.time,
        this.type,
        this.tableId,
        this.username,
        this.status});

  factory WsMsgGetPicEntity.fromJson(Map<String, dynamic> json) => $WsMsgGetPicEntityFromJson(json);

  Map<String, dynamic> toJson() => $WsMsgGetPicEntityToJson(this);


}
