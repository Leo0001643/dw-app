import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/dew_info_entity.dart';


DewInfoEntity $DewInfoEntityFromJson(Map<String, dynamic> json) {
  final DewInfoEntity dewInfoEntity = DewInfoEntity();
  final List<String>? longTop = (json['longTop'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (longTop != null) {
    dewInfoEntity.longTop = longTop;
  }
  final List<List<int>>? count = (json['count'] as List<dynamic>?)?.map(
          (e) =>
          (e as List<dynamic>).map(
                  (e) => jsonConvert.convert<int>(e) as int).toList()).toList();
  if (count != null) {
    dewInfoEntity.count = count;
  }
  final List<List<String>>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) =>
          (e as List<dynamic>).map(
                  (e) => jsonConvert.convert<String>(e) as String).toList())
      .toList();
  if (list != null) {
    dewInfoEntity.list = list;
  }
  final List<List<int>>? oneNumCount = (json['oneNumCount'] as List<dynamic>?)
      ?.map(
          (e) =>
          (e as List<dynamic>).map(
                  (e) => jsonConvert.convert<int>(e) as int).toList())
      .toList();
  if (oneNumCount != null) {
    dewInfoEntity.oneNumCount = oneNumCount;
  }
  final List<List<int>>? twoNumCount = (json['twoNumCount'] as List<dynamic>?)
      ?.map(
          (e) =>
          (e as List<dynamic>).map(
                  (e) => jsonConvert.convert<int>(e) as int).toList())
      .toList();
  if (twoNumCount != null) {
    dewInfoEntity.twoNumCount = twoNumCount;
  }
  final List<List<int>>? threeNumCount = (json['threeNumCount'] as List<
      dynamic>?)?.map(
          (e) =>
          (e as List<dynamic>).map(
                  (e) => jsonConvert.convert<int>(e) as int).toList()).toList();
  if (threeNumCount != null) {
    dewInfoEntity.threeNumCount = threeNumCount;
  }
  final List<List<int>>? luckyNumCount = (json['luckyNumCount'] as List<
      dynamic>?)?.map(
          (e) =>
          (e as List<dynamic>).map(
                  (e) => jsonConvert.convert<int>(e) as int).toList()).toList();
  if (luckyNumCount != null) {
    dewInfoEntity.luckyNumCount = luckyNumCount;
  }
  return dewInfoEntity;
}

Map<String, dynamic> $DewInfoEntityToJson(DewInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['longTop'] = entity.longTop;
  data['count'] = entity.count;
  data['list'] = entity.list;
  data['oneNumCount'] = entity.oneNumCount;
  data['twoNumCount'] = entity.twoNumCount;
  data['threeNumCount'] = entity.threeNumCount;
  data['luckyNumCount'] = entity.luckyNumCount;
  return data;
}

extension DewInfoEntityExtension on DewInfoEntity {
  DewInfoEntity copyWith({
    List<String>? longTop,
    List<List<int>>? count,
    List<List<String>>? list,
    List<List<int>>? oneNumCount,
    List<List<int>>? twoNumCount,
    List<List<int>>? threeNumCount,
    List<List<int>>? luckyNumCount,
  }) {
    return DewInfoEntity()
      ..longTop = longTop ?? this.longTop
      ..count = count ?? this.count
      ..list = list ?? this.list
      ..oneNumCount = oneNumCount ?? this.oneNumCount
      ..twoNumCount = twoNumCount ?? this.twoNumCount
      ..threeNumCount = threeNumCount ?? this.threeNumCount
      ..luckyNumCount = luckyNumCount ?? this.luckyNumCount;
  }
}