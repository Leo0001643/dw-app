
import 'package:json_annotation/json_annotation.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/generated/json/usdt_entity.g.dart';

/// account : "T456432748798545679999"
/// status : 1
/// type : "USDT_TRC20"

@JsonSerializable()
class UsdtEntity {
  UsdtEntity({
    this.account,
    this.status,
    this.type,
  });

  String? account;
  num? status;
  String? type;

  UsdtEntity copyWith({
    String? account,
    num? status,
    String? type,
  }) =>
      UsdtEntity(
        account: account,
        status: status,
        type: type,
      );


  factory UsdtEntity.fromJson(Map<String, dynamic> json) => $UsdtEntityFromJson(json);

  Map<String, dynamic> toJson() => $UsdtEntityToJson(this);

  @override
  String toString() {
    if(isEmpty(account)|| account!.em().length < 14 ){
      return "$type${isEmpty(account) ? "" : "（${account.em()}）"}";
    } else {
      return "$type（***${account!.substring(14)}）";
    }
  }

}
