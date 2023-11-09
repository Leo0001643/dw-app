import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/notice_entity.dart';

NoticeEntity $NoticeEntityFromJson(Map<String, dynamic> json) {
  final NoticeEntity noticeEntity = NoticeEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    noticeEntity.id = id;
  }
  final String? noteContent = jsonConvert.convert<String>(json['noteContent']);
  if (noteContent != null) {
    noticeEntity.noteContent = noteContent;
  }
  final String? noteTitle = jsonConvert.convert<String>(json['noteTitle']);
  if (noteTitle != null) {
    noticeEntity.noteTitle = noteTitle;
  }
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    noticeEntity.addTime = addTime;
  }
  final int? noteType = jsonConvert.convert<int>(json['noteType']);
  if (noteType != null) {
    noticeEntity.noteType = noteType;
  }
  return noticeEntity;
}

Map<String, dynamic> $NoticeEntityToJson(NoticeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['noteContent'] = entity.noteContent;
  data['noteTitle'] = entity.noteTitle;
  data['addTime'] = entity.addTime;
  data['noteType'] = entity.noteType;
  return data;
}

extension NoticeEntityExtension on NoticeEntity {
  NoticeEntity copyWith({
    int? id,
    String? noteContent,
    String? noteTitle,
    int? addTime,
    int? noteType,
  }) {
    return NoticeEntity()
      ..id = id ?? this.id
      ..noteContent = noteContent ?? this.noteContent
      ..noteTitle = noteTitle ?? this.noteTitle
      ..addTime = addTime ?? this.addTime
      ..noteType = noteType ?? this.noteType;
  }
}