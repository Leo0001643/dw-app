import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';

BaseApiOssEntity $BaseApiOssEntityFromJson(Map<String, dynamic> json) {
  final BaseApiOssEntity baseApiOssEntity = BaseApiOssEntity();
  final List<String>? baseAPIs = (json['baseAPIs'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (baseAPIs != null) {
    baseApiOssEntity.baseAPIs = baseAPIs;
  }
  final List<String>? webSockets = (json['webSockets'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (webSockets != null) {
    baseApiOssEntity.webSockets = webSockets;
  }
  final List<String>? dns = (json['dns'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (dns != null) {
    baseApiOssEntity.dns = dns;
  }
  return baseApiOssEntity;
}

Map<String, dynamic> $BaseApiOssEntityToJson(BaseApiOssEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['baseAPIs'] = entity.baseAPIs;
  data['webSockets'] = entity.webSockets;
  data['dns'] = entity.dns;
  return data;
}

extension BaseApiOssEntityExtension on BaseApiOssEntity {
  BaseApiOssEntity copyWith({
    List<String>? baseAPIs,
    List<String>? webSockets,
    List<String>? dns,
  }) {
    return BaseApiOssEntity()
      ..baseAPIs = baseAPIs ?? this.baseAPIs
      ..webSockets = webSockets ?? this.webSockets
      ..dns = dns ?? this.dns;
  }
}