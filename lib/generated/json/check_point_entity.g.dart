import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/check_point_entity.dart';

CheckPointEntity $CheckPointEntityFromJson(Map<String, dynamic> json) {
  final CheckPointEntity checkPointEntity = CheckPointEntity();
  final int? chekNum = jsonConvert.convert<int>(json['chekNum']);
  if (chekNum != null) {
    checkPointEntity.chekNum = chekNum;
  }
  final int? nextCheckNum = jsonConvert.convert<int>(json['nextCheckNum']);
  if (nextCheckNum != null) {
    checkPointEntity.nextCheckNum = nextCheckNum;
  }
  final double? point = jsonConvert.convert<double>(json['point']);
  if (point != null) {
    checkPointEntity.point = point;
  }
  final int? pointTotal = jsonConvert.convert<int>(json['pointTotal']);
  if (pointTotal != null) {
    checkPointEntity.pointTotal = pointTotal;
  }
  final int? nextPoint = jsonConvert.convert<int>(json['nextPoint']);
  if (nextPoint != null) {
    checkPointEntity.nextPoint = nextPoint;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    checkPointEntity.timestamp = timestamp;
  }
  return checkPointEntity;
}

Map<String, dynamic> $CheckPointEntityToJson(CheckPointEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['chekNum'] = entity.chekNum;
  data['nextCheckNum'] = entity.nextCheckNum;
  data['point'] = entity.point;
  data['pointTotal'] = entity.pointTotal;
  data['nextPoint'] = entity.nextPoint;
  data['timestamp'] = entity.timestamp;
  return data;
}

extension CheckPointEntityExtension on CheckPointEntity {
  CheckPointEntity copyWith({
    int? chekNum,
    int? nextCheckNum,
    double? point,
    int? pointTotal,
    int? nextPoint,
    int? timestamp,
  }) {
    return CheckPointEntity()
      ..chekNum = chekNum ?? this.chekNum
      ..nextCheckNum = nextCheckNum ?? this.nextCheckNum
      ..point = point ?? this.point
      ..pointTotal = pointTotal ?? this.pointTotal
      ..nextPoint = nextPoint ?? this.nextPoint
      ..timestamp = timestamp ?? this.timestamp;
  }
}