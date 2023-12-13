import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/digiccy_channel_entity.dart';

DigiccyChannelEntity $DigiccyChannelEntityFromJson(Map<String, dynamic> json) {
  final DigiccyChannelEntity digiccyChannelEntity = DigiccyChannelEntity();
  final double? moneyDown = jsonConvert.convert<double>(json['moneyDown']);
  if (moneyDown != null) {
    digiccyChannelEntity.moneyDown = moneyDown;
  }
  final double? moneyUp = jsonConvert.convert<double>(json['moneyUp']);
  if (moneyUp != null) {
    digiccyChannelEntity.moneyUp = moneyUp;
  }
  final List<DigiccyChannelWallet>? wallet = (json['wallet'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<DigiccyChannelWallet>(e) as DigiccyChannelWallet)
      .toList();
  if (wallet != null) {
    digiccyChannelEntity.wallet = wallet;
  }
  return digiccyChannelEntity;
}

Map<String, dynamic> $DigiccyChannelEntityToJson(DigiccyChannelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['moneyDown'] = entity.moneyDown;
  data['moneyUp'] = entity.moneyUp;
  data['wallet'] = entity.wallet?.map((v) => v.toJson()).toList();
  return data;
}

extension DigiccyChannelEntityExtension on DigiccyChannelEntity {
  DigiccyChannelEntity copyWith({
    double? moneyDown,
    double? moneyUp,
    List<DigiccyChannelWallet>? wallet,
  }) {
    return DigiccyChannelEntity()
      ..moneyDown = moneyDown ?? this.moneyDown
      ..moneyUp = moneyUp ?? this.moneyUp
      ..wallet = wallet ?? this.wallet;
  }
}

DigiccyChannelWallet $DigiccyChannelWalletFromJson(Map<String, dynamic> json) {
  final DigiccyChannelWallet digiccyChannelWallet = DigiccyChannelWallet();
  final String? protocol = jsonConvert.convert<String>(json['protocol']);
  if (protocol != null) {
    digiccyChannelWallet.protocol = protocol;
  }
  final String? address = jsonConvert.convert<String>(json['address']);
  if (address != null) {
    digiccyChannelWallet.address = address;
  }
  final int? sequence = jsonConvert.convert<int>(json['sequence']);
  if (sequence != null) {
    digiccyChannelWallet.sequence = sequence;
  }
  return digiccyChannelWallet;
}

Map<String, dynamic> $DigiccyChannelWalletToJson(DigiccyChannelWallet entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['protocol'] = entity.protocol;
  data['address'] = entity.address;
  data['sequence'] = entity.sequence;
  return data;
}

extension DigiccyChannelWalletExtension on DigiccyChannelWallet {
  DigiccyChannelWallet copyWith({
    String? protocol,
    String? address,
    int? sequence,
  }) {
    return DigiccyChannelWallet()
      ..protocol = protocol ?? this.protocol
      ..address = address ?? this.address
      ..sequence = sequence ?? this.sequence;
  }
}