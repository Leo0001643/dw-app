import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:leisure_games/app/global.dart';

import 'package:leisure_games/ui/bean/usdt_entity.dart';


UserDrawDetailEntity $UserDrawDetailEntityFromJson(Map<String, dynamic> json) {
  final UserDrawDetailEntity userDrawDetailEntity = UserDrawDetailEntity();
  final List<UserDrawDetailBanks>? banks = (json['banks'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<UserDrawDetailBanks>(e) as UserDrawDetailBanks)
      .toList();
  if (banks != null) {
    userDrawDetailEntity.banks = banks;
  }
  final List<UsdtEntity>? dcBanks = (json['dcBanks'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<UsdtEntity>(e) as UsdtEntity).toList();
  if (dcBanks != null) {
    userDrawDetailEntity.dcBanks = dcBanks;
  }
  final int? isSetBankPwd = jsonConvert.convert<int>(json['isSetBankPwd']);
  if (isSetBankPwd != null) {
    userDrawDetailEntity.isSetBankPwd = isSetBankPwd;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    userDrawDetailEntity.mobile = mobile;
  }
  final String? realname = jsonConvert.convert<String>(json['realname']);
  if (realname != null) {
    userDrawDetailEntity.realname = realname;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userDrawDetailEntity.username = username;
  }
  return userDrawDetailEntity;
}

Map<String, dynamic> $UserDrawDetailEntityToJson(UserDrawDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['banks'] = entity.banks.map((v) => v.toJson()).toList();
  data['dcBanks'] = entity.dcBanks.map((v) => v.toJson()).toList();
  data['isSetBankPwd'] = entity.isSetBankPwd;
  data['mobile'] = entity.mobile;
  data['realname'] = entity.realname;
  data['username'] = entity.username;
  return data;
}

extension UserDrawDetailEntityExtension on UserDrawDetailEntity {
  UserDrawDetailEntity copyWith({
    List<UserDrawDetailBanks>? banks,
    List<UsdtEntity>? dcBanks,
    int? isSetBankPwd,
    String? mobile,
    String? realname,
    String? username,
  }) {
    return UserDrawDetailEntity()
      ..banks = banks ?? this.banks
      ..dcBanks = dcBanks ?? this.dcBanks
      ..isSetBankPwd = isSetBankPwd ?? this.isSetBankPwd
      ..mobile = mobile ?? this.mobile
      ..realname = realname ?? this.realname
      ..username = username ?? this.username;
  }
}

UserDrawDetailBanks $UserDrawDetailBanksFromJson(Map<String, dynamic> json) {
  final UserDrawDetailBanks userDrawDetailBanks = UserDrawDetailBanks();
  final String? bankAccount = jsonConvert.convert<String>(json['bankAccount']);
  if (bankAccount != null) {
    userDrawDetailBanks.bankAccount = bankAccount;
  }
  final String? bankAddress = jsonConvert.convert<String>(json['bankAddress']);
  if (bankAddress != null) {
    userDrawDetailBanks.bankAddress = bankAddress;
  }
  final int? bankId = jsonConvert.convert<int>(json['bankId']);
  if (bankId != null) {
    userDrawDetailBanks.bankId = bankId;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    userDrawDetailBanks.bankName = bankName;
  }
  final int? bankStatus = jsonConvert.convert<int>(json['bankStatus']);
  if (bankStatus != null) {
    userDrawDetailBanks.bankStatus = bankStatus;
  }
  final int? cardNumber = jsonConvert.convert<int>(json['cardNumber']);
  if (cardNumber != null) {
    userDrawDetailBanks.cardNumber = cardNumber;
  }
  return userDrawDetailBanks;
}

Map<String, dynamic> $UserDrawDetailBanksToJson(UserDrawDetailBanks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bankAccount'] = entity.bankAccount;
  data['bankAddress'] = entity.bankAddress;
  data['bankId'] = entity.bankId;
  data['bankName'] = entity.bankName;
  data['bankStatus'] = entity.bankStatus;
  data['cardNumber'] = entity.cardNumber;
  return data;
}

extension UserDrawDetailBanksExtension on UserDrawDetailBanks {
  UserDrawDetailBanks copyWith({
    String? bankAccount,
    String? bankAddress,
    int? bankId,
    String? bankName,
    int? bankStatus,
    int? cardNumber,
  }) {
    return UserDrawDetailBanks()
      ..bankAccount = bankAccount ?? this.bankAccount
      ..bankAddress = bankAddress ?? this.bankAddress
      ..bankId = bankId ?? this.bankId
      ..bankName = bankName ?? this.bankName
      ..bankStatus = bankStatus ?? this.bankStatus
      ..cardNumber = cardNumber ?? this.cardNumber;
  }
}