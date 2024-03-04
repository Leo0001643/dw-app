import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/ui/bean/jump_payment_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';

class RechargeOnlineState {
  RechargeOnlineState() {
    ///Initialize variables
  }


  var selectIndex = 0.obs;

  var paymentList = RxList<JumpPaymentEntity>.empty(growable: true);

  ///汇款金额
  var remitAmount = "".obs;

  ///收款方信息
  var paymentInfo = PaymentListBanks().obs;

}
