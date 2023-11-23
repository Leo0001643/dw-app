import 'package:get/get.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/ui/bean/deposit_log_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class RechargeRecordState {
  RechargeRecordState() {
    ///Initialize variables
  }

  var filterTime = [
    PaymentListBanks(bankName: Intr().jintian,id: 0),
    PaymentListBanks(bankName: Intr().zuijin7tain,id: 1),
    PaymentListBanks(bankName: Intr().zuijin30tian,id: 2),
  ];

  var filterWays = List<PaymentListBanks>.empty(growable: true);

  var filterStatus = [
    PaymentListBanks(bankName: Intr().quanbuzhuangtai,id: 0),
    PaymentListBanks(bankName: Intr().chenggong,id: 1),
    PaymentListBanks(bankName: Intr().chulizhong,id: 2),
    PaymentListBanks(bankName: Intr().yiquxiao,id: 3),
  ];

  var data = RxList<DepositLogEntity>.empty(growable: true);

  ///选择的付款方式
  var selectWay = PaymentListBanks(bankName: Intr().quanbufangshi).obs;

  ///选择的时间
  var selectTime = PaymentListBanks(bankName: Intr().jintian,id: 0).obs;

  ///选择的状态
  var selectStatus = PaymentListBanks(bankName: Intr().quanbuzhuangtai,id: 0).obs;


}
