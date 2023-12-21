import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/ds_game_entity.dart';

DsGameEntity $DsGameEntityFromJson(Map<String, dynamic> json) {
  final DsGameEntity dsGameEntity = DsGameEntity();
  final String? imageHost = jsonConvert.convert<String>(json['imageHost']);
  if (imageHost != null) {
    dsGameEntity.imageHost = imageHost;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    dsGameEntity.total = total;
  }
  final int? current = jsonConvert.convert<int>(json['current']);
  if (current != null) {
    dsGameEntity.current = current;
  }
  final int? pages = jsonConvert.convert<int>(json['pages']);
  if (pages != null) {
    dsGameEntity.pages = pages;
  }
  final Map<String, List<DsGameGamesZm>?>? games =
  (json['games'] as Map<String, dynamic>?)?.map(
          (k, e) =>
          MapEntry(k, e == null ? null : (e as List<dynamic>?)
              ?.map(
                  (e) => jsonConvert.convert<DsGameGamesZm>(e) as DsGameGamesZm)
              .toList()));
  if (games != null) {
    dsGameEntity.games = games;
  }
  return dsGameEntity;
}

Map<String, dynamic> $DsGameEntityToJson(DsGameEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['imageHost'] = entity.imageHost;
  data['total'] = entity.total;
  data['current'] = entity.current;
  data['pages'] = entity.pages;
  data['games'] = entity.games;
  return data;
}

extension DsGameEntityExtension on DsGameEntity {
  DsGameEntity copyWith({
    String? imageHost,
    int? total,
    int? current,
    int? pages,
    Map<String, List<DsGameGamesZm>?>? games,
  }) {
    return DsGameEntity()
      ..imageHost = imageHost ?? this.imageHost
      ..total = total ?? this.total
      ..current = current ?? this.current
      ..pages = pages ?? this.pages
      ..games = games ?? this.games;
  }
}

DsGameGamesZm $DsGameGamesZmFromJson(Map<String, dynamic> json) {
  final DsGameGamesZm dsGameGamesZm = DsGameGamesZm();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dsGameGamesZm.id = id;
  }
  final int? platformId = jsonConvert.convert<int>(json['platformId']);
  if (platformId != null) {
    dsGameGamesZm.platformId = platformId;
  }
  final String? platformName = jsonConvert.convert<String>(
      json['platformName']);
  if (platformName != null) {
    dsGameGamesZm.platformName = platformName;
  }
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    dsGameGamesZm.tag = tag;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    dsGameGamesZm.currency = currency;
  }
  final String? gametype = jsonConvert.convert<String>(json['gametype']);
  if (gametype != null) {
    dsGameGamesZm.gametype = gametype;
  }
  final String? gamename = jsonConvert.convert<String>(json['gamename']);
  if (gamename != null) {
    dsGameGamesZm.gamename = gamename;
  }
  final String? gamepic = jsonConvert.convert<String>(json['gamepic']);
  if (gamepic != null) {
    dsGameGamesZm.gamepic = gamepic;
  }
  final String? gameidstr = jsonConvert.convert<String>(json['gameidstr']);
  if (gameidstr != null) {
    dsGameGamesZm.gameidstr = gameidstr;
  }
  final int? gamestatus = jsonConvert.convert<int>(json['gamestatus']);
  if (gamestatus != null) {
    dsGameGamesZm.gamestatus = gamestatus;
  }
  final int? orderby = jsonConvert.convert<int>(json['orderby']);
  if (orderby != null) {
    dsGameGamesZm.orderby = orderby;
  }
  final int? favStatus = jsonConvert.convert<int>(json['favStatus']);
  if (favStatus != null) {
    dsGameGamesZm.favStatus = favStatus;
  }
  return dsGameGamesZm;
}

Map<String, dynamic> $DsGameGamesZmToJson(DsGameGamesZm entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['platformId'] = entity.platformId;
  data['platformName'] = entity.platformName;
  data['tag'] = entity.tag;
  data['currency'] = entity.currency;
  data['gametype'] = entity.gametype;
  data['gamename'] = entity.gamename;
  data['gamepic'] = entity.gamepic;
  data['gameidstr'] = entity.gameidstr;
  data['gamestatus'] = entity.gamestatus;
  data['orderby'] = entity.orderby;
  data['favStatus'] = entity.favStatus;
  return data;
}

extension DsGameGamesZmExtension on DsGameGamesZm {
  DsGameGamesZm copyWith({
    int? id,
    int? platformId,
    String? platformName,
    String? tag,
    String? currency,
    String? gametype,
    String? gamename,
    String? gamepic,
    String? gameidstr,
    int? gamestatus,
    int? orderby,
    int? favStatus,
  }) {
    return DsGameGamesZm()
      ..id = id ?? this.id
      ..platformId = platformId ?? this.platformId
      ..platformName = platformName ?? this.platformName
      ..tag = tag ?? this.tag
      ..currency = currency ?? this.currency
      ..gametype = gametype ?? this.gametype
      ..gamename = gamename ?? this.gamename
      ..gamepic = gamepic ?? this.gamepic
      ..gameidstr = gameidstr ?? this.gameidstr
      ..gamestatus = gamestatus ?? this.gamestatus
      ..orderby = orderby ?? this.orderby
      ..favStatus = favStatus ?? this.favStatus;
  }
}