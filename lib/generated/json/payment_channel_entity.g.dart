import 'package:leisure_games/generated/json/base/json_convert_content.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/jump_payment_entity.dart';


PaymentChannelEntity $PaymentChannelEntityFromJson(Map<String, dynamic> json) {
  final PaymentChannelEntity paymentChannelEntity = PaymentChannelEntity();
  final List<JumpPaymentEntity>? jumpPayment = (json['jumpPayment'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<JumpPaymentEntity>(e) as JumpPaymentEntity)
      .toList();
  if (jumpPayment != null) {
    paymentChannelEntity.jumpPayment = jumpPayment;
  }
  final List<PaymentChannelBankSet>? bankSet = (json['bankSet'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PaymentChannelBankSet>(e) as PaymentChannelBankSet)
      .toList();
  if (bankSet != null) {
    paymentChannelEntity.bankSet = bankSet;
  }
  return paymentChannelEntity;
}

Map<String, dynamic> $PaymentChannelEntityToJson(PaymentChannelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['jumpPayment'] = entity.jumpPayment?.map((v) => v.toJson()).toList();
  data['bankSet'] = entity.bankSet?.map((v) => v.toJson()).toList();
  return data;
}

extension PaymentChannelEntityExtension on PaymentChannelEntity {
  PaymentChannelEntity copyWith({
    List<JumpPaymentEntity>? jumpPayment,
    List<PaymentChannelBankSet>? bankSet,
  }) {
    return PaymentChannelEntity()
      ..jumpPayment = jumpPayment ?? this.jumpPayment
      ..bankSet = bankSet ?? this.bankSet;
  }
}

PaymentChannelBankSet $PaymentChannelBankSetFromJson(
    Map<String, dynamic> json) {
  final PaymentChannelBankSet paymentChannelBankSet = PaymentChannelBankSet();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    paymentChannelBankSet.id = id;
  }
  final int? bankId = jsonConvert.convert<int>(json['bankId']);
  if (bankId != null) {
    paymentChannelBankSet.bankId = bankId;
  }
  final String? cardNumber = jsonConvert.convert<String>(json['cardNumber']);
  if (cardNumber != null) {
    paymentChannelBankSet.cardNumber = cardNumber;
  }
  final String? cardUsername = jsonConvert.convert<String>(
      json['cardUsername']);
  if (cardUsername != null) {
    paymentChannelBankSet.cardUsername = cardUsername;
  }
  final dynamic controlCardName = json['controlCardName'];
  if (controlCardName != null) {
    paymentChannelBankSet.controlCardName = controlCardName;
  }
  final dynamic viewCardName = json['viewCardName'];
  if (viewCardName != null) {
    paymentChannelBankSet.viewCardName = viewCardName;
  }
  final String? bankBranch = jsonConvert.convert<String>(json['bankBranch']);
  if (bankBranch != null) {
    paymentChannelBankSet.bankBranch = bankBranch;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    paymentChannelBankSet.bankName = bankName;
  }
  final String? bankCode = jsonConvert.convert<String>(json['bankCode']);
  if (bankCode != null) {
    paymentChannelBankSet.bankCode = bankCode;
  }
  final dynamic bankUrl = json['bankUrl'];
  if (bankUrl != null) {
    paymentChannelBankSet.bankUrl = bankUrl;
  }
  final String? moneyQuick = jsonConvert.convert<String>(json['moneyQuick']);
  if (moneyQuick != null) {
    paymentChannelBankSet.moneyQuick = moneyQuick;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    paymentChannelBankSet.rate = rate;
  }
  final String? pic = jsonConvert.convert<String>(json['pic']);
  if (pic != null) {
    paymentChannelBankSet.pic = pic;
  }
  final String? payUrl = jsonConvert.convert<String>(json['payUrl']);
  if (payUrl != null) {
    paymentChannelBankSet.payUrl = payUrl;
  }
  final String? qrcodeLogo = jsonConvert.convert<String>(json['qrcodeLogo']);
  if (qrcodeLogo != null) {
    paymentChannelBankSet.qrcodeLogo = qrcodeLogo;
  }
  final dynamic payTip = json['payTip'];
  if (payTip != null) {
    paymentChannelBankSet.payTip = payTip;
  }
  final String? payMarks = jsonConvert.convert<String>(json['payMarks']);
  if (payMarks != null) {
    paymentChannelBankSet.payMarks = payMarks;
  }
  final int? marksColor = jsonConvert.convert<int>(json['marksColor']);
  if (marksColor != null) {
    paymentChannelBankSet.marksColor = marksColor;
  }
  return paymentChannelBankSet;
}

Map<String, dynamic> $PaymentChannelBankSetToJson(
    PaymentChannelBankSet entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankId'] = entity.bankId;
  data['cardNumber'] = entity.cardNumber;
  data['cardUsername'] = entity.cardUsername;
  data['controlCardName'] = entity.controlCardName;
  data['viewCardName'] = entity.viewCardName;
  data['bankBranch'] = entity.bankBranch;
  data['bankName'] = entity.bankName;
  data['bankCode'] = entity.bankCode;
  data['bankUrl'] = entity.bankUrl;
  data['moneyQuick'] = entity.moneyQuick;
  data['rate'] = entity.rate;
  data['pic'] = entity.pic;
  data['payUrl'] = entity.payUrl;
  data['qrcodeLogo'] = entity.qrcodeLogo;
  data['payTip'] = entity.payTip;
  data['payMarks'] = entity.payMarks;
  data['marksColor'] = entity.marksColor;
  return data;
}

extension PaymentChannelBankSetExtension on PaymentChannelBankSet {
  PaymentChannelBankSet copyWith({
    int? id,
    int? bankId,
    String? cardNumber,
    String? cardUsername,
    dynamic controlCardName,
    dynamic viewCardName,
    String? bankBranch,
    String? bankName,
    String? bankCode,
    dynamic bankUrl,
    String? moneyQuick,
    double? rate,
    String? pic,
    String? payUrl,
    String? qrcodeLogo,
    dynamic payTip,
    String? payMarks,
    int? marksColor,
  }) {
    return PaymentChannelBankSet()
      ..id = id ?? this.id
      ..bankId = bankId ?? this.bankId
      ..cardNumber = cardNumber ?? this.cardNumber
      ..cardUsername = cardUsername ?? this.cardUsername
      ..controlCardName = controlCardName ?? this.controlCardName
      ..viewCardName = viewCardName ?? this.viewCardName
      ..bankBranch = bankBranch ?? this.bankBranch
      ..bankName = bankName ?? this.bankName
      ..bankCode = bankCode ?? this.bankCode
      ..bankUrl = bankUrl ?? this.bankUrl
      ..moneyQuick = moneyQuick ?? this.moneyQuick
      ..rate = rate ?? this.rate
      ..pic = pic ?? this.pic
      ..payUrl = payUrl ?? this.payUrl
      ..qrcodeLogo = qrcodeLogo ?? this.qrcodeLogo
      ..payTip = payTip ?? this.payTip
      ..payMarks = payMarks ?? this.payMarks
      ..marksColor = marksColor ?? this.marksColor;
  }
}