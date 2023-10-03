import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/withdrawal/withdrawal_logic.dart';
import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

import '../../general/widget/notice_dialog.dart';

class WithdrawMoneyController extends WithdrawalLogic
    with GetTickerProviderStateMixin {
  static WithdrawMoneyController get to => Get.find();

  final _userService = UserService.to;

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

  MessageCenterProvider messageCenterProvider = MessageCenterProvider();


  @override
  Future<void> onInit() async {
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation =
        new CurvedAnimation(parent: animationController!, curve: Curves.linear);
    super.onInit();
    refreshCount = 0;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    PopupService.to.triggerPopup(routeName: Routes.withdraw);
  }

  Future<void> reloadMoney() async {
    if (refreshCount >= 2) {
      SmartDialog.showToast('操作过于频繁，我们休息下吧');
    }
    refreshCount++;
    if (isRefreshing) return;
    isRefreshing = true;
    animationController!.repeat();
    await _userService.getUserMoney();
    isRefreshing = false;
    refreshCount = 0;
    SmartDialog.showToast('刷新成功');
    animationController!.stop();
  }

  void setWithdrawAmount(String? value) {
    if (value != null) {
      var amount = getAmount(value);
      state.formKey.currentState!.fields['money']!.didChange(amount);
      state.currentAmount = amount;
    }
  }

  String getAmount(String value) {
    if (double.tryParse(value) == null) {
      final _money = UserService.to.state.userInfo.money;
      return double.parse(_money!).round().toString();
    }
    return value;
  }

  //测试bug单子要求 0917 bug显示bankkaihu
  String selectedNewBankFormatter(BankInfos bankInfo) {
    // var bankName = bankInfo.bankkaihu!;
    // var bankCardLast4Num = bankInfo.bankcard!.substring(
    //   bankInfo.bankcard!.length - 4,
    // );
    // return "$bankName ($bankCardLast4Num)";

    var bankName = bankInfo.type == 2 ? bankInfo.bankkaihu! : bankInfo.bankname;
    var bankCardLast4Num = bankInfo.bankcard!.substring(
      bankInfo.bankcard!.length - 4,
    );
    return "$bankName ($bankCardLast4Num)";
  }
}

class WithdrawMoneyModel {
  final String? title;
  final String? content;
  final bool? state;

  WithdrawMoneyModel({this.title, this.content, this.state});
}
