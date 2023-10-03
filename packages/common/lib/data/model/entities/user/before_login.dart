class BeforeLoginEntity {
  BeforeLoginInfoEntity? info;

  BeforeLoginEntity({this.info});

  BeforeLoginEntity.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null
        ? BeforeLoginInfoEntity.fromJson(json['info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class BeforeLoginInfoEntity {
  String? beforeTime;
  String? beforeIp;
  String? beforeCountry;
  String? beforeRegion;
  String? beforeCity;
  String? beforeCounty;
  String? beforeDevice;
  String? registerTime;
  int? loginCount;

  BeforeLoginInfoEntity(
      {this.beforeTime,
      this.beforeIp,
      this.beforeCountry,
      this.beforeRegion,
      this.beforeCity,
      this.beforeCounty,
      this.beforeDevice,
      this.registerTime,
      this.loginCount});

  BeforeLoginInfoEntity.fromJson(Map<String, dynamic> json) {
    beforeTime = json['before_time'];
    beforeIp = json['before_ip'];
    beforeCountry = json['before_country'];
    beforeRegion = json['before_region'];
    beforeCity = json['before_city'];
    beforeCounty = json['before_county'];
    beforeDevice = "${json['before_device']}";
    registerTime = json['register_time'];
    loginCount = json['login_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['before_time'] = beforeTime;
    data['before_ip'] = beforeIp;
    data['before_country'] = beforeCountry;
    data['before_region'] = beforeRegion;
    data['before_city'] = beforeCity;
    data['before_county'] = beforeCounty;
    data['before_device'] = beforeDevice;
    data['register_time'] = registerTime;
    data['login_count'] = loginCount;
    return data;
  }
}
