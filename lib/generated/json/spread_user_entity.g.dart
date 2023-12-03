import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/spread_user_entity.dart';

SpreadUserEntity $SpreadUserEntityFromJson(Map<String, dynamic> json) {
  final SpreadUserEntity spreadUserEntity = SpreadUserEntity();
  final int? addtime = jsonConvert.convert<int>(json['addtime']);
  if (addtime != null) {
    spreadUserEntity.addtime = addtime;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    spreadUserEntity.avatar = avatar;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    spreadUserEntity.username = username;
  }
  return spreadUserEntity;
}

Map<String, dynamic> $SpreadUserEntityToJson(SpreadUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addtime'] = entity.addtime;
  data['avatar'] = entity.avatar;
  data['username'] = entity.username;
  return data;
}

extension SpreadUserEntityExtension on SpreadUserEntity {
  SpreadUserEntity copyWith({
    int? addtime,
    String? avatar,
    String? username,
  }) {
    return SpreadUserEntity()
      ..addtime = addtime ?? this.addtime
      ..avatar = avatar ?? this.avatar
      ..username = username ?? this.username;
  }
}