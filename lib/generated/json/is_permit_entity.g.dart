import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/is_permit_entity.dart';

IsPermitEntity $IsPermitEntityFromJson(Map<String, dynamic> json) {
  final IsPermitEntity isPermitEntity = IsPermitEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    isPermitEntity.status = status;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    isPermitEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    isPermitEntity.name = name;
  }
  return isPermitEntity;
}

Map<String, dynamic> $IsPermitEntityToJson(IsPermitEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['id'] = entity.id;
  data['name'] = entity.name;
  return data;
}

extension IsPermitEntityExtension on IsPermitEntity {
  IsPermitEntity copyWith({
    int? status,
    int? id,
    String? name,
  }) {
    return IsPermitEntity()
      ..status = status ?? this.status
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }
}