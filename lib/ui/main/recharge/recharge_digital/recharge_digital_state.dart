import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/digiccy_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_channel_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class RechargeDigitalState {
  RechargeDigitalState() {
    ///Initialize variables
  }

  var title = "".obs;

  //选择的是在线 or 线下
  var selectOnline = true.obs;

  // var selectAgree = 0.obs;

  var agreeList = RxList<PaymentChannelBankSet>.empty(growable: true);
  var walletList = RxList<DigiccyChannelWallet>.empty(growable: true);

  var tabs = [Intr().xianshang,Intr().xianxia];

  var currentAccount = Object().obs;

  var paymentInfo = PaymentListBanks();
  ///支付方式
  var paymentList = PaymentListEntity().obs;

  ///钱包地址
  var walletAddress = "";
  ///汇款金额
  var remitAmount = "";
}
