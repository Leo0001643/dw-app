import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

PaymentListEntity $PaymentListEntityFromJson(Map<String, dynamic> json) {
  final PaymentListEntity paymentListEntity = PaymentListEntity();
  final List<PaymentListBanks>? banks = (json['banks'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PaymentListBanks>(e) as PaymentListBanks)
      .toList();
  if (banks != null) {
    paymentListEntity.banks = banks;
  }
  return paymentListEntity;
}

Map<String, dynamic> $PaymentListEntityToJson(PaymentListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['banks'] = entity.banks?.map((v) => v.toJson()).toList();
  return data;
}

extension PaymentListEntityExtension on PaymentListEntity {
  PaymentListEntity copyWith({
    List<PaymentListBanks>? banks,
  }) {
    return PaymentListEntity()
      ..banks = banks ?? this.banks;
  }
}

PaymentListBanks $PaymentListBanksFromJson(Map<String, dynamic> json) {
  final PaymentListBanks paymentListBanks = PaymentListBanks();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    paymentListBanks.id = id;
  }
  final String? bankCode = jsonConvert.convert<String>(json['bankCode']);
  if (bankCode != null) {
    paymentListBanks.bankCode = bankCode;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    paymentListBanks.bankName = bankName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    paymentListBanks.icon = icon;
  }
  return paymentListBanks;
}

Map<String, dynamic> $PaymentListBanksToJson(PaymentListBanks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCode'] = entity.bankCode;
  data['bankName'] = entity.bankName;
  data['icon'] = entity.icon;
  return data;
}

extension PaymentListBanksExtension on PaymentListBanks {
  PaymentListBanks copyWith({
    int? id,
    String? bankCode,
    String? bankName,
    String? icon,
  }) {
    return PaymentListBanks()
      ..id = id ?? this.id
      ..bankCode = bankCode ?? this.bankCode
      ..bankName = bankName ?? this.bankName
      ..icon = icon ?? this.icon;
  }
}