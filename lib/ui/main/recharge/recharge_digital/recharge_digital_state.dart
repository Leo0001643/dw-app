import 'package:flutter/material.dart';
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

  var offLineList = RxList<PaymentChannelBankSet>.empty(growable: true);
  var onLineList = RxList<DigiccyChannelWallet>.empty(growable: true);

  var currentList = RxList.empty(growable: true);


  var tabs = [Intr().xianshang,Intr().xianxia].obs;

  var currentAccount = Object().obs;

  var paymentInfo = PaymentListBanks();
  ///支付方式
  var paymentList = PaymentListEntity().obs;

  ///钱包地址
  var walletAddress = "";
  ///汇款金额
  var remitAmount = "";

  var scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController tabController;


}
