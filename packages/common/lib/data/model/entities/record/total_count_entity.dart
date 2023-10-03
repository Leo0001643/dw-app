class TotalCountEntity {
  TotalCountEntity({
      this.items, 
      this.statusCode,});

  TotalCountEntity.fromJson(Map<String, dynamic> json) {
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
    statusCode = json['status_code'];
  }
  Items? items;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.toJson();
    }
    map['status_code'] = statusCode;
    return map;
  }

}

class Items {
  Items({
    this.userPayTotal,
    this.userTxTotal,
    this.userYhTotal,
    this.betValid,
    this.dayUserPayTotal,
    this.dayUserTxTotal,
    this.dayUserYhTotal,
    this.dayBetValid,
    this.userFsTotal,
    this.dayUserFsTotal,});

  Items.fromJson(dynamic json) {
    userPayTotal = json['user_pay_total'];
    userTxTotal = json['user_tx_total'];
    userYhTotal = json['user_yh_total'];
    betValid = json['bet_valid'];
    dayUserPayTotal = json['day_user_pay_total'];
    dayUserTxTotal = json['day_user_tx_total'];
    dayUserYhTotal = json['day_user_yh_total'];
    dayBetValid = json['day_bet_valid'];
    userFsTotal = json['user_fs_total'];
    dayUserFsTotal = json['day_user_fs_total'];
  }
  String? userPayTotal;
  String? userTxTotal;
  String? userYhTotal;
  String? betValid;
  String? dayUserPayTotal;
  String? dayUserTxTotal;
  String? dayUserYhTotal;
  String? dayBetValid;
  String? userFsTotal;
  String? dayUserFsTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_pay_total'] = userPayTotal;
    map['user_tx_total'] = userTxTotal;
    map['user_yh_total'] = userYhTotal;
    map['bet_valid'] = betValid;
    map['day_user_pay_total'] = dayUserPayTotal;
    map['day_user_tx_total'] = dayUserTxTotal;
    map['day_user_yh_total'] = dayUserYhTotal;
    map['day_bet_valid'] = dayBetValid;
    map['user_fs_total'] = userFsTotal;
    map['day_user_fs_total'] = dayUserFsTotal;
    return map;
  }

}