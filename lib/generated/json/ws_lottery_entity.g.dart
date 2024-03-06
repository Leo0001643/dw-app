import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/app/socket/ws_lottery_entity.dart';
import 'package:json_annotation/json_annotation.dart';


WSLotteryEntity $WSLotteryEntityFromJson(Map<String, dynamic> json) {
  final WSLotteryEntity wSLotteryEntity = WSLotteryEntity();
  final List<WSLotteryEntityData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<WSLotteryEntityData>(e) as WSLotteryEntityData)
      .toList();
  if (data != null) {
    wSLotteryEntity.data = data;
  }
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    wSLotteryEntity.time = time;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wSLotteryEntity.type = type;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    wSLotteryEntity.status = status;
  }
  return wSLotteryEntity;
}

Map<String, dynamic> $WSLotteryEntityToJson(WSLotteryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['time'] = entity.time;
  data['type'] = entity.type;
  data['status'] = entity.status;
  return data;
}

extension WSLotteryEntityExtension on WSLotteryEntity {
  WSLotteryEntity copyWith({
    List<WSLotteryEntityData>? data,
    int? time,
    String? type,
    String? status,
  }) {
    return WSLotteryEntity()
      ..data = data ?? this.data
      ..time = time ?? this.time
      ..type = type ?? this.type
      ..status = status ?? this.status;
  }
}

WSLotteryEntityData $WSLotteryEntityDataFromJson(Map<String, dynamic> json) {
  final WSLotteryEntityData wSLotteryEntityData = WSLotteryEntityData();
  final String? originalNum = jsonConvert.convert<String>(json['originalNum']);
  if (originalNum != null) {
    wSLotteryEntityData.originalNum = originalNum;
  }
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    wSLotteryEntityData.gameType = gameType;
  }
  final String? billCount = jsonConvert.convert<String>(json['billCount']);
  if (billCount != null) {
    wSLotteryEntityData.billCount = billCount;
  }
  final String? closeTime = jsonConvert.convert<String>(json['closeTime']);
  if (closeTime != null) {
    wSLotteryEntityData.closeTime = closeTime;
  }
  final String? term = jsonConvert.convert<String>(json['term']);
  if (term != null) {
    wSLotteryEntityData.term = term;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    wSLotteryEntityData.state = state;
  }
  final String? openTime = jsonConvert.convert<String>(json['openTime']);
  if (openTime != null) {
    wSLotteryEntityData.openTime = openTime;
  }
  final String? luckyNum = jsonConvert.convert<String>(json['luckyNum']);
  if (luckyNum != null) {
    wSLotteryEntityData.luckyNum = luckyNum;
  }
  return wSLotteryEntityData;
}

Map<String, dynamic> $WSLotteryEntityDataToJson(WSLotteryEntityData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['originalNum'] = entity.originalNum;
  data['gameType'] = entity.gameType;
  data['billCount'] = entity.billCount;
  data['closeTime'] = entity.closeTime;
  data['term'] = entity.term;
  data['state'] = entity.state;
  data['openTime'] = entity.openTime;
  data['luckyNum'] = entity.luckyNum;
  return data;
}

extension WSLotteryEntityDataExtension on WSLotteryEntityData {
  WSLotteryEntityData copyWith({
    String? originalNum,
    String? gameType,
    String? billCount,
    String? closeTime,
    String? term,
    String? state,
    String? openTime,
    String? luckyNum,
  }) {
    return WSLotteryEntityData()
      ..originalNum = originalNum ?? this.originalNum
      ..gameType = gameType ?? this.gameType
      ..billCount = billCount ?? this.billCount
      ..closeTime = closeTime ?? this.closeTime
      ..term = term ?? this.term
      ..state = state ?? this.state
      ..openTime = openTime ?? this.openTime
      ..luckyNum = luckyNum ?? this.luckyNum;
  }
}