import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/app/global.dart';


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
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    baseApiOssEntity.updateTime = updateTime;
  }
  final String? download = jsonConvert.convert<String>(json['download']);
  if (download != null) {
    baseApiOssEntity.download = download;
  }
  return baseApiOssEntity;
}

Map<String, dynamic> $BaseApiOssEntityToJson(BaseApiOssEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['baseAPIs'] = entity.baseAPIs;
  data['webSockets'] = entity.webSockets;
  data['dns'] = entity.dns;
  data['updateTime'] = entity.updateTime;
  data['download'] = entity.download;
  return data;
}

extension BaseApiOssEntityExtension on BaseApiOssEntity {
  BaseApiOssEntity copyWith({
    List<String>? baseAPIs,
    List<String>? webSockets,
    List<String>? dns,
    int? updateTime,
    String? download,
  }) {
    return BaseApiOssEntity()
      ..baseAPIs = baseAPIs ?? this.baseAPIs
      ..webSockets = webSockets ?? this.webSockets
      ..dns = dns ?? this.dns
      ..updateTime = updateTime ?? this.updateTime
      ..download = download ?? this.download;
  }
}

BaseWsApiEntity $BaseWsApiEntityFromJson(Map<String, dynamic> json) {
  final BaseWsApiEntity baseWsApiEntity = BaseWsApiEntity();
  final String? baseApi = jsonConvert.convert<String>(json['baseApi']);
  if (baseApi != null) {
    baseWsApiEntity.baseApi = baseApi;
  }
  final String? webSocket = jsonConvert.convert<String>(json['webSocket']);
  if (webSocket != null) {
    baseWsApiEntity.webSocket = webSocket;
  }
  final int? delayTime = jsonConvert.convert<int>(json['delayTime']);
  if (delayTime != null) {
    baseWsApiEntity.delayTime = delayTime;
  }
  final int? index = jsonConvert.convert<int>(json['index']);
  if (index != null) {
    baseWsApiEntity.index = index;
  }
  return baseWsApiEntity;
}

Map<String, dynamic> $BaseWsApiEntityToJson(BaseWsApiEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['baseApi'] = entity.baseApi;
  data['webSocket'] = entity.webSocket;
  data['delayTime'] = entity.delayTime;
  data['index'] = entity.index;
  return data;
}

extension BaseWsApiEntityExtension on BaseWsApiEntity {
  BaseWsApiEntity copyWith({
    String? baseApi,
    String? webSocket,
    int? delayTime,
    int? index,
  }) {
    return BaseWsApiEntity()
      ..baseApi = baseApi ?? this.baseApi
      ..webSocket = webSocket ?? this.webSocket
      ..delayTime = delayTime ?? this.delayTime
      ..index = index ?? this.index;
  }
}