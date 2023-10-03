class TixianDto {
  String? txTotal;
  String? qkpass;
  String? bankcard;
  int? id;
  int? mfCount;
  String? phoneCode;

  TixianDto(
      {this.txTotal,
      this.qkpass,
      this.bankcard,
      this.id,
      this.mfCount,
      this.phoneCode});

  TixianDto.fromJson(Map<String, dynamic> json) {
    txTotal = json['tx_total'];
    qkpass = json['qkpass'];
    bankcard = json['bankcard'];
    id = json['id'];
    mfCount = json['mf_count'];
    phoneCode = json['phone_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tx_total'] = this.txTotal;
    data['qkpass'] = this.qkpass;
    data['bankcard'] = this.bankcard;
    data['id'] = this.id;
    data['mf_count'] = this.mfCount;
    data['phone_code'] = this.phoneCode;
    return data;
  }
}

