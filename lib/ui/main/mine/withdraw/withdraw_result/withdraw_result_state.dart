import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/digiccy_deposit_data_entity.dart';

class WithdrawResultState {
  WithdrawResultState() {
    ///Initialize variables
  }

  ///结果
  var result = DigiccyDepositDataEntity().obs;

  ///余额
  var balance = "".obs;

}
