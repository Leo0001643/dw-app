import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/deposit_log_entity.dart';

DepositLogEntity $DepositLogEntityFromJson(Map<String, dynamic> json) {
  final DepositLogEntity depositLogEntity = DepositLogEntity();
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    depositLogEntity.addTime = addTime;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    depositLogEntity.bankName = bankName;
  }
  final String? billno = jsonConvert.convert<String>(json['billno']);
  if (billno != null) {
    depositLogEntity.billno = billno;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    depositLogEntity.currency = currency;
  }
  final int? money = jsonConvert.convert<int>(json['money']);
  if (money != null) {
    depositLogEntity.money = money;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    depositLogEntity.status = status;
  }
  return depositLogEntity;
}

Map<String, dynamic> $DepositLogEntityToJson(DepositLogEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addTime'] = entity.addTime;
  data['bankName'] = entity.bankName;
  data['billno'] = entity.billno;
  data['currency'] = entity.currency;
  data['money'] = entity.money;
  data['status'] = entity.status;
  return data;
}

extension DepositLogEntityExtension on DepositLogEntity {
  DepositLogEntity copyWith({
    int? addTime,
    String? bankName,
    String? billno,
    String? currency,
    int? money,
    int? status,
  }) {
    return DepositLogEntity()
      ..addTime = addTime ?? this.addTime
      ..bankName = bankName ?? this.bankName
      ..billno = billno ?? this.billno
      ..currency = currency ?? this.currency
      ..money = money ?? this.money
      ..status = status ?? this.status;
  }
}