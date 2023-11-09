import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/room_copy_writing_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/room_copy_writing_entity.g.dart';

@JsonSerializable()
class RoomCopyWritingEntity {
	String? tag;
	RoomCopyWritingContent? content;

	RoomCopyWritingEntity();

	factory RoomCopyWritingEntity.fromJson(Map<String, dynamic> json) => $RoomCopyWritingEntityFromJson(json);

	Map<String, dynamic> toJson() => $RoomCopyWritingEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RoomCopyWritingContent {
	@JSONField(name: "CountDown60")
	String? countDown60;
	@JSONField(name: "InertRoom")
	String? inertRoom;
	@JSONField(name: "LotteryResults")
	String? lotteryResults;
	@JSONField(name: "CountDown30")
	String? countDown30;
	@JSONField(name: "ClosePlate")
	String? closePlate;
	@JSONField(name: "BeginBet")
	String? beginBet;
	@JSONField(name: "OpenPlate")
	String? openPlate;
	@JSONField(name: "CountDown10")
	String? countDown10;

	RoomCopyWritingContent();

	factory RoomCopyWritingContent.fromJson(Map<String, dynamic> json) => $RoomCopyWritingContentFromJson(json);

	Map<String, dynamic> toJson() => $RoomCopyWritingContentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}