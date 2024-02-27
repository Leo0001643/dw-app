import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';


Pc28LottoEntity $Pc28LottoEntityFromJson(Map<String, dynamic> json) {
  final Pc28LottoEntity pc28LottoEntity = Pc28LottoEntity();
  final List<Pc28LottoRooms>? rooms = (json['rooms'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<Pc28LottoRooms>(e) as Pc28LottoRooms)
      .toList();
  if (rooms != null) {
    pc28LottoEntity.rooms = rooms;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pc28LottoEntity.createTime = createTime;
  }
  final String? memo = jsonConvert.convert<String>(json['memo']);
  if (memo != null) {
    pc28LottoEntity.memo = memo;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    pc28LottoEntity.siteId = siteId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pc28LottoEntity.id = id;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    pc28LottoEntity.state = state;
  }
  return pc28LottoEntity;
}

Map<String, dynamic> $Pc28LottoEntityToJson(Pc28LottoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rooms'] = entity.rooms?.map((v) => v.toJson()).toList();
  data['createTime'] = entity.createTime;
  data['memo'] = entity.memo;
  data['siteId'] = entity.siteId;
  data['id'] = entity.id;
  data['state'] = entity.state;
  return data;
}

extension Pc28LottoEntityExtension on Pc28LottoEntity {
  Pc28LottoEntity copyWith({
    List<Pc28LottoRooms>? rooms,
    int? createTime,
    String? memo,
    int? siteId,
    int? id,
    int? state,
  }) {
    return Pc28LottoEntity()
      ..rooms = rooms ?? this.rooms
      ..createTime = createTime ?? this.createTime
      ..memo = memo ?? this.memo
      ..siteId = siteId ?? this.siteId
      ..id = id ?? this.id
      ..state = state ?? this.state;
  }
}

Pc28LottoRooms $Pc28LottoRoomsFromJson(Map<String, dynamic> json) {
  final Pc28LottoRooms pc28LottoRooms = Pc28LottoRooms();
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    pc28LottoRooms.gameType = gameType;
  }
  final String? stateMsg = jsonConvert.convert<String>(json['stateMsg']);
  if (stateMsg != null) {
    pc28LottoRooms.stateMsg = stateMsg;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pc28LottoRooms.createTime = createTime;
  }
  final String? memo2 = jsonConvert.convert<String>(json['memo2']);
  if (memo2 != null) {
    pc28LottoRooms.memo2 = memo2;
  }
  final String? memo = jsonConvert.convert<String>(json['memo']);
  if (memo != null) {
    pc28LottoRooms.memo = memo;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    pc28LottoRooms.siteId = siteId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    pc28LottoRooms.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pc28LottoRooms.id = id;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    pc28LottoRooms.state = state;
  }
  final List<Pc28LottoRoomsTables>? tables = (json['tables'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<Pc28LottoRoomsTables>(e) as Pc28LottoRoomsTables)
      .toList();
  if (tables != null) {
    pc28LottoRooms.tables = tables;
  }
  return pc28LottoRooms;
}

Map<String, dynamic> $Pc28LottoRoomsToJson(Pc28LottoRooms entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameType'] = entity.gameType;
  data['stateMsg'] = entity.stateMsg;
  data['createTime'] = entity.createTime;
  data['memo2'] = entity.memo2;
  data['memo'] = entity.memo;
  data['siteId'] = entity.siteId;
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['state'] = entity.state;
  data['tables'] = entity.tables?.map((v) => v.toJson()).toList();
  return data;
}

extension Pc28LottoRoomsExtension on Pc28LottoRooms {
  Pc28LottoRooms copyWith({
    String? gameType,
    String? stateMsg,
    int? createTime,
    String? memo2,
    String? memo,
    int? siteId,
    int? updateTime,
    int? id,
    int? state,
    List<Pc28LottoRoomsTables>? tables,
  }) {
    return Pc28LottoRooms()
      ..gameType = gameType ?? this.gameType
      ..stateMsg = stateMsg ?? this.stateMsg
      ..createTime = createTime ?? this.createTime
      ..memo2 = memo2 ?? this.memo2
      ..memo = memo ?? this.memo
      ..siteId = siteId ?? this.siteId
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..state = state ?? this.state
      ..tables = tables ?? this.tables;
  }
}

Pc28LottoRoomsTables $Pc28LottoRoomsTablesFromJson(Map<String, dynamic> json) {
  final Pc28LottoRoomsTables pc28LottoRoomsTables = Pc28LottoRoomsTables();
  final String? gameType = jsonConvert.convert<String>(json['gameType']);
  if (gameType != null) {
    pc28LottoRoomsTables.gameType = gameType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pc28LottoRoomsTables.createTime = createTime;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    pc28LottoRoomsTables.level = level;
  }
  final String? memo2 = jsonConvert.convert<String>(json['memo2']);
  if (memo2 != null) {
    pc28LottoRoomsTables.memo2 = memo2;
  }
  final String? memo1 = jsonConvert.convert<String>(json['memo1']);
  if (memo1 != null) {
    pc28LottoRoomsTables.memo1 = memo1;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pc28LottoRoomsTables.name = name;
  }
  final dynamic siteId = json['siteId'];
  if (siteId != null) {
    pc28LottoRoomsTables.siteId = siteId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    pc28LottoRoomsTables.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pc28LottoRoomsTables.id = id;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    pc28LottoRoomsTables.state = state;
  }
  final int? roomId = jsonConvert.convert<int>(json['roomId']);
  if (roomId != null) {
    pc28LottoRoomsTables.roomId = roomId;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    pc28LottoRoomsTables.title = title;
  }
  return pc28LottoRoomsTables;
}

Map<String, dynamic> $Pc28LottoRoomsTablesToJson(Pc28LottoRoomsTables entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameType'] = entity.gameType;
  data['createTime'] = entity.createTime;
  data['level'] = entity.level;
  data['memo2'] = entity.memo2;
  data['memo1'] = entity.memo1;
  data['name'] = entity.name;
  data['siteId'] = entity.siteId;
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['state'] = entity.state;
  data['roomId'] = entity.roomId;
  data['title'] = entity.title;
  return data;
}

extension Pc28LottoRoomsTablesExtension on Pc28LottoRoomsTables {
  Pc28LottoRoomsTables copyWith({
    String? gameType,
    int? createTime,
    int? level,
    String? memo2,
    String? memo1,
    String? name,
    dynamic siteId,
    int? updateTime,
    int? id,
    int? state,
    int? roomId,
    String? title,
  }) {
    return Pc28LottoRoomsTables()
      ..gameType = gameType ?? this.gameType
      ..createTime = createTime ?? this.createTime
      ..level = level ?? this.level
      ..memo2 = memo2 ?? this.memo2
      ..memo1 = memo1 ?? this.memo1
      ..name = name ?? this.name
      ..siteId = siteId ?? this.siteId
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..state = state ?? this.state
      ..roomId = roomId ?? this.roomId
      ..title = title ?? this.title;
  }
}