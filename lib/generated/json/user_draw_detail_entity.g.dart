import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:leisure_games/app/global.dart';


UserDrawDetailEntity $UserDrawDetailEntityFromJson(Map<String, dynamic> json) {
  final UserDrawDetailEntity userDrawDetailEntity = UserDrawDetailEntity();
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
  final int? isSetBankPwd = jsonConvert.convert<int>(json['isSetBankPwd']);
  if (isSetBankPwd != null) {
    userDrawDetailEntity.isSetBankPwd = isSetBankPwd;
  }
  final List<UserDrawDetailBanks>? banks = (json['banks'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<UserDrawDetailBanks>(e) as UserDrawDetailBanks)
      .toList();
  if (banks != null) {
    userDrawDetailEntity.banks = banks;
  }
  final List<UserDrawDetailBanks>? dcBanks = (json['dcBanks'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<UserDrawDetailBanks>(e) as UserDrawDetailBanks)
      .toList();
  if (dcBanks != null) {
    userDrawDetailEntity.dcBanks = dcBanks;
  }
  return userDrawDetailEntity;
}

Map<String, dynamic> $UserDrawDetailEntityToJson(UserDrawDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mobile'] = entity.mobile;
  data['realname'] = entity.realname;
  data['username'] = entity.username;
  data['isSetBankPwd'] = entity.isSetBankPwd;
  data['banks'] = entity.banks?.map((v) => v.toJson()).toList();
  data['dcBanks'] = entity.dcBanks?.map((v) => v.toJson()).toList();
  return data;
}

extension UserDrawDetailEntityExtension on UserDrawDetailEntity {
  UserDrawDetailEntity copyWith({
    String? mobile,
    String? realname,
    String? username,
    int? isSetBankPwd,
    List<UserDrawDetailBanks>? banks,
    List<UserDrawDetailBanks>? dcBanks,
  }) {
    return UserDrawDetailEntity()
      ..mobile = mobile ?? this.mobile
      ..realname = realname ?? this.realname
      ..username = username ?? this.username
      ..isSetBankPwd = isSetBankPwd ?? this.isSetBankPwd
      ..banks = banks ?? this.banks
      ..dcBanks = dcBanks ?? this.dcBanks;
  }
}

UserDrawDetailBanks $UserDrawDetailBanksFromJson(Map<String, dynamic> json) {
  final UserDrawDetailBanks userDrawDetailBanks = UserDrawDetailBanks();
  final int? cardNumber = jsonConvert.convert<int>(json['cardNumber']);
  if (cardNumber != null) {
    userDrawDetailBanks.cardNumber = cardNumber;
  }
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
  return userDrawDetailBanks;
}

Map<String, dynamic> $UserDrawDetailBanksToJson(UserDrawDetailBanks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cardNumber'] = entity.cardNumber;
  data['bankAccount'] = entity.bankAccount;
  data['bankAddress'] = entity.bankAddress;
  data['bankId'] = entity.bankId;
  data['bankName'] = entity.bankName;
  data['bankStatus'] = entity.bankStatus;
  return data;
}

extension UserDrawDetailBanksExtension on UserDrawDetailBanks {
  UserDrawDetailBanks copyWith({
    int? cardNumber,
    String? bankAccount,
    String? bankAddress,
    int? bankId,
    String? bankName,
    int? bankStatus,
  }) {
    return UserDrawDetailBanks()
      ..cardNumber = cardNumber ?? this.cardNumber
      ..bankAccount = bankAccount ?? this.bankAccount
      ..bankAddress = bankAddress ?? this.bankAddress
      ..bankId = bankId ?? this.bankId
      ..bankName = bankName ?? this.bankName
      ..bankStatus = bankStatus ?? this.bankStatus;
  }
}