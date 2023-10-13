import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

MessageItemEntity $MessageItemEntityFromJson(Map<String, dynamic> json) {
  final MessageItemEntity messageItemEntity = MessageItemEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    messageItemEntity.id = id;
  }
  final String? noteContent = jsonConvert.convert<String>(json['noteContent']);
  if (noteContent != null) {
    messageItemEntity.noteContent = noteContent;
  }
  final String? noteTitle = jsonConvert.convert<String>(json['noteTitle']);
  if (noteTitle != null) {
    messageItemEntity.noteTitle = noteTitle;
  }
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    messageItemEntity.addTime = addTime;
  }
  final int? noteType = jsonConvert.convert<int>(json['noteType']);
  if (noteType != null) {
    messageItemEntity.noteType = noteType;
  }
  return messageItemEntity;
}

Map<String, dynamic> $MessageItemEntityToJson(MessageItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['noteContent'] = entity.noteContent;
  data['noteTitle'] = entity.noteTitle;
  data['addTime'] = entity.addTime;
  data['noteType'] = entity.noteType;
  return data;
}

extension MessageItemEntityExtension on MessageItemEntity {
  MessageItemEntity copyWith({
    int? id,
    String? noteContent,
    String? noteTitle,
    int? addTime,
    int? noteType,
  }) {
    return MessageItemEntity()
      ..id = id ?? this.id
      ..noteContent = noteContent ?? this.noteContent
      ..noteTitle = noteTitle ?? this.noteTitle
      ..addTime = addTime ?? this.addTime
      ..noteType = noteType ?? this.noteType;
  }
}