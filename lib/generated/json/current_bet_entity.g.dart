import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/current_bet_entity.dart';

CurrentBetEntity $CurrentBetEntityFromJson(Map<String, dynamic> json) {
  final CurrentBetEntity currentBetEntity = CurrentBetEntity();
  final int? number = jsonConvert.convert<int>(json['number']);
  if (number != null) {
    currentBetEntity.number = number;
  }
  final bool? last = jsonConvert.convert<bool>(json['last']);
  if (last != null) {
    currentBetEntity.last = last;
  }
  final int? numberOfElements = jsonConvert.convert<int>(
      json['numberOfElements']);
  if (numberOfElements != null) {
    currentBetEntity.numberOfElements = numberOfElements;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    currentBetEntity.size = size;
  }
  final int? totalPages = jsonConvert.convert<int>(json['totalPages']);
  if (totalPages != null) {
    currentBetEntity.totalPages = totalPages;
  }
  final dynamic sort = json['sort'];
  if (sort != null) {
    currentBetEntity.sort = sort;
  }
  final List<CurrentBetContent>? content = (json['content'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CurrentBetContent>(e) as CurrentBetContent)
      .toList();
  if (content != null) {
    currentBetEntity.content = content;
  }
  final bool? first = jsonConvert.convert<bool>(json['first']);
  if (first != null) {
    currentBetEntity.first = first;
  }
  final int? totalElements = jsonConvert.convert<int>(json['totalElements']);
  if (totalElements != null) {
    currentBetEntity.totalElements = totalElements;
  }
  return currentBetEntity;
}

Map<String, dynamic> $CurrentBetEntityToJson(CurrentBetEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['number'] = entity.number;
  data['last'] = entity.last;
  data['numberOfElements'] = entity.numberOfElements;
  data['size'] = entity.size;
  data['totalPages'] = entity.totalPages;
  data['sort'] = entity.sort;
  data['content'] = entity.content?.map((v) => v.toJson()).toList();
  data['first'] = entity.first;
  data['totalElements'] = entity.totalElements;
  return data;
}

extension CurrentBetEntityExtension on CurrentBetEntity {
  CurrentBetEntity copyWith({
    int? number,
    bool? last,
    int? numberOfElements,
    int? size,
    int? totalPages,
    dynamic sort,
    List<CurrentBetContent>? content,
    bool? first,
    int? totalElements,
  }) {
    return CurrentBetEntity()
      ..number = number ?? this.number
      ..last = last ?? this.last
      ..numberOfElements = numberOfElements ?? this.numberOfElements
      ..size = size ?? this.size
      ..totalPages = totalPages ?? this.totalPages
      ..sort = sort ?? this.sort
      ..content = content ?? this.content
      ..first = first ?? this.first
      ..totalElements = totalElements ?? this.totalElements;
  }
}

CurrentBetContent $CurrentBetContentFromJson(Map<String, dynamic> json) {
  final CurrentBetContent currentBetContent = CurrentBetContent();
  final double? betOddsExpected = jsonConvert.convert<double>(
      json['betOddsExpected']);
  if (betOddsExpected != null) {
    currentBetContent.betOddsExpected = betOddsExpected;
  }
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    currentBetContent.gameType = gameType;
  }
  final double? betMoney = jsonConvert.convert<double>(json['betMoney']);
  if (betMoney != null) {
    currentBetContent.betMoney = betMoney;
  }
  final double? winMoneyExpected = jsonConvert.convert<double>(
      json['winMoneyExpected']);
  if (winMoneyExpected != null) {
    currentBetContent.winMoneyExpected = winMoneyExpected;
  }
  final String? moneyType = jsonConvert.convert<String>(json['moneyType']);
  if (moneyType != null) {
    currentBetContent.moneyType = moneyType;
  }
  final dynamic payOff = json['payOff'];
  if (payOff != null) {
    currentBetContent.payOff = payOff;
  }
  final String? encryption = jsonConvert.convert<String>(json['encryption']);
  if (encryption != null) {
    currentBetContent.encryption = encryption;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    currentBetContent.rate = rate;
  }
  final int? term = jsonConvert.convert<int>(json['term']);
  if (term != null) {
    currentBetContent.term = term;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    currentBetContent.id = id;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    currentBetContent.state = state;
  }
  final dynamic afterBalance = json['afterBalance'];
  if (afterBalance != null) {
    currentBetContent.afterBalance = afterBalance;
  }
  final String? billNo = jsonConvert.convert<String>(json['billNo']);
  if (billNo != null) {
    currentBetContent.billNo = billNo;
  }
  final double? betOdds1314 = jsonConvert.convert<double>(json['betOdds1314']);
  if (betOdds1314 != null) {
    currentBetContent.betOdds1314 = betOdds1314;
  }
  final dynamic winMoneyValid = json['winMoneyValid'];
  if (winMoneyValid != null) {
    currentBetContent.winMoneyValid = winMoneyValid;
  }
  final double? cnyMoney = jsonConvert.convert<double>(json['cnyMoney']);
  if (cnyMoney != null) {
    currentBetContent.cnyMoney = cnyMoney;
  }
  final double? winMoney1314 = jsonConvert.convert<double>(
      json['winMoney1314']);
  if (winMoney1314 != null) {
    currentBetContent.winMoney1314 = winMoney1314;
  }
  final dynamic updateTime = json['updateTime'];
  if (updateTime != null) {
    currentBetContent.updateTime = updateTime;
  }
  final String? betType = jsonConvert.convert<String>(json['betType']);
  if (betType != null) {
    currentBetContent.betType = betType;
  }
  final String? betMsg = jsonConvert.convert<String>(json['betMsg']);
  if (betMsg != null) {
    currentBetContent.betMsg = betMsg;
  }
  final dynamic betNum = json['betNum'];
  if (betNum != null) {
    currentBetContent.betNum = betNum;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    currentBetContent.createTime = createTime;
  }
  final int? billId = jsonConvert.convert<int>(json['billId']);
  if (billId != null) {
    currentBetContent.billId = billId;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    currentBetContent.siteId = siteId;
  }
  final int? tableId = jsonConvert.convert<int>(json['tableId']);
  if (tableId != null) {
    currentBetContent.tableId = tableId;
  }
  final String? originalUsername = jsonConvert.convert<String>(
      json['originalUsername']);
  if (originalUsername != null) {
    currentBetContent.originalUsername = originalUsername;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    currentBetContent.username = username;
  }
  return currentBetContent;
}

