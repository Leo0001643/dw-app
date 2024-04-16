import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/ota_version_entity.dart';

OtaVersionEntity $OtaVersionEntityFromJson(Map<String, dynamic> json) {
  final OtaVersionEntity otaVersionEntity = OtaVersionEntity();
  final OtaVersionIOS? iOS = jsonConvert.convert<OtaVersionIOS>(json['iOS']);
  if (iOS != null) {
    otaVersionEntity.iOS = iOS;
  }
  final OtaVersionIOS? android = jsonConvert.convert<OtaVersionIOS>(
      json['Android']);
  if (android != null) {
    otaVersionEntity.android = android;
  }
  return otaVersionEntity;
}

Map<String, dynamic> $OtaVersionEntityToJson(OtaVersionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['iOS'] = entity.iOS?.toJson();
  data['Android'] = entity.android?.toJson();
  return data;
}

extension OtaVersionEntityExtension on OtaVersionEntity {
  OtaVersionEntity copyWith({
    OtaVersionIOS? iOS,
    OtaVersionIOS? android,
  }) {
    return OtaVersionEntity()
      ..iOS = iOS ?? this.iOS
      ..android = android ?? this.android;
  }
}

OtaVersionIOS $OtaVersionIOSFromJson(Map<String, dynamic> json) {
  final OtaVersionIOS otaVersionIOS = OtaVersionIOS();
  final String? note = jsonConvert.convert<String>(json['note']);
  if (note != null) {
    otaVersionIOS.note = note;
  }
  final String? minVersion = jsonConvert.convert<String>(json['minVersion']);
  if (minVersion != null) {
    otaVersionIOS.minVersion = minVersion;
  }
  final String? must = jsonConvert.convert<String>(json['must']);
  if (must != null) {
    otaVersionIOS.must = must;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    otaVersionIOS.version = version;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    otaVersionIOS.url = url;
  }
  return otaVersionIOS;
}

Map<String, dynamic> $OtaVersionIOSToJson(OtaVersionIOS entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['note'] = entity.note;
  data['minVersion'] = entity.minVersion;
  data['must'] = entity.must;
  data['version'] = entity.version;
  data['url'] = entity.url;
  return data;
}

extension OtaVersionIOSExtension on OtaVersionIOS {
  OtaVersionIOS copyWith({
    String? note,
    String? minVersion,
    String? must,
    String? version,
    String? url,
  }) {
    return OtaVersionIOS()
      ..note = note ?? this.note
      ..minVersion = minVersion ?? this.minVersion
      ..must = must ?? this.must
      ..version = version ?? this.version
      ..url = url ?? this.url;
  }
}