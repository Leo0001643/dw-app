import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/chess_info_entity.dart';

ChessInfoEntity $ChessInfoEntityFromJson(Map<String, dynamic> json) {
  final ChessInfoEntity chessInfoEntity = ChessInfoEntity();
  final int? platformId = jsonConvert.convert<int>(json['platformId']);
  if (platformId != null) {
    chessInfoEntity.platformId = platformId;
  }
  final String? platformName = jsonConvert.convert<String>(
      json['platformName']);
  if (platformName != null) {
    chessInfoEntity.platformName = platformName;
  }
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    chessInfoEntity.tag = tag;
  }
  final String? gametype = jsonConvert.convert<String>(json['gametype']);
  if (gametype != null) {
    chessInfoEntity.gametype = gametype;
  }
  final String? gamename = jsonConvert.convert<String>(json['gamename']);
  if (gamename != null) {
    chessInfoEntity.gamename = gamename;
  }
  final String? gamepic = jsonConvert.convert<String>(json['gamepic']);
  if (gamepic != null) {
    chessInfoEntity.gamepic = gamepic;
  }
  final String? gameidstr = jsonConvert.convert<String>(json['gameidstr']);
  if (gameidstr != null) {
    chessInfoEntity.gameidstr = gameidstr;
  }
  final int? gamestatus = jsonConvert.convert<int>(json['gamestatus']);
  if (gamestatus != null) {
    chessInfoEntity.gamestatus = gamestatus;
  }
  final dynamic orderby = json['orderby'];
  if (orderby != null) {
    chessInfoEntity.orderby = orderby;
  }
  final String? imageHost = jsonConvert.convert<String>(json['imageHost']);
  if (imageHost != null) {
    chessInfoEntity.imageHost = imageHost;
  }
  return chessInfoEntity;
}

Map<String, dynamic> $ChessInfoEntityToJson(ChessInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['platformId'] = entity.platformId;
  data['platformName'] = entity.platformName;
  data['tag'] = entity.tag;
  data['gametype'] = entity.gametype;
  data['gamename'] = entity.gamename;
  data['gamepic'] = entity.gamepic;
  data['gameidstr'] = entity.gameidstr;
  data['gamestatus'] = entity.gamestatus;
  data['orderby'] = entity.orderby;
  data['imageHost'] = entity.imageHost;
  return data;
}

extension ChessInfoEntityExtension on ChessInfoEntity {
  ChessInfoEntity copyWith({
    int? platformId,
    String? platformName,
    String? tag,
    String? gametype,
    String? gamename,
    String? gamepic,
    String? gameidstr,
    int? gamestatus,
    dynamic orderby,
    String? imageHost,
  }) {
    return ChessInfoEntity()
      ..platformId = platformId ?? this.platformId
      ..platformName = platformName ?? this.platformName
      ..tag = tag ?? this.tag
      ..gametype = gametype ?? this.gametype
      ..gamename = gamename ?? this.gamename
      ..gamepic = gamepic ?? this.gamepic
      ..gameidstr = gameidstr ?? this.gameidstr
      ..gamestatus = gamestatus ?? this.gamestatus
      ..orderby = orderby ?? this.orderby
      ..imageHost = imageHost ?? this.imageHost;
  }
}