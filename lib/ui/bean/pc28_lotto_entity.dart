import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/pc28_lotto_entity.g.dart';
import 'dart:convert';
export 'package:leisure_games/generated/json/pc28_lotto_entity.g.dart';

@JsonSerializable()
class Pc28LottoEntity {
	List<Pc28LottoRooms>? rooms;
	int? createTime;
	String? memo;
	int? siteId;
	int? id;
	int? state;

	Pc28LottoEntity();

	factory Pc28LottoEntity.fromJson(Map<String, dynamic> json) => $Pc28LottoEntityFromJson(json);

	Map<String, dynamic> toJson() => $Pc28LottoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28LottoRooms {
	String? gameType;
	String? stateMsg;
	List<Pc28LottoRoomsTables>? tables;
	int? createTime;
	String? memo2;
	String? memo;
	int? siteId;
	int? updateTime;
	int? id;
	int? state;

	Pc28LottoRooms();

	factory Pc28LottoRooms.fromJson(Map<String, dynamic> json) => $Pc28LottoRoomsFromJson(json);

	Map<String, dynamic> toJson() => $Pc28LottoRoomsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class Pc28LottoRoomsTables {
	String? gameType;
	int? createTime;
	int? level;
	String? memo2;
	String? memo1;
	String? name;
	dynamic siteId;
	int? updateTime;
	int? id;
	int? state;
	int? roomId;

	Pc28LottoRoomsTables();

	factory Pc28LottoRoomsTables.fromJson(Map<String, dynamic> json) => $Pc28LottoRoomsTablesFromJson(json);

	Map<String, dynamic> toJson() => $Pc28LottoRoomsTablesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}