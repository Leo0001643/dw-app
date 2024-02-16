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
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    record.username = username;
  }
  final num? betamount = jsonConvert.convert<num>(json['betamount']);
  if (betamount != null) {
    record.betamount = betamount;
  }
  final num? validamount = jsonConvert.convert<num>(json['validamount']);
  if (validamount != null) {
    record.validamount = validamount;
  }
  final num? winlose = jsonConvert.convert<num>(json['winlose']);
  if (winlose != null) {
    record.winlose = winlose;
  }
  final String? betTime = jsonConvert.convert<String>(json['betTime']);
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
  final String? item = jsonConvert.convert<String>(json['item']);
  if (item != null) {
    record.item = item;
  }
  final String? play = jsonConvert.convert<String>(json['play']);
  if (play != null) {
    record.play = play;
  }
  final String? odds = jsonConvert.convert<String>(json['odds']);
  if (odds != null) {
    record.odds = odds;
  }
  final String? txt1 = jsonConvert.convert<String>(json['txt1']);
  if (txt1 != null) {
    record.txt1 = txt1;
  }
  final String? txt2 = jsonConvert.convert<String>(json['txt2']);
  if (txt2 != null) {
    record.txt2 = txt2;
  }
  return record;
}

Map<String, dynamic> $RecordToJson(Record entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['username'] = entity.username;
  data['betamount'] = entity.betamount;
  data['validamount'] = entity.validamount;
  data['winlose'] = entity.winlose;
  data['betTime'] = entity.betTime;
  data['gameType'] = entity.gameType;
  data['gameName'] = entity.gameName;
  data['billNo'] = entity.billNo;
  data['qishu'] = entity.qishu;
  data['item'] = entity.item;
  data['play'] = entity.play;
  data['odds'] = entity.odds;
  data['txt1'] = entity.txt1;
  data['txt2'] = entity.txt2;
  return data;
}

extension RecordExtension on Record {
  Record copyWith({
    String? username,
    num? betamount,
    num? validamount,
    num? winlose,
    String? betTime,
    String? gameType,
    String? gameName,
    String? billNo,
    String? qishu,
    String? item,
    String? play,
    String? odds,
    String? txt1,
    String? txt2,
  }) {
    return Record()
      ..username = username ?? this.username
      ..betamount = betamount ?? this.betamount
      ..validamount = validamount ?? this.validamount
      ..winlose = winlose ?? this.winlose
      ..betTime = betTime ?? this.betTime
      ..gameType = gameType ?? this.gameType
      ..gameName = gameName ?? this.gameName
      ..billNo = billNo ?? this.billNo
      ..qishu = qishu ?? this.qishu
      ..item = item ?? this.item
      ..play = play ?? this.play
      ..odds = odds ?? this.odds
      ..txt1 = txt1 ?? this.txt1
      ..txt2 = txt2 ?? this.txt2;
  }
}

Total $TotalFromJson(Map<String, dynamic> json) {
  final Total total = Total();
  final num? betAmountTotal = jsonConvert.convert<num>(json['betAmountTotal']);
  if (betAmountTotal != null) {
    total.betAmountTotal = betAmountTotal;
  }
  final num? validAmountTotal = jsonConvert.convert<num>(
      json['validAmountTotal']);
  if (validAmountTotal != null) {
    total.validAmountTotal = validAmountTotal;
  }
  final num? winloseTotal = jsonConvert.convert<num>(json['winloseTotal']);
  if (winloseTotal != null) {
    total.winloseTotal = winloseTotal;
  }
  final num? betCountTotal = jsonConvert.convert<num>(json['betCountTotal']);
  if (betCountTotal != null) {
    total.betCountTotal = betCountTotal;
  }
  return total;
}

Map<String, dynamic> $TotalToJson(Total entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betAmountTotal'] = entity.betAmountTotal;
  data['validAmountTotal'] = entity.validAmountTotal;
  data['winloseTotal'] = entity.winloseTotal;
  data['betCountTotal'] = entity.betCountTotal;
  return data;
}

extension TotalExtension on Total {
  Total copyWith({
    num? betAmountTotal,
    num? validAmountTotal,
    num? winloseTotal,
    num? betCountTotal,
  }) {
    return Total()
      ..betAmountTotal = betAmountTotal ?? this.betAmountTotal
      ..validAmountTotal = validAmountTotal ?? this.validAmountTotal
      ..winloseTotal = winloseTotal ?? this.winloseTotal
      ..betCountTotal = betCountTotal ?? this.betCountTotal;
  }
}