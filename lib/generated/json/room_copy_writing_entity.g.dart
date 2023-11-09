import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/room_copy_writing_entity.dart';

RoomCopyWritingEntity $RoomCopyWritingEntityFromJson(
    Map<String, dynamic> json) {
  final RoomCopyWritingEntity roomCopyWritingEntity = RoomCopyWritingEntity();
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    roomCopyWritingEntity.tag = tag;
  }
  final RoomCopyWritingContent? content = jsonConvert.convert<
      RoomCopyWritingContent>(json['content']);
  if (content != null) {
    roomCopyWritingEntity.content = content;
  }
  return roomCopyWritingEntity;
}

Map<String, dynamic> $RoomCopyWritingEntityToJson(
    RoomCopyWritingEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tag'] = entity.tag;
  data['content'] = entity.content?.toJson();
  return data;
}

extension RoomCopyWritingEntityExtension on RoomCopyWritingEntity {
  RoomCopyWritingEntity copyWith({
    String? tag,
    RoomCopyWritingContent? content,
  }) {
    return RoomCopyWritingEntity()
      ..tag = tag ?? this.tag
      ..content = content ?? this.content;
  }
}

RoomCopyWritingContent $RoomCopyWritingContentFromJson(
    Map<String, dynamic> json) {
  final RoomCopyWritingContent roomCopyWritingContent = RoomCopyWritingContent();
  final String? countDown60 = jsonConvert.convert<String>(json['CountDown60']);
  if (countDown60 != null) {
    roomCopyWritingContent.countDown60 = countDown60;
  }
  final String? inertRoom = jsonConvert.convert<String>(json['InertRoom']);
  if (inertRoom != null) {
    roomCopyWritingContent.inertRoom = inertRoom;
  }
  final String? lotteryResults = jsonConvert.convert<String>(
      json['LotteryResults']);
  if (lotteryResults != null) {
    roomCopyWritingContent.lotteryResults = lotteryResults;
  }
  final String? countDown30 = jsonConvert.convert<String>(json['CountDown30']);
  if (countDown30 != null) {
    roomCopyWritingContent.countDown30 = countDown30;
  }
  final String? closePlate = jsonConvert.convert<String>(json['ClosePlate']);
  if (closePlate != null) {
    roomCopyWritingContent.closePlate = closePlate;
  }
  final String? beginBet = jsonConvert.convert<String>(json['BeginBet']);
  if (beginBet != null) {
    roomCopyWritingContent.beginBet = beginBet;
  }
  final String? openPlate = jsonConvert.convert<String>(json['OpenPlate']);
  if (openPlate != null) {
    roomCopyWritingContent.openPlate = openPlate;
  }
  final String? countDown10 = jsonConvert.convert<String>(json['CountDown10']);
  if (countDown10 != null) {
    roomCopyWritingContent.countDown10 = countDown10;
  }
  return roomCopyWritingContent;
}

Map<String, dynamic> $RoomCopyWritingContentToJson(
    RoomCopyWritingContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['CountDown60'] = entity.countDown60;
  data['InertRoom'] = entity.inertRoom;
  data['LotteryResults'] = entity.lotteryResults;
  data['CountDown30'] = entity.countDown30;
  data['ClosePlate'] = entity.closePlate;
  data['BeginBet'] = entity.beginBet;
  data['OpenPlate'] = entity.openPlate;
  data['CountDown10'] = entity.countDown10;
  return data;
}

extension RoomCopyWritingContentExtension on RoomCopyWritingContent {
  RoomCopyWritingContent copyWith({
    String? countDown60,
    String? inertRoom,
    String? lotteryResults,
    String? countDown30,
    String? closePlate,
    String? beginBet,
    String? openPlate,
    String? countDown10,
  }) {
    return RoomCopyWritingContent()
      ..countDown60 = countDown60 ?? this.countDown60
      ..inertRoom = inertRoom ?? this.inertRoom
      ..lotteryResults = lotteryResults ?? this.lotteryResults
      ..countDown30 = countDown30 ?? this.countDown30
      ..closePlate = closePlate ?? this.closePlate
      ..beginBet = beginBet ?? this.beginBet
      ..openPlate = openPlate ?? this.openPlate
      ..countDown10 = countDown10 ?? this.countDown10;
  }
}