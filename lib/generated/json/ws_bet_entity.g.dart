import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/app/socket/ws_bet_entity.dart';

WsBetEntity $WsBetEntityFromJson(Map<String, dynamic> json) {
  final WsBetEntity wsBetEntity = WsBetEntity();
  final String? moneyType = jsonConvert.convert<String>(json['moneyType']);
  if (moneyType != null) {
    wsBetEntity.moneyType = moneyType;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    wsBetEntity.nickname = nickname;
  }
  final String? term = jsonConvert.convert<String>(json['term']);
  if (term != null) {
    wsBetEntity.term = term;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    wsBetEntity.avatar = avatar;
  }
  final int? time = jsonConvert.convert<int>(json['time']);
  if (time != null) {
    wsBetEntity.time = time;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    wsBetEntity.type = type;
  }
  final List<WsBetContent>? content = (json['content'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<WsBetContent>(e) as WsBetContent).toList();
  if (content != null) {
    wsBetEntity.content = content;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    wsBetEntity.username = username;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    wsBetEntity.status = status;
  }
  return wsBetEntity;
}

Map<String, dynamic> $WsBetEntityToJson(WsBetEntity entity) {
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

extension WsBetEntityExtension on WsBetEntity {
  WsBetEntity copyWith({
    String? moneyType,
    String? nickname,
    String? term,
    String? avatar,
    int? time,
    String? type,
    List<WsBetContent>? content,
    String? username,
    int? status,
  }) {
    return WsBetEntity()
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

WsBetContent $WsBetContentFromJson(Map<String, dynamic> json) {
  final WsBetContent wsBetContent = WsBetContent();
  final String? a = jsonConvert.convert<String>(json['A']);
  if (a != null) {
    wsBetContent.a = a;
  }
  final String? b = jsonConvert.convert<String>(json['B']);
  if (b != null) {
    wsBetContent.b = b;
  }
  final String? c = jsonConvert.convert<String>(json['C']);
  if (c != null) {
    wsBetContent.c = c;
  }
  final String? d = jsonConvert.convert<String>(json['D']);
  if (d != null) {
    wsBetContent.d = d;
  }
  final String? e = jsonConvert.convert<String>(json['E']);
  if (e != null) {
    wsBetContent.e = e;
  }
  return wsBetContent;
}

Map<String, dynamic> $WsBetContentToJson(WsBetContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['A'] = entity.a;
  data['B'] = entity.b;
  data['C'] = entity.c;
  data['D'] = entity.d;
  data['E'] = entity.e;
  return data;
}

extension WsBetContentExtension on WsBetContent {
  WsBetContent copyWith({
    String? a,
    String? b,
    String? c,
    String? d,
    String? e,
  }) {
    return WsBetContent()
      ..a = a ?? this.a
      ..b = b ?? this.b
      ..c = c ?? this.c
      ..d = d ?? this.d
      ..e = e ?? this.e;
  }
}