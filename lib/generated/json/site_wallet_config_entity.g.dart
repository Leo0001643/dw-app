import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/site_wallet_config_entity.dart';

SiteWalletConfigEntity $SiteWalletConfigEntityFromJson(
    Map<String, dynamic> json) {
  final SiteWalletConfigEntity siteWalletConfigEntity = SiteWalletConfigEntity();
  final String? afterCur = jsonConvert.convert<String>(json['afterCur']);
  if (afterCur != null) {
    siteWalletConfigEntity.afterCur = afterCur;
  }
  final int? allowTransfer = jsonConvert.convert<int>(json['allowTransfer']);
  if (allowTransfer != null) {
    siteWalletConfigEntity.allowTransfer = allowTransfer;
  }
  final String? beforeCur = jsonConvert.convert<String>(json['beforeCur']);
  if (beforeCur != null) {
    siteWalletConfigEntity.beforeCur = beforeCur;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    siteWalletConfigEntity.rate = rate;
  }
  final int? siteId = jsonConvert.convert<int>(json['siteId']);
  if (siteId != null) {
    siteWalletConfigEntity.siteId = siteId;
  }
  final String? walletType = jsonConvert.convert<String>(json['walletType']);
  if (walletType != null) {
    siteWalletConfigEntity.walletType = walletType;
  }
  return siteWalletConfigEntity;
}

Map<String, dynamic> $SiteWalletConfigEntityToJson(
    SiteWalletConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['afterCur'] = entity.afterCur;
  data['allowTransfer'] = entity.allowTransfer;
  data['beforeCur'] = entity.beforeCur;
  data['rate'] = entity.rate;
  data['siteId'] = entity.siteId;
  data['walletType'] = entity.walletType;
  return data;
}

extension SiteWalletConfigEntityExtension on SiteWalletConfigEntity {
  SiteWalletConfigEntity copyWith({
    String? afterCur,
    int? allowTransfer,
    String? beforeCur,
    double? rate,
    int? siteId,
    String? walletType,
  }) {
    return SiteWalletConfigEntity()
      ..afterCur = afterCur ?? this.afterCur
      ..allowTransfer = allowTransfer ?? this.allowTransfer
      ..beforeCur = beforeCur ?? this.beforeCur
      ..rate = rate ?? this.rate
      ..siteId = siteId ?? this.siteId
      ..walletType = walletType ?? this.walletType;
  }
}