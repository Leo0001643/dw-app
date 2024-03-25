import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bet_detail_item_child_entity.dart';
import 'package:json_annotation/json_annotation.dart';


BetDetailItemChildEntity $BetDetailItemChildEntityFromJson(
    Map<String, dynamic> json) {
  final BetDetailItemChildEntity betDetailItemChildEntity = BetDetailItemChildEntity();
  final List<Record>? record = (json['record'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Record>(e) as Record).toList();
  if (record != null) {
    betDetailItemChildEntity.record = record;
  }
  final Total? total = jsonConvert.convert<Total>(json['total']);
  if (total != null) {
    betDetailItemChildEntity.total = total;
  }
  return betDetailItemChildEntity;
}

Map<String, dynamic> $BetDetailItemChildEntityToJson(
    BetDetailItemChildEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  data['total'] = entity.total?.toJson();
  return data;
}

extension BetDetailItemChildEntityExtension on BetDetailItemChildEntity {
  BetDetailItemChildEntity copyWith({
    List<Record>? record,
    Total? total,
  }) {
    return BetDetailItemChildEntity()
      ..record = record ?? this.record
      ..total = total ?? this.total;
  }
}

Record $RecordFromJson(Map<String, dynamic> json) {
  final Record record = Record();
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    record.siteId = siteId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    record.username = username;
  }
  final String? tableId = jsonConvert.convert<String>(json['tableId']);
  if (tableId != null) {
    record.tableId = tableId;
  }
  final String? betamount = jsonConvert.convert<String>(json['betamount']);
  if (betamount != null) {
    record.betamount = betamount;
  }
  final String? validamount = jsonConvert.convert<String>(json['validamount']);
  if (validamount != null) {
    record.validamount = validamount;
  }
  final double? winlose = jsonConvert.convert<double>(json['winlose']);
  if (winlose != null) {
    record.winlose = winlose;
  }
  final int? betTime = jsonConvert.convert<int>(json['betTime']);
  if (betTime != null) {
    record.betTime = betTime;
  }
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    record.gameType = gameType;
  }
  final String? gameName = jsonConvert.convert<String>(json['gameName']);
  if (gameName != null) {
    record.gameName = gameName;
  }
  final String? billNo = jsonConvert.convert<String>(json['billNo']);
  if (billNo != null) {
    record.billNo = billNo;
  }
  final String? qishu = jsonConvert.convert<String>(json['qishu']);
  if (qishu != null) {
    record.qishu = qishu;
  }
  final String? odds = jsonConvert.convert<String>(json['odds']);
  if (odds != null) {
    record.odds = odds;
  }
  final String? odds2 = jsonConvert.convert<String>(json['odds2']);
  if (odds2 != null) {
    record.odds2 = odds2;
  }
  final String? txt1 = jsonConvert.convert<String>(json['txt1']);
  if (txt1 != null) {
    record.txt1 = txt1;
  }
  return record;
}

Map<String, dynamic> $RecordToJson(Record entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['siteId'] = entity.siteId;
  data['username'] = entity.username;
  data['tableId'] = entity.tableId;
  data['betamount'] = entity.betamount;
  data['validamount'] = entity.validamount;
  data['winlose'] = entity.winlose;
  data['betTime'] = entity.betTime;
  data['gameType'] = entity.gameType;
  data['gameName'] = entity.gameName;
  data['billNo'] = entity.billNo;
  data['qishu'] = entity.qishu;
  data['odds'] = entity.odds;
  data['odds2'] = entity.odds2;
  data['txt1'] = entity.txt1;
  return data;
}

extension RecordExtension on Record {
  Record copyWith({
    int? siteId,
    String? username,
    String? tableId,
    String? betamount,
    String? validamount,
    double? winlose,
    int? betTime,
    String? gameType,
    String? gameName,
    String? billNo,
    String? qishu,
    String? odds,
    String? odds2,
    String? txt1,
  }) {
    return Record()
      ..siteId = siteId ?? this.siteId
      ..username = username ?? this.username
      ..tableId = tableId ?? this.tableId
      ..betamount = betamount ?? this.betamount
      ..validamount = validamount ?? this.validamount
      ..winlose = winlose ?? this.winlose
      ..betTime = betTime ?? this.betTime
      ..gameType = gameType ?? this.gameType
      ..gameName = gameName ?? this.gameName
      ..billNo = billNo ?? this.billNo
      ..qishu = qishu ?? this.qishu
      ..odds = odds ?? this.odds
      ..odds2 = odds2 ?? this.odds2
      ..txt1 = txt1 ?? this.txt1;
  }
}

Total $TotalFromJson(Map<String, dynamic> json) {
  final Total total = Total();
  final double? betAmountTotal = jsonConvert.convert<double>(
      json['betAmountTotal']);
  if (betAmountTotal != null) {
    total.betAmountTotal = betAmountTotal;
  }
  final double? validAmountTotal = jsonConvert.convert<double>(
      json['validAmountTotal']);
  if (validAmountTotal != null) {
    total.validAmountTotal = validAmountTotal;
  }
  final double? winloseTotal = jsonConvert.convert<double>(
      json['winloseTotal']);
  if (winloseTotal != null) {
    total.winloseTotal = winloseTotal;
  }
  final int? betCountTotal = jsonConvert.convert<int>(json['betCountTotal']);
  if (betCountTotal != null) {
    total.betCountTotal = betCountTotal;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    total.currency = currency;
  }
  return total;
}

Map<String, dynamic> $TotalToJson(Total entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betAmountTotal'] = entity.betAmountTotal;
  data['validAmountTotal'] = entity.validAmountTotal;
  data['winloseTotal'] = entity.winloseTotal;
  data['betCountTotal'] = entity.betCountTotal;
  data['currency'] = entity.currency;
  return data;
}

extension TotalExtension on Total {
  Total copyWith({
    double? betAmountTotal,
    double? validAmountTotal,
    double? winloseTotal,
    int? betCountTotal,
    String? currency,
  }) {
    return Total()
      ..betAmountTotal = betAmountTotal ?? this.betAmountTotal
      ..validAmountTotal = validAmountTotal ?? this.validAmountTotal
      ..winloseTotal = winloseTotal ?? this.winloseTotal
      ..betCountTotal = betCountTotal ?? this.betCountTotal
      ..currency = currency ?? this.currency;
  }
}