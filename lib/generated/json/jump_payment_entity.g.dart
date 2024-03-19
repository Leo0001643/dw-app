import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/jump_payment_entity.dart';

JumpPaymentEntity $JumpPaymentEntityFromJson(Map<String, dynamic> json) {
  final JumpPaymentEntity jumpPaymentEntity = JumpPaymentEntity();
  final double? moneyUp = jsonConvert.convert<double>(json['moneyUp']);
  if (moneyUp != null) {
    jumpPaymentEntity.moneyUp = moneyUp;
  }
  final int? moneyDown = jsonConvert.convert<int>(json['moneyDown']);
  if (moneyDown != null) {
    jumpPaymentEntity.moneyDown = moneyDown;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    jumpPaymentEntity.id = id;
  }
  final dynamic fixedMoney = json['fixedMoney'];
  if (fixedMoney != null) {
    jumpPaymentEntity.fixedMoney = fixedMoney;
  }
  final String? moneyQuick = jsonConvert.convert<String>(json['moneyQuick']);
  if (moneyQuick != null) {
    jumpPaymentEntity.moneyQuick = moneyQuick;
  }
  final String? mark = jsonConvert.convert<String>(json['mark']);
  if (mark != null) {
    jumpPaymentEntity.mark = mark;
  }
  final int? marksColor = jsonConvert.convert<int>(json['marksColor']);
  if (marksColor != null) {
    jumpPaymentEntity.marksColor = marksColor;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    jumpPaymentEntity.rate = rate;
  }
  final List<JumpPaymentBanks>? banks = (json['banks'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<JumpPaymentBanks>(e) as JumpPaymentBanks)
      .toList();
  if (banks != null) {
    jumpPaymentEntity.banks = banks;
  }
  return jumpPaymentEntity;
}

Map<String, dynamic> $JumpPaymentEntityToJson(JumpPaymentEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['moneyUp'] = entity.moneyUp;
  data['moneyDown'] = entity.moneyDown;
  data['id'] = entity.id;
  data['fixedMoney'] = entity.fixedMoney;
  data['moneyQuick'] = entity.moneyQuick;
  data['mark'] = entity.mark;
  data['marksColor'] = entity.marksColor;
  data['rate'] = entity.rate;
  data['banks'] = entity.banks?.map((v) => v.toJson()).toList();
  return data;
}

extension JumpPaymentEntityExtension on JumpPaymentEntity {
  JumpPaymentEntity copyWith({
    double? moneyUp,
    int? moneyDown,
    int? id,
    dynamic fixedMoney,
    String? moneyQuick,
    String? mark,
    int? marksColor,
    double? rate,
    List<JumpPaymentBanks>? banks,
  }) {
    return JumpPaymentEntity()
      ..moneyUp = moneyUp ?? this.moneyUp
      ..moneyDown = moneyDown ?? this.moneyDown
      ..id = id ?? this.id
      ..fixedMoney = fixedMoney ?? this.fixedMoney
      ..moneyQuick = moneyQuick ?? this.moneyQuick
      ..mark = mark ?? this.mark
      ..marksColor = marksColor ?? this.marksColor
      ..rate = rate ?? this.rate
      ..banks = banks ?? this.banks;
  }
}

JumpPaymentBanks $JumpPaymentBanksFromJson(Map<String, dynamic> json) {
  final JumpPaymentBanks jumpPaymentBanks = JumpPaymentBanks();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    jumpPaymentBanks.id = id;
  }
  final String? bankCode = jsonConvert.convert<String>(json['bankCode']);
  if (bankCode != null) {
    jumpPaymentBanks.bankCode = bankCode;
  }
  final String? bankCodePic = jsonConvert.convert<String>(json['bankCodePic']);
  if (bankCodePic != null) {
    jumpPaymentBanks.bankCodePic = bankCodePic;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    jumpPaymentBanks.name = name;
  }
  final String? onlineName = jsonConvert.convert<String>(json['onlineName']);
  if (onlineName != null) {
    jumpPaymentBanks.onlineName = onlineName;
  }
  return jumpPaymentBanks;
}

Map<String, dynamic> $JumpPaymentBanksToJson(JumpPaymentBanks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCode'] = entity.bankCode;
  data['bankCodePic'] = entity.bankCodePic;
  data['name'] = entity.name;
  data['onlineName'] = entity.onlineName;
  return data;
}

extension JumpPaymentBanksExtension on JumpPaymentBanks {
  JumpPaymentBanks copyWith({
    int? id,
    String? bankCode,
    String? bankCodePic,
    String? name,
    String? onlineName,
  }) {
    return JumpPaymentBanks()
      ..id = id ?? this.id
      ..bankCode = bankCode ?? this.bankCode
      ..bankCodePic = bankCodePic ?? this.bankCodePic
      ..name = name ?? this.name
      ..onlineName = onlineName ?? this.onlineName;
  }
}