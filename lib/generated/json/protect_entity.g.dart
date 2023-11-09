import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/protect_entity.dart';

ProtectEntity $ProtectEntityFromJson(Map<String, dynamic> json) {
  final ProtectEntity protectEntity = ProtectEntity();
  final ProtectProtect? protect = jsonConvert.convert<ProtectProtect>(
      json['protect']);
  if (protect != null) {
    protectEntity.protect = protect;
  }
  final int? userRegister = jsonConvert.convert<int>(json['userRegister']);
  if (userRegister != null) {
    protectEntity.userRegister = userRegister;
  }
  final int? agentRegister = jsonConvert.convert<int>(json['agentRegister']);
  if (agentRegister != null) {
    protectEntity.agentRegister = agentRegister;
  }
  final String? vcode = jsonConvert.convert<String>(json['vcode']);
  if (vcode != null) {
    protectEntity.vcode = vcode;
  }
  final String? registerCode = jsonConvert.convert<String>(
      json['registerCode']);
  if (registerCode != null) {
    protectEntity.registerCode = registerCode;
  }
  return protectEntity;
}

Map<String, dynamic> $ProtectEntityToJson(ProtectEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['protect'] = entity.protect?.toJson();
  data['userRegister'] = entity.userRegister;
  data['agentRegister'] = entity.agentRegister;
  data['vcode'] = entity.vcode;
  data['registerCode'] = entity.registerCode;
  return data;
}

extension ProtectEntityExtension on ProtectEntity {
  ProtectEntity copyWith({
    ProtectProtect? protect,
    int? userRegister,
    int? agentRegister,
    String? vcode,
    String? registerCode,
  }) {
    return ProtectEntity()
      ..protect = protect ?? this.protect
      ..userRegister = userRegister ?? this.userRegister
      ..agentRegister = agentRegister ?? this.agentRegister
      ..vcode = vcode ?? this.vcode
      ..registerCode = registerCode ?? this.registerCode;
  }
}

ProtectProtect $ProtectProtectFromJson(Map<String, dynamic> json) {
  final ProtectProtect protectProtect = ProtectProtect();
  final ProtectProtectKkwdsLive? kkwdsLive = jsonConvert.convert<
      ProtectProtectKkwdsLive>(json['kkwds_live']);
  if (kkwdsLive != null) {
    protectProtect.kkwdsLive = kkwdsLive;
  }
  final ProtectProtectBbSport? bbSport = jsonConvert.convert<
      ProtectProtectBbSport>(json['bb_sport']);
  if (bbSport != null) {
    protectProtect.bbSport = bbSport;
  }
  return protectProtect;
}

Map<String, dynamic> $ProtectProtectToJson(ProtectProtect entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['kkwds_live'] = entity.kkwdsLive?.toJson();
  data['bb_sport'] = entity.bbSport?.toJson();
  return data;
}

extension ProtectProtectExtension on ProtectProtect {
  ProtectProtect copyWith({
    ProtectProtectKkwdsLive? kkwdsLive,
    ProtectProtectBbSport? bbSport,
  }) {
    return ProtectProtect()
      ..kkwdsLive = kkwdsLive ?? this.kkwdsLive
      ..bbSport = bbSport ?? this.bbSport;
  }
}

ProtectProtectKkwdsLive $ProtectProtectKkwdsLiveFromJson(
    Map<String, dynamic> json) {
  final ProtectProtectKkwdsLive protectProtectKkwdsLive = ProtectProtectKkwdsLive();
  final String? tags = jsonConvert.convert<String>(json['tags']);
  if (tags != null) {
    protectProtectKkwdsLive.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    protectProtectKkwdsLive.title = title;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    protectProtectKkwdsLive.status = status;
  }
  final String? notice = jsonConvert.convert<String>(json['notice']);
  if (notice != null) {
    protectProtectKkwdsLive.notice = notice;
  }
  return protectProtectKkwdsLive;
}

Map<String, dynamic> $ProtectProtectKkwdsLiveToJson(
    ProtectProtectKkwdsLive entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tags'] = entity.tags;
  data['title'] = entity.title;
  data['status'] = entity.status;
  data['notice'] = entity.notice;
  return data;
}

extension ProtectProtectKkwdsLiveExtension on ProtectProtectKkwdsLive {
  ProtectProtectKkwdsLive copyWith({
    String? tags,
    String? title,
    String? status,
    String? notice,
  }) {
    return ProtectProtectKkwdsLive()
      ..tags = tags ?? this.tags
      ..title = title ?? this.title
      ..status = status ?? this.status
      ..notice = notice ?? this.notice;
  }
}

ProtectProtectBbSport $ProtectProtectBbSportFromJson(
    Map<String, dynamic> json) {
  final ProtectProtectBbSport protectProtectBbSport = ProtectProtectBbSport();
  final String? tags = jsonConvert.convert<String>(json['tags']);
  if (tags != null) {
    protectProtectBbSport.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    protectProtectBbSport.title = title;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    protectProtectBbSport.status = status;
  }
  final String? notice = jsonConvert.convert<String>(json['notice']);
  if (notice != null) {
    protectProtectBbSport.notice = notice;
  }
  return protectProtectBbSport;
}

Map<String, dynamic> $ProtectProtectBbSportToJson(
    ProtectProtectBbSport entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tags'] = entity.tags;
  data['title'] = entity.title;
  data['status'] = entity.status;
  data['notice'] = entity.notice;
  return data;
}

extension ProtectProtectBbSportExtension on ProtectProtectBbSport {
  ProtectProtectBbSport copyWith({
    String? tags,
    String? title,
    String? status,
    String? notice,
  }) {
    return ProtectProtectBbSport()
      ..tags = tags ?? this.tags
      ..title = title ?? this.title
      ..status = status ?? this.status
      ..notice = notice ?? this.notice;
  }
}