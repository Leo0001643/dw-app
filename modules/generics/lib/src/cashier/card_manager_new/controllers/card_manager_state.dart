import 'package:aone_common/controllers/mine/card_management_new/card_management_state.dart';
import 'package:aone_common/data/model/entities/user/get_bank_list.dart';
import 'package:aone_common/data/model/entities/user/mybankInfo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CardManagerState extends CardManagementState {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  var cny_type = TextEditingController();
  var true_name = TextEditingController();
  var bank_card = TextEditingController();
  var bank_name = TextEditingController();
  var bank_kaihu = TextEditingController();

  var usdt_address = TextEditingController();
  var usdt_type = TextEditingController();

  var digtal_address = TextEditingController();
  var digtal_type = TextEditingController();

  //新增卡包弹窗高度 为了键盘可以弹起先用着方法
  final RxInt _addBankDialogHeigth = 500.obs;
  int get addBankDialogHeigth => _addBankDialogHeigth.value;
  set addBankDialogHeigth(value) => _addBankDialogHeigth.value = value;

  late final Rx<MyBankListInfoEntity> _myBankListInfoEntity =
      Rx(MyBankListInfoEntity());
  MyBankListInfoEntity get myBankListInfoEntity => _myBankListInfoEntity.value;
  set myBankListInfoEntity(value) => _myBankListInfoEntity.value = value;

  final RxList headerList = RxList.empty();
  final RxList dialogHeaderList = RxList.empty();
  final RxList<BankInfos> _banks = RxList<BankInfos>([]);
  List get banks => _banks.value;
  set banks(value) => _banks.value = value;

  final RxList<Banks> _bankItems = RxList<Banks>([]);
  List get bankItems => _bankItems.value;
  set bankItems(value) => _bankItems.value = value;

  final RxList<Banks> _bankItems2 = RxList<Banks>([]);
  List get bankItems2 => _bankItems2.value;
  set bankItems2(value) => _bankItems2.value = value;

  final RxList<Banks> _bankItems3 = RxList<Banks>([]);
  List get bankItems3 => _bankItems3.value;
  set bankItems3(value) => _bankItems3.value = value;

  final RxInt _selIndex = 0.obs;
  int get selIndex => _selIndex.value;
  set selIndex(value) => _selIndex.value = value;

  final RxInt _headerSelIndex = 0.obs;
  int get headerSelIndex => _headerSelIndex.value;
  set headerSelIndex(value) => _headerSelIndex.value = value;

  final RxInt _bankType = 0.obs;
  int get bankType => _bankType.value;
  set bankType(value) => _bankType.value = value;

  var _bankSelect = 0.obs;
  int get bankSelect => _bankSelect.value;
  set bankSelect(value) => _bankSelect.value = value;

  late final Rx<Banks> _cnyTypeSelect = Banks().obs;
  Banks get cnyTypeSelect => _cnyTypeSelect.value;
  set cnyTypeSelect(Banks value) => _cnyTypeSelect.value = value;

  late final Rx<Banks> _usdtTypeSelect = Banks().obs;
  Banks get usdtTypeSelect => _usdtTypeSelect.value;
  set usdtTypeSelect(Banks value) => _usdtTypeSelect.value = value;

  final Rx<GetBankListEntity> _getBankListEntity = GetBankListEntity().obs;
  GetBankListEntity get getBankListEntity => _getBankListEntity.value;
  set getBankListEntity(GetBankListEntity value) =>
      _getBankListEntity.value = value;

  final RxList<Banks> _cnyTypeList = RxList<Banks>([]);
  List get cnyTypeList => _cnyTypeList.value;
  set cnyTypeList(value) => _cnyTypeList.value = value;

  // final RxList<Banks> _dialogBankTypeList = RxList<Banks>([]);
  // List get dialogBankTypeList =>  _dialogBankTypeList.value;
  // set dialogBankTypeList(value) => _dialogBankTypeList.value = value;
  //

  List get dialogBankTypeList {
    return [Banks(name: "银行卡", names: "银行卡")];
  }

  final RxBool _isDialog = false.obs;
  bool get isDialog => _isDialog.value;
  set isDialog(bool value) => _isDialog.value = value;
}
