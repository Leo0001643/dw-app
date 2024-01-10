import 'dart:convert';

/// account : "T456432748798545679999"
/// status : 1
/// type : "USDT_TRC20"

UsdtEntity usdtEntityFromJson(String str) =>
    UsdtEntity.fromJson(json.decode(str));

String usdtEntityToJson(UsdtEntity data) => json.encode(data.toJson());

class UsdtEntity {
  UsdtEntity({
    String? account,
    num? status,
    String? type,
  }) {
    _account = account;
    _status = status;
    _type = type;
  }

  UsdtEntity.fromJson(dynamic json) {
    _account = json['account'];
    _status = json['status'];
    _type = json['type'];
  }

  String? _account;
  num? _status;
  String? _type;

  UsdtEntity copyWith({
    String? account,
    num? status,
    String? type,
  }) =>
      UsdtEntity(
        account: account ?? _account,
        status: status ?? _status,
        type: type ?? _type,
      );

  String? get account => _account;

  num? get status => _status;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account'] = _account;
    map['status'] = _status;
    map['type'] = _type;
    return map;
  }
}
