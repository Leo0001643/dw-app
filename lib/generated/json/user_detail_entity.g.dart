import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/user_detail_entity.dart';

UserDetailEntity $UserDetailEntityFromJson(Map<String, dynamic> json) {
  final UserDetailEntity userDetailEntity = UserDetailEntity();
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userDetailEntity.email = email;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    userDetailEntity.mobile = mobile;
  }
  final String? qq = jsonConvert.convert<String>(json['qq']);
  if (qq != null) {
    userDetailEntity.qq = qq;
  }
  final String? wechat = jsonConvert.convert<String>(json['wechat']);
  if (wechat != null) {
    userDetailEntity.wechat = wechat;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userDetailEntity.username = username;
  }
  final String? realName = jsonConvert.convert<String>(json['realName']);
  if (realName != null) {
    userDetailEntity.realName = realName;
  }
  final String? alias = jsonConvert.convert<String>(json['alias']);
  if (alias != null) {
    userDetailEntity.alias = alias;
  }
  final int? aliasCount = jsonConvert.convert<int>(json['aliasCount']);
  if (aliasCount != null) {
    userDetailEntity.aliasCount = aliasCount;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    userDetailEntity.siteId = siteId;
  }
  return userDetailEntity;
}

Map<String, dynamic> $UserDetailEntityToJson(UserDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = entity.email;
  data['mobile'] = entity.mobile;
  data['qq'] = entity.qq;
  data['wechat'] = entity.wechat;
  data['username'] = entity.username;
  data['realName'] = entity.realName;
  data['alias'] = entity.alias;
  data['aliasCount'] = entity.aliasCount;
  data['siteId'] = entity.siteId;
  return data;
}

extension UserDetailEntityExtension on UserDetailEntity {
  UserDetailEntity copyWith({
    String? email,
    String? mobile,
    String? qq,
    String? wechat,
    String? username,
    String? realName,
    String? alias,
    int? aliasCount,
    int? siteId,
  }) {
    return UserDetailEntity()
      ..email = email ?? this.email
      ..mobile = mobile ?? this.mobile
      ..qq = qq ?? this.qq
      ..wechat = wechat ?? this.wechat
      ..username = username ?? this.username
      ..realName = realName ?? this.realName
      ..alias = alias ?? this.alias
      ..aliasCount = aliasCount ?? this.aliasCount
      ..siteId = siteId ?? this.siteId;
  }
}