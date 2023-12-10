import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/btc_source_entity.dart';
import 'package:leisure_games/app/global.dart';

import 'package:leisure_games/app/utils/data_utils.dart';


BtcSourceEntity $BtcSourceEntityFromJson(Map<String, dynamic> json) {
  final BtcSourceEntity btcSourceEntity = BtcSourceEntity();
  final String? originalNum = jsonConvert.convert<String>(json['originalNum']);
  if (originalNum != null) {
    btcSourceEntity.originalNum = originalNum;
  }
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    btcSourceEntity.gameType = gameType;
  }
  final String? btcHash = jsonConvert.convert<String>(json['btcHash']);
  if (btcHash != null) {
    btcSourceEntity.btcHash = btcHash;
  }
  final int? billCount = jsonConvert.convert<int>(json['billCount']);
  if (billCount != null) {
    btcSourceEntity.billCount = billCount;
  }
  final int? closeTime = jsonConvert.convert<int>(json['closeTime']);
  if (closeTime != null) {
    btcSourceEntity.closeTime = closeTime;
  }
  final int? term = jsonConvert.convert<int>(json['term']);
  if (term != null) {
    btcSourceEntity.term = term;
  }
  final int? realOpenTime = jsonConvert.convert<int>(json['realOpenTime']);
  if (realOpenTime != null) {
    btcSourceEntity.realOpenTime = realOpenTime;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    btcSourceEntity.state = state;
  }
  final int? openTime = jsonConvert.convert<int>(json['openTime']);
  if (openTime != null) {
    btcSourceEntity.openTime = openTime;
  }
  final String? luckyNum = jsonConvert.convert<String>(json['luckyNum']);
  if (luckyNum != null) {
    btcSourceEntity.luckyNum = luckyNum;
  }
  return btcSourceEntity;
}

Map<String, dynamic> $BtcSourceEntityToJson(BtcSourceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['originalNum'] = entity.originalNum;
  data['gameType'] = entity.gameType;
  data['btcHash'] = entity.btcHash;
  data['billCount'] = entity.billCount;
  data['closeTime'] = entity.closeTime;
  data['term'] = entity.term;
  data['realOpenTime'] = entity.realOpenTime;
  data['state'] = entity.state;
  data['openTime'] = entity.openTime;
  data['luckyNum'] = entity.luckyNum;
  return data;
}

extension BtcSourceEntityExtension on BtcSourceEntity {
  BtcSourceEntity copyWith({
    String? originalNum,
    String? gameType,
    String? btcHash,
    int? billCount,
    int? closeTime,
    int? term,
    int? realOpenTime,
    int? state,
    int? openTime,
    String? luckyNum,
  }) {
    return BtcSourceEntity()
      ..originalNum = originalNum ?? this.originalNum
      ..gameType = gameType ?? this.gameType
      ..btcHash = btcHash ?? this.btcHash
      ..billCount = billCount ?? this.billCount
      ..closeTime = closeTime ?? this.closeTime
      ..term = term ?? this.term
      ..realOpenTime = realOpenTime ?? this.realOpenTime
      ..state = state ?? this.state
      ..openTime = openTime ?? this.openTime
      ..luckyNum = luckyNum ?? this.luckyNum;
  }
}