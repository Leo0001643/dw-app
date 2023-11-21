import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class RechargeOfflineState {
  RechargeOfflineState() {
    ///Initialize variables
  }

  var selectIndex = 0.obs;

  var agreeList = RxList<PaymentChannelBankSet>.empty(growable: true);

  ///汇款人姓名
  var remitName = "";
  ///汇款金额
  var remitAmount = "";

  ///收款方信息
  var paymentInfo = PaymentListBanks().obs;

  ///银行转账的待选择银行列表
  var banks = List<BankEntity>.empty(growable: true);
  ///选择的银行
  var selectBank = BankEntity().obs;

}
