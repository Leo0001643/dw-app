import 'package:aone_common/controllers/mine/card_management/card_management_state.dart';
import 'package:aone_common/data/model/entities/user/mybankInfo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CardManagerState extends CardManagementState {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  var true_name = TextEditingController();
  var bank_card = TextEditingController();
  var bank_name = TextEditingController();
  var bank_kaihu = TextEditingController();

  var usdt_address = TextEditingController();
  var usdt_type = TextEditingController();

  final RxList headerList = RxList.empty();

  final RxList<BankInfos> _banks = RxList<BankInfos>([]);

  List get banks => _banks.value;

  set banks(value) => _banks.value = value;

  final RxInt _selIndex = 0.obs;

  int get selIndex => _selIndex.value;

  set selIndex(value) => _selIndex.value = value;

  var _bankSelect = 0.obs;

  int get bankSelect => _bankSelect.value;

  set bankSelect(value) => _bankSelect.value = value;

  //是否是完善提现信息
  bool isPerfectDrawInfoPage = false;
}
