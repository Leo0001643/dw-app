part of 'recharge_logic.dart';

// 跳转至线上充值页面所需参数
class OnlinePageArgs {
  final OnlineCategory category;
  final OnlineInfo onlineInfo;

  OnlinePageArgs({
    required this.category,
    required this.onlineInfo,
  });
  @override
  String toString() {
    return "category:" +
        category.toString() +
        "  onlineInfo:" +
        onlineInfo.toString();
  }
}

// 跳转至转账汇款页面所需参数
class TransferPageArgs {
  final TransferCategory category;
  final TransferProduct product;
  final DepositYhEntity rate;
  final String? amount; //b97使用

  TransferPageArgs(
      {required this.category,
      required this.product,
      required this.rate,
      this.amount});
}

class TransferChannelArgs {
  final TransferCategory category;
  final DepositYhEntity rate;
  final String? typeTitle;

  TransferChannelArgs(
      {required this.category, required this.rate, this.typeTitle});
}

// 转账汇款表单字段
class RechargeFormFields {
  static String cunkuanren = 'cunkuanren';
  static String money = 'money';
  static String order = 'order';
}
