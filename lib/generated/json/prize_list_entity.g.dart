import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/prize_list_entity.dart';


PrizeListEntity $PrizeListEntityFromJson(Map<String, dynamic> json) {
  final PrizeListEntity prizeListEntity = PrizeListEntity();
  final List<PrizeListPrizes>? prizes = (json['prizes'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PrizeListPrizes>(e) as PrizeListPrizes)
      .toList();
  if (prizes != null) {
    prizeListEntity.prizes = prizes;
  }
  final List<PrizeListPrizes>? redPackets = (json['redPackets'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PrizeListPrizes>(e) as PrizeListPrizes)
      .toList();
  if (redPackets != null) {
    prizeListEntity.redPackets = redPackets;
  }
  return prizeListEntity;
}

Map<String, dynamic> $PrizeListEntityToJson(PrizeListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['prizes'] = entity.prizes?.map((v) => v.toJson()).toList();
  data['redPackets'] = entity.redPackets?.map((v) => v.toJson()).toList();
  return data;
}

extension PrizeListEntityExtension on PrizeListEntity {
  PrizeListEntity copyWith({
    List<PrizeListPrizes>? prizes,
    List<PrizeListPrizes>? redPackets,
  }) {
    return PrizeListEntity()
      ..prizes = prizes ?? this.prizes
      ..redPackets = redPackets ?? this.redPackets;
  }
}

PrizeListPrizes $PrizeListPrizesFromJson(Map<String, dynamic> json) {
  final PrizeListPrizes prizeListPrizes = PrizeListPrizes();
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    prizeListPrizes.addTime = addTime;
  }
  final double? bonusMoney = jsonConvert.convert<double>(json['bonusMoney']);
  if (bonusMoney != null) {
    prizeListPrizes.bonusMoney = bonusMoney;
  }
  final double? bonusMoneyCode = jsonConvert.convert<double>(
      json['bonusMoneyCode']);
  if (bonusMoneyCode != null) {
    prizeListPrizes.bonusMoneyCode = bonusMoneyCode;
  }
  final int? endTime = jsonConvert.convert<int>(json['endTime']);
  if (endTime != null) {
    prizeListPrizes.endTime = endTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    prizeListPrizes.id = id;
  }
  final String? marks = jsonConvert.convert<String>(json['marks']);
  if (marks != null) {
    prizeListPrizes.marks = marks;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    prizeListPrizes.siteId = siteId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    prizeListPrizes.status = status;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    prizeListPrizes.username = username;
  }
  return prizeListPrizes;
}

Map<String, dynamic> $PrizeListPrizesToJson(PrizeListPrizes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addTime'] = entity.addTime;
  data['bonusMoney'] = entity.bonusMoney;
  data['bonusMoneyCode'] = entity.bonusMoneyCode;
  data['endTime'] = entity.endTime;
  data['id'] = entity.id;
  data['marks'] = entity.marks;
  data['siteId'] = entity.siteId;
  data['status'] = entity.status;
  data['username'] = entity.username;
  return data;
}

extension PrizeListPrizesExtension on PrizeListPrizes {
  PrizeListPrizes copyWith({
    int? addTime,
    double? bonusMoney,
    double? bonusMoneyCode,
    int? endTime,
    int? id,
    String? marks,
    int? siteId,
    int? status,
    String? username,
  }) {
    return PrizeListPrizes()
      ..addTime = addTime ?? this.addTime
      ..bonusMoney = bonusMoney ?? this.bonusMoney
      ..bonusMoneyCode = bonusMoneyCode ?? this.bonusMoneyCode
      ..endTime = endTime ?? this.endTime
      ..id = id ?? this.id
      ..marks = marks ?? this.marks
      ..siteId = siteId ?? this.siteId
      ..status = status ?? this.status
      ..username = username ?? this.username;
  }
}