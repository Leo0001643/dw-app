import 'package:aone_common/common.dart';

class DepositYhEntity {
  double? yhRatio; // 线上支付优惠比例 应用至所有线上支付产品
  String? xmlRatio;
  int? stime;
  int? etime;
  int? statusCode;
  List<PaymentWays>? paymentWays; // 转账汇款优惠比例

  DepositYhEntity({
    this.yhRatio,
    this.xmlRatio,
    this.stime,
    this.etime,
    this.statusCode,
    this.paymentWays,
  });

  DepositYhEntity.fromJson(Map<String, dynamic> json) {
    yhRatio = double.parse('${json['yh_ratio']}');
    xmlRatio = '${json['xml_ratio']}';

    stime = json['stime'];
    etime = json['etime'];
    statusCode = json['status_code'];
    if (json['payment_ways'] != null) {
      paymentWays = <PaymentWays>[];
      json['payment_ways'].forEach((v) {
        paymentWays!.add(PaymentWays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['yh_ratio'] = yhRatio;
    data['xml_ratio'] = xmlRatio;
    data['stime'] = stime;
    data['etime'] = etime;
    data['status_code'] = statusCode;
    if (paymentWays != null) {
      data['payment_ways'] = paymentWays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentWays {
  String? name;
  int? id; /// 产品id 对应 [TransferCategory.id]
  double? yhRatioNew; // 优惠比例

  PaymentWays({
    this.name,
    this.id,
    this.yhRatioNew,
  });

  PaymentWays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    yhRatioNew = double.parse('${json['yh_ratio_new']}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['yh_ratio_new'] = yhRatioNew;
    return data;
  }
}
