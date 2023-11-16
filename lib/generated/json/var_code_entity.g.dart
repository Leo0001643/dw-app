import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';

VarCodeEntity $VarCodeEntityFromJson(Map<String, dynamic> json) {
  final VarCodeEntity varCodeEntity = VarCodeEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    varCodeEntity.status = status;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    varCodeEntity.type = type;
  }
  final String? varCode = jsonConvert.convert<String>(json['varCode']);
  if (varCode != null) {
    varCodeEntity.varCode = varCode;
  }
  final String? varCodeId = jsonConvert.convert<String>(json['varCodeId']);
  if (varCodeId != null) {
    varCodeEntity.varCodeId = varCodeId;
  }
  return varCodeEntity;
}

Map<String, dynamic> $VarCodeEntityToJson(VarCodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['type'] = entity.type;
  data['varCode'] = entity.varCode;
  data['varCodeId'] = entity.varCodeId;
  return data;
}

extension VarCodeEntityExtension on VarCodeEntity {
  VarCodeEntity copyWith({
    int? status,
    int? type,
    String? varCode,
    String? varCodeId,
  }) {
    return VarCodeEntity()
      ..status = status ?? this.status
      ..type = type ?? this.type
      ..varCode = varCode ?? this.varCode
      ..varCodeId = varCodeId ?? this.varCodeId;
  }
}