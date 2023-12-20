import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/protect_entity.dart';

ProtectEntity $ProtectEntityFromJson(Map<String, dynamic> json) {
  final ProtectEntity protectEntity = ProtectEntity();
  final Map<String, ProtectProtectKkwdsLive?>? protect =
  (json['protect'] as Map<String, dynamic>?)?.map(
          (k, e) =>
          MapEntry(k,
              e == null ? null : jsonConvert.convert<ProtectProtectKkwdsLive>(
                  e)));
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
  data['protect'] = entity.protect;
  data['userRegister'] = entity.userRegister;
  data['agentRegister'] = entity.agentRegister;
  data['vcode'] = entity.vcode;
  data['registerCode'] = entity.registerCode;
  return data;
}

extension ProtectEntityExtension on ProtectEntity {
  ProtectEntity copyWith({
    Map<String, ProtectProtectKkwdsLive?>? protect,
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