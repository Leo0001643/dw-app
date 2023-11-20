import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';

BankEntity $BankEntityFromJson(Map<String, dynamic> json) {
  final BankEntity bankEntity = BankEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bankEntity.id = id;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    bankEntity.bankName = bankName;
  }
  final String? bankCode = jsonConvert.convert<String>(json['bankCode']);
  if (bankCode != null) {
    bankEntity.bankCode = bankCode;
  }
  final String? bankUrl = jsonConvert.convert<String>(json['bankUrl']);
  if (bankUrl != null) {
    bankEntity.bankUrl = bankUrl;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    bankEntity.status = status;
  }
  final int? orderid = jsonConvert.convert<int>(json['orderid']);
  if (orderid != null) {
    bankEntity.orderid = orderid;
  }
  return bankEntity;
}

Map<String, dynamic> $BankEntityToJson(BankEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankName'] = entity.bankName;
  data['bankCode'] = entity.bankCode;
  data['bankUrl'] = entity.bankUrl;
  data['status'] = entity.status;
  data['orderid'] = entity.orderid;
  return data;
}

extension BankEntityExtension on BankEntity {
  BankEntity copyWith({
    int? id,
    String? bankName,
    String? bankCode,
    String? bankUrl,
    int? status,
    int? orderid,
  }) {
    return BankEntity()
      ..id = id ?? this.id
      ..bankName = bankName ?? this.bankName
      ..bankCode = bankCode ?? this.bankCode
      ..bankUrl = bankUrl ?? this.bankUrl
      ..status = status ?? this.status
      ..orderid = orderid ?? this.orderid;
  }
}