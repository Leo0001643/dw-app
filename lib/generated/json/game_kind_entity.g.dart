import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';

GameKindEntity $GameKindEntityFromJson(Map<String, dynamic> json) {
  final GameKindEntity gameKindEntity = GameKindEntity();
  final dynamic liveId = json['liveId'];
  if (liveId != null) {
    gameKindEntity.liveId = liveId;
  }
  final dynamic liveName = json['liveName'];
  if (liveName != null) {
    gameKindEntity.liveName = liveName;
  }
  final dynamic currency = json['currency'];
  if (currency != null) {
    gameKindEntity.currency = currency;
  }
  final String? gameKind = jsonConvert.convert<String>(json['gameKind']);
  if (gameKind != null) {
    gameKindEntity.gameKind = gameKind;
  }
  final String? gameKindName = jsonConvert.convert<String>(
      json['gameKindName']);
  if (gameKindName != null) {
    gameKindEntity.gameKindName = gameKindName;
  }
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    gameKindEntity.gameName = gameName;
  }
  final dynamic gameCode = json['gameCode'];
  if (gameCode != null) {
    gameKindEntity.gameCode = gameCode;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    gameKindEntity.imageUrl = imageUrl;
  }
  final dynamic tags = json['tags'];
  if (tags != null) {
    gameKindEntity.tags = tags;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    gameKindEntity.host = host;
  }
  final int? orderby = jsonConvert.convert<int>(json['orderby']);
  if (orderby != null) {
    gameKindEntity.orderby = orderby;
  }
  final int? hot = jsonConvert.convert<int>(json['hot']);
  if (hot != null) {
    gameKindEntity.hot = hot;
  }
  final dynamic advertImage = json['advertImage'];
  if (advertImage != null) {
    gameKindEntity.advertImage = advertImage;
  }
  final List<
      GameKindGameKindList>? gameKindList = (json['gameKindList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GameKindGameKindList>(e) as GameKindGameKindList)
      .toList();
  if (gameKindList != null) {
    gameKindEntity.gameKindList = gameKindList;
  }
  return gameKindEntity;
}

Map<String, dynamic> $GameKindEntityToJson(GameKindEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['liveId'] = entity.liveId;
  data['liveName'] = entity.liveName;
  data['currency'] = entity.currency;
  data['gameKind'] = entity.gameKind;
  data['gameKindName'] = entity.gameKindName;
  data['gameName'] = entity.gameName;
  data['gameCode'] = entity.gameCode;
  data['imageUrl'] = entity.imageUrl;
  data['tags'] = entity.tags;
  data['host'] = entity.host;
  data['orderby'] = entity.orderby;
  data['hot'] = entity.hot;
  data['advertImage'] = entity.advertImage;
  data['gameKindList'] = entity.gameKindList?.map((v) => v.toJson()).toList();
  return data;
}

extension GameKindEntityExtension on GameKindEntity {
  GameKindEntity copyWith({
    dynamic liveId,
    dynamic liveName,
    dynamic currency,
    String? gameKind,
    String? gameKindName,
    String? gameName,
    dynamic gameCode,
    String? imageUrl,
    dynamic tags,
    String? host,
    int? orderby,
    int? hot,
    dynamic advertImage,
    List<GameKindGameKindList>? gameKindList,
  }) {
    return GameKindEntity()
      ..liveId = liveId ?? this.liveId
      ..liveName = liveName ?? this.liveName
      ..currency = currency ?? this.currency
      ..gameKind = gameKind ?? this.gameKind
      ..gameKindName = gameKindName ?? this.gameKindName
      ..gameName = gameName ?? this.gameName
      ..gameCode = gameCode ?? this.gameCode
      ..imageUrl = imageUrl ?? this.imageUrl
      ..tags = tags ?? this.tags
      ..host = host ?? this.host
      ..orderby = orderby ?? this.orderby
      ..hot = hot ?? this.hot
      ..advertImage = advertImage ?? this.advertImage
      ..gameKindList = gameKindList ?? this.gameKindList;
  }
}

GameKindGameKindList $GameKindGameKindListFromJson(Map<String, dynamic> json) {
  final GameKindGameKindList gameKindGameKindList = GameKindGameKindList();
  final int? liveId = jsonConvert.convert<int>(json['liveId']);
  if (liveId != null) {
    gameKindGameKindList.liveId = liveId;
  }
  final String? liveName = jsonConvert.convert<String>(json['liveName']);
  if (liveName != null) {
    gameKindGameKindList.liveName = liveName;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    gameKindGameKindList.currency = currency;
  }
  final String? gameKind = jsonConvert.convert<String>(json['gameKind']);
  if (gameKind != null) {
    gameKindGameKindList.gameKind = gameKind;
  }
  final String? gameKindName = jsonConvert.convert<String>(
      json['gameKindName']);
  if (gameKindName != null) {
    gameKindGameKindList.gameKindName = gameKindName;
  }
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    gameKindGameKindList.gameName = gameName;
  }
  final String? gameCode = jsonConvert.convert<String>(json['gameCode']);
  if (gameCode != null) {
    gameKindGameKindList.gameCode = gameCode;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['imageUrl']);
  if (imageUrl != null) {
    gameKindGameKindList.imageUrl = imageUrl;
  }
  final String? tags = jsonConvert.convert<String>(json['tags']);
  if (tags != null) {
    gameKindGameKindList.tags = tags;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    gameKindGameKindList.host = host;
  }
  final int? orderby = jsonConvert.convert<int>(json['orderby']);
  if (orderby != null) {
    gameKindGameKindList.orderby = orderby;
  }
  final int? hot = jsonConvert.convert<int>(json['hot']);
  if (hot != null) {
    gameKindGameKindList.hot = hot;
  }
  final dynamic advertImage = json['advertImage'];
  if (advertImage != null) {
    gameKindGameKindList.advertImage = advertImage;
  }
  final List<dynamic>? gameKindList = (json['gameKindList'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gameKindList != null) {
    gameKindGameKindList.gameKindList = gameKindList;
  }
  return gameKindGameKindList;
}

Map<String, dynamic> $GameKindGameKindListToJson(GameKindGameKindList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['liveId'] = entity.liveId;
  data['liveName'] = entity.liveName;
  data['currency'] = entity.currency;
  data['gameKind'] = entity.gameKind;
  data['gameKindName'] = entity.gameKindName;
  data['gameName'] = entity.gameName;
  data['gameCode'] = entity.gameCode;
  data['imageUrl'] = entity.imageUrl;
  data['tags'] = entity.tags;
  data['host'] = entity.host;
  data['orderby'] = entity.orderby;
  data['hot'] = entity.hot;
  data['advertImage'] = entity.advertImage;
  data['gameKindList'] = entity.gameKindList;
  return data;
}

extension GameKindGameKindListExtension on GameKindGameKindList {
  GameKindGameKindList copyWith({
    int? liveId,
    String? liveName,
    String? currency,
    String? gameKind,
    String? gameKindName,
    String? gameName,
    String? gameCode,
    String? imageUrl,
    String? tags,
    String? host,
    int? orderby,
    int? hot,
    dynamic advertImage,
    List<dynamic>? gameKindList,
  }) {
    return GameKindGameKindList()
      ..liveId = liveId ?? this.liveId
      ..liveName = liveName ?? this.liveName
      ..currency = currency ?? this.currency
      ..gameKind = gameKind ?? this.gameKind
      ..gameKindName = gameKindName ?? this.gameKindName
      ..gameName = gameName ?? this.gameName
      ..gameCode = gameCode ?? this.gameCode
      ..imageUrl = imageUrl ?? this.imageUrl
      ..tags = tags ?? this.tags
      ..host = host ?? this.host
      ..orderby = orderby ?? this.orderby
      ..hot = hot ?? this.hot
      ..advertImage = advertImage ?? this.advertImage
      ..gameKindList = gameKindList ?? this.gameKindList;
  }
}