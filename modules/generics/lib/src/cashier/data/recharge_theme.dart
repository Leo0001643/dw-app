import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RechargeTheme {
  ///通用的属性
  //页面背景色
  Color? backgroundColor;
  Color? primary;
  Color? onPrimary;

  //主要文字颜色（比如充值主页，线上支付、转账汇款、vip充值）
  Color? mainTextColor;

  //field背景色
  Color? inputFieldColor;

  //线上支付的子支付模式文字
  Color? subTextColor;
  Color? neutralColor;
  Color? neutralColor1;
  Color? neutralColor2;

  Color? hintColor;

  ///
  Color? usdtJiaochengColor;
  Color? remarkColor;
  Color? cellDividerColor;
  //提示浏览器不可用
  Color? tipsNoColor;

  //卡片背景色.输入框背景色
  Color? cardBackgroundColor;

  Color? borderColor;

  //普通按钮的颜色，确认，提交
  Color? normalButtonTextColor;
  //普通按钮的背景
  BoxDecoration? normalButtonDecoration;

  Color? lightButtonTextColor;
  BoxDecoration? lightButtonDecoration;

  //金额卡片背景色
  Color? amountMoneyChipsSelectedBgColor;
  Color? amountMoneyChipsSelectedTextColor;

  Color? amountMoneyChipsTextColor;
  Color? amountMoneyChipsBgColor;

  /// recharge首页
  //充值方式item背景色
  Color? rechargeItemBackgroundColor;
  Color? rechargeCardBgColor;
  // Color? rechargeItemBackgroundColor;
  BoxDecoration? rechargeItemDecoration;

  bool? isShowRechargeDiscount;
  Color? dangerColor;
  Color? dangerColor1;

  bool? isShowQuestionIcon;
  Color? questionIconColor;
  Color? dividerColor;

  /// help
  //帮助页面-list item 背景色，默认为 cardBackgroundColor
  Color? helpItemBackgroundColor;
  Color? helpItemTextColor;
  Color? jiiaochengPageBg;

  ///appbar
  BoxDecoration? appbarDecoration;
  TextStyle? appbarTitleStyle;

  late Widget? pageLoading;
  late Function(String str)? noDataViewCall;

  ///online
  Color? channelSelectedColor;
  Color? channelUnSelectedColor;
  Color? channelBackgroundColor;
  Color? bankCardHeaderBackground;
  //奖金颜色
  Color? successColor;
  //支付通道显示简略模式(只显示单笔限额)
  // bool? isShowChannelSimple;

  ///transfer
  Color? bankCopyBtnBg;
  Color? bankCopyBtnTitleColor;
  Color? transferPageBg;
  Color? transferTipsTextColor;

  ///dialog
  BoxDecoration? cancelBtnDecoration;
  BoxDecoration? confirmBtnDecoration;
  Color? dialogCancelTextColor;
  Color? dialogConfirmTextColor;
  Color? dialogRemarksTextColor;
  Color? dialogTitleTextColor;
  Color? dialogCopyTextColor;

  ///功能性的
  //优惠活动是否能选择
  bool? isPromotionCanSelect;
  String? noDataImage;
  bool? isRechargeListStyle;
  VoidCallback? onUSDTHelpTap;
  VoidCallback? onCustomerServiceTap;

  ///每个页面单独配置的属性，默认都为空，为空则使用上面通用的颜色
  //start recharge 页面配置
  Color? startPageBg;
  Color? startPageTitleColor;
  Color? startPageSubTitleColor;
  Color? startPageItemColor;
  Color? startPageBorderColor;
  Color? startPageArrowColor;
  TextStyle? noDataStyle;

  ///排序 是否线上支付排在最前面
  bool? isOnlineFirst;

  ///items 多行还是一行
  bool? isRechargeItemsMultiRows;

  //教程页面右上角显示客服按钮
  String? jiiaochengPageKefuImage;

  //TransferChannelView是否隐藏温馨提醒
  bool? isHideChannelTips = false;

  static final RechargeTheme _instance = RechargeTheme._internal();
  factory RechargeTheme() => _instance;

  initDefaultTheme() {
    backgroundColor = const Color(0xFFF3F4F5);
    primary = const Color(0xFF271515);
    onPrimary = Colors.white;
    mainTextColor = const Color(0xFF000000);
    subTextColor = mainTextColor;
    cardBackgroundColor = onPrimary;
    borderColor = const Color(0xFFEBEBEB);
    inputFieldColor = Colors.white;
    neutralColor = const Color.fromRGBO(140, 140, 140, 0.7);
    neutralColor1 = const Color.fromRGBO(140, 140, 140, 1);
    neutralColor2 = const Color(0xff666666);

    usdtJiaochengColor = Colors.blue;
    remarkColor = const Color(0xFF757575);
    cellDividerColor = const Color.fromRGBO(11, 33, 59, 0.1);
    tipsNoColor = const Color(0xFFFD732A);

    normalButtonTextColor = cardBackgroundColor;
    normalButtonDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      color: primary,
    );

    lightButtonTextColor = const Color(0xFFB1B1B1);
    lightButtonDecoration = BoxDecoration(
        color: onPrimary,
        border: Border.all(color: borderColor ?? mainTextColor!),
        borderRadius: BorderRadius.all(Radius.circular(5.r)));

    rechargeItemBackgroundColor = const Color(0xFFF3F2F1);
    amountMoneyChipsSelectedBgColor = primary;
    amountMoneyChipsSelectedTextColor = Colors.white;

    amountMoneyChipsTextColor = mainTextColor;
    amountMoneyChipsBgColor = Colors.white;

    helpItemBackgroundColor = cardBackgroundColor;

    appbarDecoration = const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xFF202020),
        Color(0xFF494949),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
    );

    appbarTitleStyle = TextStyle(
        fontSize: 16.sp, color: onPrimary, fontWeight: FontWeight.normal);

    pageLoading = Container();

    rechargeItemDecoration = BoxDecoration(
        color: rechargeItemBackgroundColor,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(width: 1, color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.23),
            blurRadius: 0.0.r,
            spreadRadius: 0.2,
            offset: const Offset(0, 2),
          )
        ]);

    isShowRechargeDiscount = true;

    dangerColor = const Color(0xFFE61C16);
    dangerColor1 = const Color(0xff8a0505);

    isShowQuestionIcon = true;
    dividerColor = const Color(0xFFDDDDDD);

    channelSelectedColor = const Color(0xFFF0BE5C);
    channelUnSelectedColor = const Color(0xFFEBEBEB);
    channelBackgroundColor = const Color(0xffFBFAF9);
    bankCardHeaderBackground = const Color(0xFFFDF8E4);
    successColor = const Color(0xFFEC2121);
    // isShowChannelSimple = false;

    cancelBtnDecoration = BoxDecoration(
      color: neutralColor,
      borderRadius: BorderRadius.circular(5.r),
    );

    confirmBtnDecoration = BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.circular(5.r),
    );

    dialogCancelTextColor = onPrimary;
    dialogConfirmTextColor = onPrimary;
    dialogRemarksTextColor = const Color.fromRGBO(140, 140, 140, 0.7);
    dialogTitleTextColor = onPrimary;

    isPromotionCanSelect = true;
    isRechargeListStyle = false;
    isOnlineFirst = false;
  }

  RechargeTheme._internal() {
    initDefaultTheme();
  }
}