Map<String, dynamic> $CurrentBetContentToJson(CurrentBetContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['betOddsExpected'] = entity.betOddsExpected;
  data['gameType'] = entity.gameType;
  data['betMoney'] = entity.betMoney;
  data['winMoneyExpected'] = entity.winMoneyExpected;
  data['moneyType'] = entity.moneyType;
  data['payOff'] = entity.payOff;
  data['encryption'] = entity.encryption;
  data['rate'] = entity.rate;
  data['term'] = entity.term;
  data['id'] = entity.id;
  data['state'] = entity.state;
  data['afterBalance'] = entity.afterBalance;
  data['billNo'] = entity.billNo;
  data['betOdds1314'] = entity.betOdds1314;
  data['winMoneyValid'] = entity.winMoneyValid;
  data['cnyMoney'] = entity.cnyMoney;
  data['winMoney1314'] = entity.winMoney1314;
  data['updateTime'] = entity.updateTime;
  data['betType'] = entity.betType;
  data['betMsg'] = entity.betMsg;
  data['betNum'] = entity.betNum;
  data['createTime'] = entity.createTime;
  data['billId'] = entity.billId;
  data['siteId'] = entity.siteId;
  data['tableId'] = entity.tableId;
  data['originalUsername'] = entity.originalUsername;
  data['username'] = entity.username;
  return data;
}

extension CurrentBetContentExtension on CurrentBetContent {
  CurrentBetContent copyWith({
    double? betOddsExpected,
    String? gameType,
    double? betMoney,
    double? winMoneyExpected,
    String? moneyType,
    dynamic payOff,
    String? encryption,
    double? rate,
    int? term,
    int? id,
    int? state,
    dynamic afterBalance,
    String? billNo,
    double? betOdds1314,
    dynamic winMoneyValid,
    double? cnyMoney,
    double? winMoney1314,
    dynamic updateTime,
    String? betType,
    String? betMsg,
    dynamic betNum,
    int? createTime,
    int? billId,
    int? siteId,
    int? tableId,
    String? originalUsername,
    String? username,
  }) {
    return CurrentBetContent()
      ..betOddsExpected = betOddsExpected ?? this.betOddsExpected
      ..gameType = gameType ?? this.gameType
      ..betMoney = betMoney ?? this.betMoney
      ..winMoneyExpected = winMoneyExpected ?? this.winMoneyExpected
      ..moneyType = moneyType ?? this.moneyType
      ..payOff = payOff ?? this.payOff
      ..encryption = encryption ?? this.encryption
      ..rate = rate ?? this.rate
      ..term = term ?? this.term
      ..id = id ?? this.id
      ..state = state ?? this.state
      ..afterBalance = afterBalance ?? this.afterBalance
      ..billNo = billNo ?? this.billNo
      ..betOdds1314 = betOdds1314 ?? this.betOdds1314
      ..winMoneyValid = winMoneyValid ?? this.winMoneyValid
      ..cnyMoney = cnyMoney ?? this.cnyMoney
      ..winMoney1314 = winMoney1314 ?? this.winMoney1314
      ..updateTime = updateTime ?? this.updateTime
      ..betType = betType ?? this.betType
      ..betMsg = betMsg ?? this.betMsg
      ..betNum = betNum ?? this.betNum
      ..createTime = createTime ?? this.createTime
      ..billId = billId ?? this.billId
      ..siteId = siteId ?? this.siteId
      ..tableId = tableId ?? this.tableId
      ..originalUsername = originalUsername ?? this.originalUsername
      ..username = username ?? this.username;
  }
}