import 'package:leisure_games/app/socket/isolate_msg_entity.dart';
import 'package:leisure_games/generated/json/base/json_convert_content.dart';

IsolateMsgEntity $IsolateMsgEntityFromJson(Map<String, dynamic> json) {
  final IsolateMsgEntity isolateMsgEntity = IsolateMsgEntity();
  final String? key = jsonConvert.convert<String>(json['key']);
  if (key != null) {
    isolateMsgEntity.key = key;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    isolateMsgEntity.value = value;
  }
  return isolateMsgEntity;
}

Map<String, dynamic> $IsolateMsgEntityToJson(IsolateMsgEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['key'] = entity.key;
  data['value'] = entity.value;
  return data;
}

extension IsolateMsgEntityExtension on IsolateMsgEntity {
  IsolateMsgEntity copyWith({
    String? key,
    String? value,
  }) {
    return IsolateMsgEntity()
      ..key = key ?? this.key
      ..value = value ?? this.value;
  }
}