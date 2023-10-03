

class CheckUpdateDto {
  String? currentVersion;
  String? devices;

  CheckUpdateDto({this.currentVersion, this.devices});

  CheckUpdateDto.fromJson(Map<String, dynamic> json) {
    currentVersion = json['current_version'];
    devices = json['devices'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_version'] = currentVersion;
    data['devices'] = devices;
    return data;
  }
}