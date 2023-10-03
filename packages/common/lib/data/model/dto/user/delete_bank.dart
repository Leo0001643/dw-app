class DeleteBankDto {
  int? id;
  String? bankname;
  String? bankcard;
  String? bankkaihu;
  int? userId;
  int? type;
  String? extInfo;

  DeleteBankDto(
      {this.id,
      this.bankname,
      this.bankcard,
      this.bankkaihu,
      this.userId,
      this.type,
      this.extInfo});

  DeleteBankDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankname = json['bankname'];
    bankcard = json['bankcard'];
    bankkaihu = json['bankkaihu'];
    userId = json['user_id'];
    type = json['type'];
    extInfo = json['ext_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bankname'] = bankname;
    data['bankcard'] = bankcard;
    data['bankkaihu'] = bankkaihu;
    data['user_id'] = userId;
    data['type'] = type;
    data['ext_info'] = extInfo;
    return data;
  }
}
