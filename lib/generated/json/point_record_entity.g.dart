import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/point_record_entity.dart';

PointRecordEntity $PointRecordEntityFromJson(Map<String, dynamic> json) {
  final PointRecordEntity pointRecordEntity = PointRecordEntity();
  final int? totalNumber = jsonConvert.convert<int>(json['totalNumber']);
  if (totalNumber != null) {
    pointRecordEntity.totalNumber = totalNumber;
  }
  final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
  if (pageSize != null) {
    pointRecordEntity.pageSize = pageSize;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    pointRecordEntity.page = page;
  }
  final List<PointRecordRecord>? record = (json['record'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PointRecordRecord>(e) as PointRecordRecord)
      .toList();
  if (record != null) {
    pointRecordEntity.record = record;
  }
  return pointRecordEntity;
}

Map<String, dynamic> $PointRecordEntityToJson(PointRecordEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalNumber'] = entity.totalNumber;
  data['pageSize'] = entity.pageSize;
  data['page'] = entity.page;
  data['record'] = entity.record?.map((v) => v.toJson()).toList();
  return data;
}

extension PointRecordEntityExtension on PointRecordEntity {
  PointRecordEntity copyWith({
    int? totalNumber,
    int? pageSize,
    int? page,
    List<PointRecordRecord>? record,
  }) {
    return PointRecordEntity()
      ..totalNumber = totalNumber ?? this.totalNumber
      ..pageSize = pageSize ?? this.pageSize
      ..page = page ?? this.page
      ..record = record ?? this.record;
  }
}

PointRecordRecord $PointRecordRecordFromJson(Map<String, dynamic> json) {
  final PointRecordRecord pointRecordRecord = PointRecordRecord();
  final String? date = jsonConvert.convert<String>(json['date']);
  if (date != null) {
    pointRecordRecord.date = date;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    pointRecordRecord.username = username;
  }
  final String? transPoint = jsonConvert.convert<String>(json['transPoint']);
  if (transPoint != null) {
    pointRecordRecord.transPoint = transPoint;
  }
  final String? afterPoint = jsonConvert.convert<String>(json['afterPoint']);
  if (afterPoint != null) {
    pointRecordRecord.afterPoint = afterPoint;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    pointRecordRecord.remark = remark;
  }
  return pointRecordRecord;
}

Map<String, dynamic> $PointRecordRecordToJson(PointRecordRecord entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['date'] = entity.date;
  data['username'] = entity.username;
  data['transPoint'] = entity.transPoint;
  data['afterPoint'] = entity.afterPoint;
  data['remark'] = entity.remark;
  return data;
}

extension PointRecordRecordExtension on PointRecordRecord {
  PointRecordRecord copyWith({
    String? date,
    String? username,
    String? transPoint,
    String? afterPoint,
    String? remark,
  }) {
    return PointRecordRecord()
      ..date = date ?? this.date
      ..username = username ?? this.username
      ..transPoint = transPoint ?? this.transPoint
      ..afterPoint = afterPoint ?? this.afterPoint
      ..remark = remark ?? this.remark;
  }
}