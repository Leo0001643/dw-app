
class CheckQualificationEntity {
  QualifyInfo? info;
  int? statusCode;

  CheckQualificationEntity({this.info, this.statusCode});

  CheckQualificationEntity.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? QualifyInfo.fromJson(json['info']) : null;
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    data['status_code'] = statusCode;
    return data;
  }
}

class QualifyInfo {
  int? checkHb;

  QualifyInfo({this.checkHb});

  QualifyInfo.fromJson(Map<String, dynamic> json) {
    checkHb = json['check_hb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['check_hb'] = checkHb;
    return data;
  }
}
