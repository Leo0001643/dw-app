import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/act_status_entity.dart';

ActStatusEntity $ActStatusEntityFromJson(Map<String, dynamic> json) {
  final ActStatusEntity actStatusEntity = ActStatusEntity();
  final int? cTime = jsonConvert.convert<int>(json['cTime']);
  if (cTime != null) {
    actStatusEntity.cTime = cTime;
  }
  final Map<String?, ActStatusList?>? list =
  (json['list'] as Map<String, dynamic>?)?.map(
          (k, e) =>
          MapEntry(
              k, e == null ? null : jsonConvert.convert<ActStatusList>(e)));
  if (list != null) {
    actStatusEntity.list = list;
  }
  return actStatusEntity;
}

Map<String, dynamic> $ActStatusEntityToJson(ActStatusEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cTime'] = entity.cTime;
  data['list'] = entity.list;
  return data;
}

extension ActStatusEntityExtension on ActStatusEntity {
  ActStatusEntity copyWith({
    int? cTime,
    Map<String?, ActStatusList?>? list,
  }) {
    return ActStatusEntity()
      ..cTime = cTime ?? this.cTime
      ..list = list ?? this.list;
  }
}

ActStatusList $ActStatusListFromJson(Map<String, dynamic> json) {
  final ActStatusList actStatusList = ActStatusList();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    actStatusList.code = code;
  }
  final int? endTime = jsonConvert.convert<int>(json['endTime']);
  if (endTime != null) {
    actStatusList.endTime = endTime;
  }
  final int? expireDay = jsonConvert.convert<int>(json['expireDay']);
  if (expireDay != null) {
    actStatusList.expireDay = expireDay;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    actStatusList.name = name;
  }
  final int? picEndTime = jsonConvert.convert<int>(json['picEndTime']);
  if (picEndTime != null) {
    actStatusList.picEndTime = picEndTime;
  }
  final int? picStartTime = jsonConvert.convert<int>(json['picStartTime']);
  if (picStartTime != null) {
    actStatusList.picStartTime = picStartTime;
  }
  final int? startTime = jsonConvert.convert<int>(json['startTime']);
  if (startTime != null) {
    actStatusList.startTime = startTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    actStatusList.status = status;
  }
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    actStatusList.tag = tag;
  }
  final String? ulevel = jsonConvert.convert<String>(json['ulevel']);
  if (ulevel != null) {
    actStatusList.ulevel = ulevel;
  }
  return actStatusList;
}

Map<String, dynamic> $ActStatusListToJson(ActStatusList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['endTime'] = entity.endTime;
  data['expireDay'] = entity.expireDay;
  data['name'] = entity.name;
  data['picEndTime'] = entity.picEndTime;
  data['picStartTime'] = entity.picStartTime;
  data['startTime'] = entity.startTime;
  data['status'] = entity.status;
  data['tag'] = entity.tag;
  data['ulevel'] = entity.ulevel;
  return data;
}

extension ActStatusListExtension on ActStatusList {
  ActStatusList copyWith({
    int? code,
    int? endTime,
    int? expireDay,
    String? name,
    int? picEndTime,
    int? picStartTime,
    int? startTime,
    int? status,
    String? tag,
    String? ulevel,
  }) {
    return ActStatusList()
      ..code = code ?? this.code
      ..endTime = endTime ?? this.endTime
      ..expireDay = expireDay ?? this.expireDay
      ..name = name ?? this.name
      ..picEndTime = picEndTime ?? this.picEndTime
      ..picStartTime = picStartTime ?? this.picStartTime
      ..startTime = startTime ?? this.startTime
      ..status = status ?? this.status
      ..tag = tag ?? this.tag
      ..ulevel = ulevel ?? this.ulevel;
  }
}