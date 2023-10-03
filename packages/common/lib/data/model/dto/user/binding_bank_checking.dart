class BindingBankCheckingDto {
  String? truename;
  String? bankname;
  String? bankcard;
  String? bankkaihu;
  String? postid;
  String? userid;
  String? banktype;
  String? expire;
  String? cvv;
  String? qkpass;
  String? regphone;
  String? regmobilecode;

  BindingBankCheckingDto(
      {this.truename,
      this.bankname,
      this.bankcard,
      this.bankkaihu,
      this.postid,
      this.userid,
      this.banktype,
      this.expire,
      this.cvv,
      this.qkpass,
      this.regphone,
      this.regmobilecode});

  BindingBankCheckingDto.fromJson(Map<String, dynamic> json) {
    truename = json['truename'];
    bankname = json['bankname'];
    bankcard = json['bankcard'];
    bankkaihu = json['bankkaihu'];
    postid = json['id'];
    userid = json['user_id'];
    banktype = json['bank_type'];
    expire = json['expire'];
    cvv = json['cvv'];
    qkpass = json['qkpass'];
    regphone = json['reg_phone'];
    regmobilecode = json['reg_mobilecode'];
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
    data['qkpass'] = qkpass;
    data['reg_phone'] = regphone;
    data['reg_mobilecode'] = regmobilecode;
    return data;
  }
}

class BindingBankCheckingQkpassDto {
  String? qkpass;

  BindingBankCheckingQkpassDto({
    this.qkpass,
  });

  BindingBankCheckingQkpassDto.fromJson(Map<String, dynamic> json) {
    qkpass = json['qkpass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qkpass'] = qkpass;
    return data;
  }
}



class BindingBankCheckingRegphoneDto {
  String? regphone;

  BindingBankCheckingRegphoneDto({
    this.regphone,
  });

  BindingBankCheckingRegphoneDto.fromJson(Map<String, dynamic> json) {
    regphone = json['regphone'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['regphone'] = regphone;
      return data;
    }
  }
}


class MoneyDto {
  String? money;

  MoneyDto({
    this.money,
  });

  MoneyDto.fromJson(Map<String, dynamic> json) {
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['money'] = money;
    return data;
  }
}
