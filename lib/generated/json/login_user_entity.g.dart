import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/login_user_entity.dart';

LoginUserEntity $LoginUserEntityFromJson(Map<String, dynamic> json) {
  final LoginUserEntity loginUserEntity = LoginUserEntity();
  final int? logintime = jsonConvert.convert<int>(json['logintime']);
  if (logintime != null) {
    loginUserEntity.logintime = logintime;
  }
  final String? agent = jsonConvert.convert<String>(json['agent']);
  if (agent != null) {
    loginUserEntity.agent = agent;
  }
  final String? topUsername = jsonConvert.convert<String>(json['topUsername']);
  if (topUsername != null) {
    loginUserEntity.topUsername = topUsername;
  }
  final int? ulevel = jsonConvert.convert<int>(json['ulevel']);
  if (ulevel != null) {
    loginUserEntity.ulevel = ulevel;
  }
  final int? moneyStatus = jsonConvert.convert<int>(json['moneyStatus']);
  if (moneyStatus != null) {
    loginUserEntity.moneyStatus = moneyStatus;
  }
  final String? oid = jsonConvert.convert<String>(json['oid']);
  if (oid != null) {
    loginUserEntity.oid = oid;
  }
  final String? corprator = jsonConvert.convert<String>(json['corprator']);
  if (corprator != null) {
    loginUserEntity.corprator = corprator;
  }
  final int? expireat = jsonConvert.convert<int>(json['expireat']);
  if (expireat != null) {
    loginUserEntity.expireat = expireat;
  }
  final String? realname = jsonConvert.convert<String>(json['realname']);
  if (realname != null) {
    loginUserEntity.realname = realname;
  }
  final String? alias = jsonConvert.convert<String>(json['alias']);
  if (alias != null) {
    loginUserEntity.alias = alias;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    loginUserEntity.avatar = avatar;
  }
  final int? lastLoginTime = jsonConvert.convert<int>(json['lastLoginTime']);
  if (lastLoginTime != null) {
    loginUserEntity.lastLoginTime = lastLoginTime;
  }
  final String? world = jsonConvert.convert<String>(json['world']);
  if (world != null) {
    loginUserEntity.world = world;
  }
  final String? loginip = jsonConvert.convert<String>(json['loginip']);
  if (loginip != null) {
    loginUserEntity.loginip = loginip;
  }
  final int? deposit = jsonConvert.convert<int>(json['deposit']);
  if (deposit != null) {
    loginUserEntity.deposit = deposit;
  }
  final int? freeTran = jsonConvert.convert<int>(json['freeTran']);
  if (freeTran != null) {
    loginUserEntity.freeTran = freeTran;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    loginUserEntity.id = id;
  }
  final int? userType = jsonConvert.convert<int>(json['userType']);
  if (userType != null) {
    loginUserEntity.userType = userType;
  }
  final int? grade = jsonConvert.convert<int>(json['grade']);
  if (grade != null) {
    loginUserEntity.grade = grade;
  }
  final String? gradeName = jsonConvert.convert<String>(json['gradeName']);
  if (gradeName != null) {
    loginUserEntity.gradeName = gradeName;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    loginUserEntity.username = username;
  }
  final int? mustChangePw = jsonConvert.convert<int>(json['mustChangePw']);
  if (mustChangePw != null) {
    loginUserEntity.mustChangePw = mustChangePw;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    loginUserEntity.currency = currency;
  }
  final dynamic language = json['language'];
  if (language != null) {
    loginUserEntity.language = language;
  }
  final String? superName = jsonConvert.convert<String>(json['super']);
  if (superName != null) {
    loginUserEntity.superName = superName;
  }
  final int? upoints = jsonConvert.convert<int>(json['upoints']);
  if (upoints != null) {
    loginUserEntity.upoints = upoints;
  }
  return loginUserEntity;
}

Map<String, dynamic> $LoginUserEntityToJson(LoginUserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['logintime'] = entity.logintime;
  data['agent'] = entity.agent;
  data['topUsername'] = entity.topUsername;
  data['ulevel'] = entity.ulevel;
  data['moneyStatus'] = entity.moneyStatus;
  data['oid'] = entity.oid;
  data['corprator'] = entity.corprator;
  data['expireat'] = entity.expireat;
  data['realname'] = entity.realname;
  data['alias'] = entity.alias;
  data['avatar'] = entity.avatar;
  data['lastLoginTime'] = entity.lastLoginTime;
  data['world'] = entity.world;
  data['loginip'] = entity.loginip;
  data['deposit'] = entity.deposit;
  data['freeTran'] = entity.freeTran;
  data['id'] = entity.id;
  data['userType'] = entity.userType;
  data['grade'] = entity.grade;
  data['gradeName'] = entity.gradeName;
  data['username'] = entity.username;
  data['mustChangePw'] = entity.mustChangePw;
  data['currency'] = entity.currency;
  data['language'] = entity.language;
  data['super'] = entity.superName;
  data['upoints'] = entity.upoints;
  return data;
}

extension LoginUserEntityExtension on LoginUserEntity {
  LoginUserEntity copyWith({
    int? logintime,
    String? agent,
    String? topUsername,
    int? ulevel,
    int? moneyStatus,
    String? oid,
    String? corprator,
    int? expireat,
    String? realname,
    String? alias,
    String? avatar,
    int? lastLoginTime,
    String? world,
    String? loginip,
    int? deposit,
    int? freeTran,
    int? id,
    int? userType,
    int? grade,
    String? gradeName,
    String? username,
    int? mustChangePw,
    String? currency,
    dynamic language,
    String? superName,
    int? upoints,
  }) {
    return LoginUserEntity()
      ..logintime = logintime ?? this.logintime
      ..agent = agent ?? this.agent
      ..topUsername = topUsername ?? this.topUsername
      ..ulevel = ulevel ?? this.ulevel
      ..moneyStatus = moneyStatus ?? this.moneyStatus
      ..oid = oid ?? this.oid
      ..corprator = corprator ?? this.corprator
      ..expireat = expireat ?? this.expireat
      ..realname = realname ?? this.realname
      ..alias = alias ?? this.alias
      ..avatar = avatar ?? this.avatar
      ..lastLoginTime = lastLoginTime ?? this.lastLoginTime
      ..world = world ?? this.world
      ..loginip = loginip ?? this.loginip
      ..deposit = deposit ?? this.deposit
      ..freeTran = freeTran ?? this.freeTran
      ..id = id ?? this.id
      ..userType = userType ?? this.userType
      ..grade = grade ?? this.grade
      ..gradeName = gradeName ?? this.gradeName
      ..username = username ?? this.username
      ..mustChangePw = mustChangePw ?? this.mustChangePw
      ..currency = currency ?? this.currency
      ..language = language ?? this.language
      ..superName = superName ?? this.superName
      ..upoints = upoints ?? this.upoints;
  }
}