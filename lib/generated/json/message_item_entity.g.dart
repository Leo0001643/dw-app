import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/message_item_entity.dart';

MessageItemEntity $MessageItemEntityFromJson(Map<String, dynamic> json) {
  final MessageItemEntity messageItemEntity = MessageItemEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    messageItemEntity.id = id;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    messageItemEntity.message = message;
  }
  final String? language = jsonConvert.convert<String>(json['language']);
  if (language != null) {
    messageItemEntity.language = language;
  }
  final int? mstatus = jsonConvert.convert<int>(json['mstatus']);
  if (mstatus != null) {
    messageItemEntity.mstatus = mstatus;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    messageItemEntity.username = username;
  }
  final int? addTime = jsonConvert.convert<int>(json['addTime']);
  if (addTime != null) {
    messageItemEntity.addTime = addTime;
  }
  return messageItemEntity;
}

Map<String, dynamic> $MessageItemEntityToJson(MessageItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['message'] = entity.message;
  data['language'] = entity.language;
  data['mstatus'] = entity.mstatus;
  data['username'] = entity.username;
  data['addTime'] = entity.addTime;
  return data;
}

extension MessageItemEntityExtension on MessageItemEntity {
  MessageItemEntity copyWith({
    int? id,
    String? message,
    String? language,
    int? mstatus,
    String? username,
    int? addTime,
  }) {
    return MessageItemEntity()
      ..id = id ?? this.id
      ..message = message ?? this.message
      ..language = language ?? this.language
      ..mstatus = mstatus ?? this.mstatus
      ..username = username ?? this.username
      ..addTime = addTime ?? this.addTime;
  }
}