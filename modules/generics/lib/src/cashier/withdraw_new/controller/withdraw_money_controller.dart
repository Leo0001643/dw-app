import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/withdrawal_new/withdrawal_logic_new.dart';
import 'package:aone_common/controllers/withdrawal_new/withdrawal_state_new.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class WithdrawMoneyController extends WithdrawalLogicNew
    with GetTickerProviderStateMixin {
  static WithdrawMoneyController get to => Get.find();
  @override
  WithdrawalStateNew state = WithdrawalStateNew();

  final _userService = UserService.to;
  final UserWalletProvider userWalletProvider = UserWalletProvider();

  //刷新金额动画
  AnimationController? animationController;
  Animation<double>? animation;
  late bool isRefreshing = false;
  int refreshCount = 0;

  final RxList<NoticeItems> _noticeItems = RxList.empty();

  RxList<NoticeItems> get noticeItems => _noticeItems;

  set noticeItems(RxList<NoticeItems> value) => _noticeItems.value = value;

  final RxList<NoticeItems> _noticeItemsFilter = RxList.empty();

  RxList<NoticeItems> get noticeItemsFilter => _noticeItemsFilter;

  set noticeItemsFilter(RxList<NoticeItems> value) =>
      _noticeItemsFilter.value = value;

  final RxInt _activeTypeIndex = 0.obs;
  int get activeTypeIndex => _activeTypeIndex.value;
  set activeTypeIndex(int val) => _activeTypeIndex.value = val;

  final RxBool _isTips = false.obs;
  bool get isTips => _isTips.value;
  set isTips(bool val) => _isTips.value = val;

  final RxBool showEye = false.obs;

  @override
  Future<void> onInit() async {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.linear);
    super.onInit();

    refreshCount = 0;
  }

  //我的卡包
  Future<void> getBankList() async {
    state.bankList.clear();
    await fetchHandler<MyBankListInfoEntity>(
      provider.getBankList(),
    ).then((value) {
      state.bankList.addAll(value!.banks!);
      getMList();
    });
    update();
  }

  @override
  Future<void> onReady() async {
    print('onReadyonReadyonReady');
    PopupService.to.triggerPopup(routeName: Routes.withdraw);
    super.onReady();

    await getBankList();
    //当绑卡成功后获取卡片列表
    EventBus.on(EventType.onBindCardSuccess, (arg) async {
      if (Get.isRegistered<WithdrawMoneyController>())
      {
        await getBankList();
      }
    });
  }

  Future<void> reloadMoney() async {
    if (refreshCount >= 2) {
      SmartDialog.showToast('操作过于频繁，我们休息下吧');
    }
    refreshCount++;
    //if (isRefreshing) return;
    isRefreshing = true;
    animationController!.repeat();
    await _userService.getUserMoney();
    isRefreshing = false;
    refreshCount = 0;
    SmartDialog.showToast('刷新成功');
    animationController!.stop();
    await getBankList();
  }

  void setWithdrawAmount(String? value) {
    if (value != null) {
      var amount = getAmount(value);
      state.withdrawFormKey.currentState!.fields['money']!.didChange(amount);
      state.currentAmount = amount;
    }
  }

  String getAmount(String value) {
    if (double.tryParse(value) == null) {
      final _money = UserService.to.state.userInfo.money;
      String moneyStr = _money ?? "0";
      if (_money!.contains(".")) {
        moneyStr = _money.split('.')[0];
      }
      return double.parse(moneyStr!).round().toString();
    }
    return value;
  }

  //测试bug单子要求 0917 bug显示bankkaihu
  String selectedNewBankFormatter(BankInfos bankInfo) {
    var bankName = bankInfo.type == 2 ? bankInfo.bankkaihu! : bankInfo.bankname;
    var bankCardLast4Num = bankInfo.bankcard!.substring(
      bankInfo.bankcard!.length - 4,
    );
    return "$bankName ($bankCardLast4Num)";
  }

  int getBankTypeByIndex() {
    if (_activeTypeIndex.value == 0) {
      return 1;
    } else if (_activeTypeIndex.value == 1) {
      return 4;
    } else if (_activeTypeIndex.value == 2) {
      return 2;
    } else {
      return 0;
    }
  }

  getWithdrawFreeNum(int txscount) {
    if (txscount >= 0) {
      return txscount.toString();
    } else {
      return '无限次';
    }
  }

  void setPassword(String? value) {
    if (value != null) {
      state.withdrawFormKey.currentState!.fields['password']!.didChange(value);
    }
  }

  void getMList() {
    List<BankInfos> mList = [];
    WithdrawMoneyController.to.state.bankList.forEach((element) {
      if (element.type == WithdrawMoneyController.to.getBankTypeByIndex()) {
        mList.add(element);
      }
    });
    WithdrawMoneyController.to.state.mbankList.value = mList;
    WithdrawMoneyController.to.isTips = false;
  }
}

class WithdrawMoneyModel {
  final String? title;
  final String? content;
  final bool? state;

  WithdrawMoneyModel({this.title, this.content, this.state});
}
