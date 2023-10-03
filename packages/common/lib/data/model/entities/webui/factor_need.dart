class FactorNeedEntity {
  bool? qktrue;
  bool? regPhone;
  bool? regMobilecode;
  bool? bankCard;
  String? truename;
  int? statusCode;
  int? messageCount;

  FactorNeedEntity(
      {this.qktrue,
        this.regPhone,
        this.regMobilecode,
        this.bankCard,
        this.truename,
        this.statusCode,
        this.messageCount});

  FactorNeedEntity.fromJson(Map<String, dynamic> json) {
    qktrue = json['qktrue'];
    regPhone = json['reg_phone'];
    regMobilecode = json['reg_mobilecode'];
    bankCard = json['bank_card'];
    truename = json['truename'];
    statusCode = json['status_code'];
    messageCount = json['message_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qktrue'] = this.qktrue;
    data['reg_phone'] = this.regPhone;
    data['reg_mobilecode'] = this.regMobilecode;
    data['bank_card'] = this.bankCard;
    data['truename'] = this.truename;
    data['status_code'] = this.statusCode;
    data['message_count'] = this.messageCount;
    return data;
  }
}
