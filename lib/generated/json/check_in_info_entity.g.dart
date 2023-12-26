import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/check_in_info_entity.dart';

CheckInInfoEntity $CheckInInfoEntityFromJson(Map<String, dynamic> json) {
  final CheckInInfoEntity checkInInfoEntity = CheckInInfoEntity();
  final List<String>? log = (json['log'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (log != null) {
    checkInInfoEntity.log = log;
  }
  final String? signInNum = jsonConvert.convert<String>(json['signInNum']);
  if (signInNum != null) {
    checkInInfoEntity.signInNum = signInNum;
  }
  final String? point = jsonConvert.convert<String>(json['point']);
  if (point != null) {
    checkInInfoEntity.point = point;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    checkInInfoEntity.timestamp = timestamp;
  }
  return checkInInfoEntity;
}

Map<String, dynamic> $CheckInInfoEntityToJson(CheckInInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['log'] = entity.log;
  data['signInNum'] = entity.signInNum;
  data['point'] = entity.point;
  data['timestamp'] = entity.timestamp;
  return data;
}

extension CheckInInfoEntityExtension on CheckInInfoEntity {
  CheckInInfoEntity copyWith({
    List<String>? log,
    String? signInNum,
    String? point,
    int? timestamp,
  }) {
    return CheckInInfoEntity()
      ..log = log ?? this.log
      ..signInNum = signInNum ?? this.signInNum
      ..point = point ?? this.point
      ..timestamp = timestamp ?? this.timestamp;
  }
}