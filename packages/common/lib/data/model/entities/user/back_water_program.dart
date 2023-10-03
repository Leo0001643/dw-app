class BackWaterProgramEntity {
  bool? exist;
  int? fsType;
  int? statusCode;

  BackWaterProgramEntity({
    this.exist,
    this.fsType,
    this.statusCode,
  });

  BackWaterProgramEntity.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    fsType = json['fs_type'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exist'] = exist;
    data['fs_type'] = fsType;
    data['status_code'] = statusCode;
    return data;
  }
}