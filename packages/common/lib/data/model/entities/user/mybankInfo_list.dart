// ignore_for_file: file_names, non_constant_identifier_names

class MyBankListInfoEntity {
  List<BankInfos>? banks;
  int? statusCode;
  String? truename;
  bool? txIstrue; //是否可以提现首先判断
  int? minTotal;
  int? maxTotal;
  int? isXml;
  String? sxfBs;
  String? huilv;
  int? txSCount;
  String? phoneCode;
  bool? bankUp;

  MyBankListInfoEntity(
      {this.banks,
      this.statusCode,
      this.truename,
      this.txIstrue,
      this.minTotal,
      this.maxTotal,
      this.isXml,
      this.sxfBs,
      this.huilv,
      this.txSCount,
      this.phoneCode,
      this.bankUp});

  MyBankListInfoEntity.fromJson(Map<String, dynamic> json) {
    banks = <BankInfos>[];
    if (json['bankinfo'] != null) {
      json['bankinfo'].forEach((v) {
        banks!.add(BankInfos.fromJson(v));
      });
    }
    truename = json['truename'];
    txIstrue = json['tx_istrue'];
    minTotal = json['min_total'];
    maxTotal = json['max_total'];
    isXml = json['is_xml'];
    sxfBs = '${json['sxf_bs']}';
    huilv = '${json['huilv']}';
    txSCount = json['tx_s_count'];
    phoneCode = json['phone_code'];
    statusCode = json['status_code'];
    bankUp = json['bank_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banks != null) {
      data['items']['bankinfo'] = banks!.map((v) => v.toJson()).toList();
    }
    data['status_code'] = statusCode;
    data['bank_up'] = bankUp;
    data['truename'] = truename;
    data['tx_istrue'] = txIstrue;
    data['min_total'] = minTotal;
    data['max_total'] = maxTotal;
    data['is_xml'] = isXml;
    data['sxf_bs'] = sxfBs;
    data['huilv'] = huilv;
    data['tx_s_count'] = txSCount;
    data['phone_code'] = phoneCode;
    return data;
  }
}

class BankInfos {
  int? id;
  String? bankkaihu;
  String? bankname;
  int? userId;
  int? type; //1 为银行   2 为区块链 3 电子钱包
  String? bankcard;
  String? extInfo;

  BankInfos({
    this.id,
    this.bankkaihu,
    this.bankname,
    this.userId,
    this.type,
    this.bankcard,
    this.extInfo,
  });

  BankInfos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankkaihu = json['bankkaihu'];
    bankname = json['bankname'];
    userId = json['user_id'];
    type = json['type'];
    bankcard = json['bankcard'];
    extInfo = json['ext_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bankkaihu'] = bankkaihu;
    data['bankname'] = bankname;
    data['user_id'] = userId;
    data['type'] = type;
    data['bankcard'] = bankcard;
    data['ext_info'] = extInfo;
    return data;
  }
}
