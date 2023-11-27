import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';

class AddBankState {
  AddBankState() {
    ///Initialize variables
  }


  ///银行转账的待选择银行列表
  var banks = List<BankEntity>.empty(growable: true);
  ///选择的银行
  var selectBank = BankEntity().obs;



}
