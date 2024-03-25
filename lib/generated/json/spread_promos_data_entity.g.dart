import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/spread_promos_data_entity.dart';

SpreadPromosDataEntity $SpreadPromosDataEntityFromJson(
    Map<String, dynamic> json) {
  final SpreadPromosDataEntity spreadPromosDataEntity = SpreadPromosDataEntity();
  final List<SpreadPromosDataList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<SpreadPromosDataList>(e) as SpreadPromosDataList)
      .toList();
  if (list != null) {
    spreadPromosDataEntity.list = list;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    spreadPromosDataEntity.page = page;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    spreadPromosDataEntity.total = total;
  }
  return spreadPromosDataEntity;
}

Map<String, dynamic> $SpreadPromosDataEntityToJson(
    SpreadPromosDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  data['page'] = entity.page;
  data['total'] = entity.total;
  return data;
}

extension SpreadPromosDataEntityExtension on SpreadPromosDataEntity {
  SpreadPromosDataEntity copyWith({
    List<SpreadPromosDataList>? list,
    int? page,
    int? total,
  }) {
    return SpreadPromosDataEntity()
      ..list = list ?? this.list
      ..page = page ?? this.page
      ..total = total ?? this.total;
  }
}

SpreadPromosDataList $SpreadPromosDataListFromJson(Map<String, dynamic> json) {
  final SpreadPromosDataList spreadPromosDataList = SpreadPromosDataList();
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    spreadPromosDataList.addTime = addTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    spreadPromosDataList.id = id;
  }
  final String? saveMoney = jsonConvert.convert<String>(json['saveMoney']);
  if (saveMoney != null) {
    spreadPromosDataList.saveMoney = saveMoney;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    spreadPromosDataList.siteId = siteId;
  }
  final String? spreadPromos = jsonConvert.convert<String>(
      json['spreadPromos']);
  if (spreadPromos != null) {
    spreadPromosDataList.spreadPromos = spreadPromos;
  }
  final String? topUsername = jsonConvert.convert<String>(json['topUsername']);
  if (topUsername != null) {
    spreadPromosDataList.topUsername = topUsername;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    spreadPromosDataList.username = username;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    spreadPromosDataList.currency = currency;
  }
  return spreadPromosDataList;
}

Map<String, dynamic> $SpreadPromosDataListToJson(SpreadPromosDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addTime'] = entity.addTime;
  data['id'] = entity.id;
  data['saveMoney'] = entity.saveMoney;
  data['siteId'] = entity.siteId;
  data['spreadPromos'] = entity.spreadPromos;
  data['topUsername'] = entity.topUsername;
  data['username'] = entity.username;
  data['currency'] = entity.currency;
  return data;
}

extension SpreadPromosDataListExtension on SpreadPromosDataList {
  SpreadPromosDataList copyWith({
    int? addTime,
    int? id,
    String? saveMoney,
    int? siteId,
    String? spreadPromos,
    String? topUsername,
    String? username,
    String? currency,
  }) {
    return SpreadPromosDataList()
      ..addTime = addTime ?? this.addTime
      ..id = id ?? this.id
      ..saveMoney = saveMoney ?? this.saveMoney
      ..siteId = siteId ?? this.siteId
      ..spreadPromos = spreadPromos ?? this.spreadPromos
      ..topUsername = topUsername ?? this.topUsername
      ..username = username ?? this.username
      ..currency = currency ?? this.currency;
  }
}