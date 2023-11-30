import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/app/intl/intr.dart';


UsdtChannelEntity $UsdtChannelEntityFromJson(Map<String, dynamic> json) {
  final UsdtChannelEntity usdtChannelEntity = UsdtChannelEntity();
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    usdtChannelEntity.mobile = mobile;
  }
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    usdtChannelEntity.account = account;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    usdtChannelEntity.type = type;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    usdtChannelEntity.status = status;
  }
  return usdtChannelEntity;
}

Map<String, dynamic> $UsdtChannelEntityToJson(UsdtChannelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mobile'] = entity.mobile;
  data['account'] = entity.account;
  data['type'] = entity.type;
  data['status'] = entity.status;
  return data;
}

extension UsdtChannelEntityExtension on UsdtChannelEntity {
  UsdtChannelEntity copyWith({
    String? mobile,
    String? account,
    String? type,
    int? status,
  }) {
    return UsdtChannelEntity()
      ..mobile = mobile ?? this.mobile
      ..account = account ?? this.account
      ..type = type ?? this.type
      ..status = status ?? this.status;
  }
}