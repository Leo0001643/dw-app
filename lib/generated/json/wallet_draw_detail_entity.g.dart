import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/wallet_draw_detail_entity.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';


WalletDrawDetailEntity $WalletDrawDetailEntityFromJson(
    Map<String, dynamic> json) {
  final WalletDrawDetailEntity walletDrawDetailEntity = WalletDrawDetailEntity();
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    walletDrawDetailEntity.mobile = mobile;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    walletDrawDetailEntity.username = username;
  }
  final String? realName = jsonConvert.convert<String>(json['realName']);
  if (realName != null) {
    walletDrawDetailEntity.realName = realName;
  }
  final int? isSetBankPwd = jsonConvert.convert<int>(json['isSetBankPwd']);
  if (isSetBankPwd != null) {
    walletDrawDetailEntity.isSetBankPwd = isSetBankPwd;
  }
  final List<UsdtChannelEntity>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<UsdtChannelEntity>(e) as UsdtChannelEntity)
      .toList();
  if (list != null) {
    walletDrawDetailEntity.list = list;
  }
  return walletDrawDetailEntity;
}

Map<String, dynamic> $WalletDrawDetailEntityToJson(
    WalletDrawDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mobile'] = entity.mobile;
  data['username'] = entity.username;
  data['realName'] = entity.realName;
  data['isSetBankPwd'] = entity.isSetBankPwd;
  data['list'] = entity.list?.map((v) => v.toJson()).toList();
  return data;
}

extension WalletDrawDetailEntityExtension on WalletDrawDetailEntity {
  WalletDrawDetailEntity copyWith({
    String? mobile,
    String? username,
    String? realName,
    int? isSetBankPwd,
    List<UsdtChannelEntity>? list,
  }) {
    return WalletDrawDetailEntity()
      ..mobile = mobile ?? this.mobile
      ..username = username ?? this.username
      ..realName = realName ?? this.realName
      ..isSetBankPwd = isSetBankPwd ?? this.isSetBankPwd
      ..list = list ?? this.list;
  }
}