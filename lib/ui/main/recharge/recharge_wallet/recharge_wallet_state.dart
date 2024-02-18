import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/jump_payment_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class RechargeWalletState {
  RechargeWalletState() {
    ///Initialize variables
  }

  var title = "".obs;

  ///支付方式
  var paymentList = PaymentListEntity().obs;

  var selectIndex = 0.obs;

  var channelList = RxList<JumpPaymentEntity>.empty(growable: true);

  ///汇款金额
  var remitAmount = "".obs;

  ///收款方信息
  var paymentInfo = PaymentListBanks().obs;


}
