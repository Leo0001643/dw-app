import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';

DigiccyDepositDataEntity $DigiccyDepositDataEntityFromJson(
    Map<String, dynamic> json) {
  final DigiccyDepositDataEntity digiccyDepositDataEntity = DigiccyDepositDataEntity();
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    digiccyDepositDataEntity.date = date;
  }
  final String? info = jsonConvert.convert<String>(json['info']);
  if (info != null) {
    digiccyDepositDataEntity.info = info;
  }
  final int? money = jsonConvert.convert<int>(json['money']);
  if (money != null) {
    digiccyDepositDataEntity.money = money;
  }
  final String? orderId = jsonConvert.convert<String>(json['orderId']);
  if (orderId != null) {
    digiccyDepositDataEntity.orderId = orderId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    digiccyDepositDataEntity.status = status;
  }
  final String? remitName = jsonConvert.convert<String>(json['remitName']);
  if (remitName != null) {
    digiccyDepositDataEntity.remitName = remitName;
  }
  final String? symbol = jsonConvert.convert<String>(json['symbol']);
  if (symbol != null) {
    digiccyDepositDataEntity.symbol = symbol;
  }
  return digiccyDepositDataEntity;
}

Map<String, dynamic> $DigiccyDepositDataEntityToJson(
    DigiccyDepositDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['date'] = entity.date;
  data['info'] = entity.info;
  data['money'] = entity.money;
  data['orderId'] = entity.orderId;
  data['status'] = entity.status;
  data['remitName'] = entity.remitName;
  data['symbol'] = entity.symbol;
  return data;
}

extension DigiccyDepositDataEntityExtension on DigiccyDepositDataEntity {
  DigiccyDepositDataEntity copyWith({
    String? date,
    String? info,
    int? money,
    String? orderId,
    String? status,
    String? remitName,
    String? symbol,
  }) {
    return DigiccyDepositDataEntity()
      ..date = date ?? this.date
      ..info = info ?? this.info
      ..money = money ?? this.money
      ..orderId = orderId ?? this.orderId
      ..status = status ?? this.status
      ..remitName = remitName ?? this.remitName
      ..symbol = symbol ?? this.symbol;
  }
}