
import 'dart:convert';

import 'package:leisure_games/generated/json/base/json_field.dart';
import 'package:leisure_games/generated/json/device_info.g.dart';

@JsonSerializable()
class DeviceInfo{

  String? name;
  String? systemName;
  String? systemVersion;
  String? model;
  String? version;

  DeviceInfo({this.name, this.systemName, this.systemVersion, this.model, this.version});

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => $DeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => $DeviceInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }



}


