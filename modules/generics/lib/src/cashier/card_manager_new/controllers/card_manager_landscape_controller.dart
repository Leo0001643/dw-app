import 'package:aone_common/controllers/mine/card_management_new/card_management_logic_new.dart';
import 'package:aone_common/controllers/mine/card_management_new/card_management_state.dart';
import 'package:aone_common/data/model/entities/user/get_bank_list.dart';
import 'package:aone_common/data/model/entities/user/mybankInfo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class CardManagerLandScapeController extends CardManagerLogicNew {
  static CardManagerLandScapeController get to => Get.find();

  PageController pageController = PageController(initialPage: 0);

  final Rx<BankInfos?> _currentItem = Rx(null);
  BankInfos? get currentItem => _currentItem.value;
  set currentItem(value) => _currentItem.value = value;

  String? get bankNameValue =>
      state.bankFormKey.currentState!.fields['bankname']!.value;

  void onSelectClose(String value) {
    state.bankFormKey.currentState!.fields['bankname']!.didChange(value);
  }
  final RxList<Banks> _bankItems = RxList<Banks>([]);
  List get bankItems => _bankItems.value;
  set bankItems(value) => _bankItems.value = value;

  final RxList<Banks> _bankItems2 = RxList<Banks>([]);
  List get bankItems2 => _bankItems2.value;
  set bankItems2(value) => _bankItems2.value = value;

  final RxList<Banks> _bankItems3 = RxList<Banks>([]);
  List get bankItems3 => _bankItems3.value;
  set bankItems3(value) => _bankItems3.value = value;

  final RxList<Banks> _currentBanks = RxList<Banks>([]);
  List get currentBanks => _currentBanks.value;
  set currentBanks(value) => _currentBanks.value = value;

  final RxList dialogHeaderList = RxList.empty();

  final RxInt _headerSelIndex = 0.obs;
  int get headerSelIndex => _headerSelIndex.value;
  set headerSelIndex(value) => _headerSelIndex.value = value;

  final RxBool _isDialog = false.obs;
  bool get isDialog => _isDialog.value;
  set isDialog(bool value) => _isDialog.value = value;

  @override
  void onInit() {
    // TODO: implement onInit
    initDialogHeaderList();
    getBankList();
    super.onInit();
  }

  Future<void> getBankList() async {
    await fetchHandler<GetBankListEntity>(
        siteConfigProvider.getBankList(),
        onSuccess: (res) async {
          print("item2 is $res");
          bankItems = res.items??[];
          bankItems2 = res.items2??[];
          bankItems3 = res.items3??[];
          currentBanks = res.items??[];
        }
    );
  }
  initDialogHeaderList() async{
    dialogHeaderList.add(Tuple2('银行卡', 0));
    dialogHeaderList.add(Tuple2('电子钱包', 1));
    dialogHeaderList.add(Tuple2('虚拟币', 2));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onAddSuccess() {
    super.onAddSuccess();
    pageController.jumpToPage(0);
  }

  void onShowInfo(BankInfos item) {
    currentItem = item;
    state.currentType = item.type!;
    state.formType = CardFormType.readOnly;
    pageController.jumpToPage(1);
  }

  void onEditInfo(BankInfos item) {
    currentItem = item;
    state.currentType = item.type!;
    state.formType = CardFormType.edit;
    pageController.jumpToPage(1);
    state.bankFormKey.currentState?.reset();
    if(state.currentType == 1){
      headerSelIndex = 0;
      currentBanks = bankItems;
    }else if(state.currentType == 4){
      headerSelIndex = 1;
      currentBanks = bankItems3;
      print(state.currentType);
    }else if(state.currentType == 2){
      headerSelIndex = 2;
      currentBanks = bankItems2;
    }
  }

  void onInputChange(val) {
  }

}
