import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/pc28_plan_entity.dart';

Pc28PlanEntity $Pc28PlanEntityFromJson(Map<String, dynamic> json) {
  final Pc28PlanEntity pc28PlanEntity = Pc28PlanEntity();
  final Pc28PlanAll? all = jsonConvert.convert<Pc28PlanAll>(json['all']);
  if (all != null) {
    pc28PlanEntity.all = all;
  }
  final int? refreshTime = jsonConvert.convert<int>(json['refreshTime']);
  if (refreshTime != null) {
    pc28PlanEntity.refreshTime = refreshTime;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    pc28PlanEntity.timestamp = timestamp;
  }
  return pc28PlanEntity;
}

Map<String, dynamic> $Pc28PlanEntityToJson(Pc28PlanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['all'] = entity.all?.toJson();
  data['refreshTime'] = entity.refreshTime;
  data['timestamp'] = entity.timestamp;
  return data;
}

extension Pc28PlanEntityExtension on Pc28PlanEntity {
  Pc28PlanEntity copyWith({
    Pc28PlanAll? all,
    int? refreshTime,
    int? timestamp,
  }) {
    return Pc28PlanEntity()
      ..all = all ?? this.all
      ..refreshTime = refreshTime ?? this.refreshTime
      ..timestamp = timestamp ?? this.timestamp;
  }
}

Pc28PlanAll $Pc28PlanAllFromJson(Map<String, dynamic> json) {
  final Pc28PlanAll pc28PlanAll = Pc28PlanAll();
  final Pc28PlanAllJndx28? jndx28 = jsonConvert.convert<Pc28PlanAllJndx28>(
      json['jndx28']);
  if (jndx28 != null) {
    pc28PlanAll.jndx28 = jndx28;
  }
  final Pc28PlanAllJndx28? keno28 = jsonConvert.convert<Pc28PlanAllJndx28>(
      json['keno28']);
  if (keno28 != null) {
    pc28PlanAll.keno28 = keno28;
  }
  final Pc28PlanAllJndx28? fastbtb28 = jsonConvert.convert<Pc28PlanAllJndx28>(
      json['fastbtb28']);
  if (fastbtb28 != null) {
    pc28PlanAll.fastbtb28 = fastbtb28;
  }
  final Pc28PlanAllJndx28? tw28 = jsonConvert.convert<Pc28PlanAllJndx28>(
      json['tw28']);
  if (tw28 != null) {
    pc28PlanAll.tw28 = tw28;
  }
  return pc28PlanAll;
}

Map<String, dynamic> $Pc28PlanAllToJson(Pc28PlanAll entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['jndx28'] = entity.jndx28?.toJson();
  data['keno28'] = entity.keno28?.toJson();
  data['fastbtb28'] = entity.fastbtb28?.toJson();
  data['tw28'] = entity.tw28?.toJson();
  return data;
}

extension Pc28PlanAllExtension on Pc28PlanAll {
  Pc28PlanAll copyWith({
    Pc28PlanAllJndx28? jndx28,
    Pc28PlanAllJndx28? keno28,
    Pc28PlanAllJndx28? fastbtb28,
    Pc28PlanAllJndx28? tw28,
  }) {
    return Pc28PlanAll()
      ..jndx28 = jndx28 ?? this.jndx28
      ..keno28 = keno28 ?? this.keno28
      ..fastbtb28 = fastbtb28 ?? this.fastbtb28
      ..tw28 = tw28 ?? this.tw28;
  }
}

Pc28PlanAllJndx28 $Pc28PlanAllJndx28FromJson(Map<String, dynamic> json) {
  final Pc28PlanAllJndx28 pc28PlanAllJndx28 = Pc28PlanAllJndx28();
  final List<Pc28PlanAllJndx28Data>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<Pc28PlanAllJndx28Data>(e) as Pc28PlanAllJndx28Data)
      .toList();
  if (data != null) {
    pc28PlanAllJndx28.data = data;
  }
  final int? refreshTime = jsonConvert.convert<int>(json['refreshTime']);
  if (refreshTime != null) {
    pc28PlanAllJndx28.refreshTime = refreshTime;
  }
  return pc28PlanAllJndx28;
}

Map<String, dynamic> $Pc28PlanAllJndx28ToJson(Pc28PlanAllJndx28 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['refreshTime'] = entity.refreshTime;
  return data;
}

extension Pc28PlanAllJndx28Extension on Pc28PlanAllJndx28 {
  Pc28PlanAllJndx28 copyWith({
    List<Pc28PlanAllJndx28Data>? data,
    int? refreshTime,
  }) {
    return Pc28PlanAllJndx28()
      ..data = data ?? this.data
      ..refreshTime = refreshTime ?? this.refreshTime;
  }
}

Pc28PlanAllJndx28Data $Pc28PlanAllJndx28DataFromJson(
    Map<String, dynamic> json) {
  final Pc28PlanAllJndx28Data pc28PlanAllJndx28Data = Pc28PlanAllJndx28Data();
  final int? closeTime = jsonConvert.convert<int>(json['closeTime']);
  if (closeTime != null) {
    pc28PlanAllJndx28Data.closeTime = closeTime;
  }
  final int? term = jsonConvert.convert<int>(json['term']);
  if (term != null) {
    pc28PlanAllJndx28Data.term = term;
  }
  final int? openTime = jsonConvert.convert<int>(json['openTime']);
  if (openTime != null) {
    pc28PlanAllJndx28Data.openTime = openTime;
  }
  return pc28PlanAllJndx28Data;
}

Map<String, dynamic> $Pc28PlanAllJndx28DataToJson(
    Pc28PlanAllJndx28Data entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['closeTime'] = entity.closeTime;
  data['term'] = entity.term;
  data['openTime'] = entity.openTime;
  return data;
}

extension Pc28PlanAllJndx28DataExtension on Pc28PlanAllJndx28Data {
  Pc28PlanAllJndx28Data copyWith({
    int? closeTime,
    int? term,
    int? openTime,
  }) {
    return Pc28PlanAllJndx28Data()
      ..closeTime = closeTime ?? this.closeTime
      ..term = term ?? this.term
      ..openTime = openTime ?? this.openTime;
  }
}