import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/device_info.dart';

DeviceInfo $DeviceInfoFromJson(Map<String, dynamic> json) {
  final DeviceInfo deviceInfo = DeviceInfo();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    deviceInfo.name = name;
  }
  final String? systemName = jsonConvert.convert<String>(json['systemName']);
  if (systemName != null) {
    deviceInfo.systemName = systemName;
  }
  final String? systemVersion = jsonConvert.convert<String>(
      json['systemVersion']);
  if (systemVersion != null) {
    deviceInfo.systemVersion = systemVersion;
  }
  final String? model = jsonConvert.convert<String>(json['model']);
  if (model != null) {
    deviceInfo.model = model;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    deviceInfo.version = version;
  }
  return deviceInfo;
}

Map<String, dynamic> $DeviceInfoToJson(DeviceInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['systemName'] = entity.systemName;
  data['systemVersion'] = entity.systemVersion;
  data['model'] = entity.model;
  data['version'] = entity.version;
  return data;
}

extension DeviceInfoExtension on DeviceInfo {
  DeviceInfo copyWith({
    String? name,
    String? systemName,
    String? systemVersion,
    String? model,
    String? version,
  }) {
    return DeviceInfo()
      ..name = name ?? this.name
      ..systemName = systemName ?? this.systemName
      ..systemVersion = systemVersion ?? this.systemVersion
      ..model = model ?? this.model
      ..version = version ?? this.version;
  }
}