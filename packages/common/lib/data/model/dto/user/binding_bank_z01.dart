class BindingBankDtoZ01 {
  String? truename;
  String? bankname;
  String? bankcard;
  String? bankkaihu;
  String? postid;
  String? userid;
  String? banktype;
  String? expire;
  String? cvv;
  String? id;

  BindingBankDtoZ01(
      {this.truename,
      this.bankname,
      this.bankcard,
      this.bankkaihu,
      this.postid,
      this.userid,
      this.banktype,
      this.expire,
      this.cvv,
      this.id});

  BindingBankDtoZ01.fromJson(Map<String, dynamic> json) {
    truename = json['truename'];
    bankname = json['bankname'];
    bankcard = json['bankcard'];
    bankkaihu = json['bankkaihu'];
    postid = json['id'];
    userid = json['user_id'];
    banktype = json['bank_type'];
    expire = json['expire'];
    cvv = json['cvv'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['truename'] = truename;
    data['bankname'] = bankname;
    data['bankcard'] = bankcard;
    data['bankkaihu'] = bankkaihu;
    data['id'] = postid;
    data['user_id'] = userid;
    data['bank_type'] = banktype;
    data['expire'] = expire;
    data['cvv'] = cvv;
    data['id'] = id;
    return data;
  }
}
