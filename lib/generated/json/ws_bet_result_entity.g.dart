import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/main/home/game_room/bean/ws_bet_result_entity.dart';

WsBetResultEntity $WsBetResultEntityFromJson(Map<String, dynamic> json) {
  final WsBetResultEntity wsBetResultEntity = WsBetResultEntity();
  final String? moneyType = jsonConvert.convert<String>(json['moneyType']);
  if (moneyType != null) {
    wsBetResultEntity.moneyType = moneyType;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    wsBetResultEntity.nickname = nickname;
  }
  final String? term = jsonConvert.convert<String>(json['term']);
  if (term != null) {
    wsBetResultEntity.term = term;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    wsBetResultEntity.avatar = avatar;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    wsBetResultEntity.time = time;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsBetResultEntity.type = type;
  }
  final List<BetContent>? content = (json['content'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BetContent>(e) as BetContent).toList();
  if (content != null) {
    wsBetResultEntity.content = content;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    wsBetResultEntity.username = username;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    wsBetResultEntity.status = status;
  }
  return wsBetResultEntity;
}

Map<String, dynamic> $WsBetResultEntityToJson(WsBetResultEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['moneyType'] = entity.moneyType;
  data['nickname'] = entity.nickname;
  data['term'] = entity.term;
  data['avatar'] = entity.avatar;
  data['time'] = entity.time;
  data['type'] = entity.type;
  data['content'] = entity.content?.map((v) => v.toJson()).toList();
  data['username'] = entity.username;
  data['status'] = entity.status;
  return data;
}

extension WsBetResultEntityExtension on WsBetResultEntity {
  WsBetResultEntity copyWith({
    String? moneyType,
    String? nickname,
    String? term,
    String? avatar,
    String? time,
    String? type,
    List<BetContent>? content,
    String? username,
    String? status,
  }) {
    return WsBetResultEntity()
      ..moneyType = moneyType ?? this.moneyType
      ..nickname = nickname ?? this.nickname
      ..term = term ?? this.term
      ..avatar = avatar ?? this.avatar
      ..time = time ?? this.time
      ..type = type ?? this.type
      ..content = content ?? this.content
      ..username = username ?? this.username
      ..status = status ?? this.status;
  }
}

BetContent $BetContentFromJson(Map<String, dynamic> json) {
  final BetContent betContent = BetContent();
  final String? a = jsonConvert.convert<String>(json['A']);
  if (a != null) {
    betContent.a = a;
  }
  final String? b = jsonConvert.convert<String>(json['B']);
  if (b != null) {
    betContent.b = b;
  }
  final String? c = jsonConvert.convert<String>(json['C']);
  if (c != null) {
    betContent.c = c;
  }
  final String? d = jsonConvert.convert<String>(json['D']);
  if (d != null) {
    betContent.d = d;
  }
  final String? e = jsonConvert.convert<String>(json['E']);
  if (e != null) {
    betContent.e = e;
  }
  return betContent;
}

Map<String, dynamic> $BetContentToJson(BetContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['A'] = entity.a;
  data['B'] = entity.b;
  data['C'] = entity.c;
  data['D'] = entity.d;
  data['E'] = entity.e;
  return data;
}

extension BetContentExtension on BetContent {
  BetContent copyWith({
    String? a,
    String? b,
    String? c,
    String? d,
    String? e,
  }) {
    return BetContent()
      ..a = a ?? this.a
      ..b = b ?? this.b
      ..c = c ?? this.c
      ..d = d ?? this.d
      ..e = e ?? this.e;
  }
}