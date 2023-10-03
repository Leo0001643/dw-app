import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawTheme {
  ///通用的属性
  //页面背景色
  Color? backgroundColor;
  Color? primary;
  Color? onPrimary;
  Color? topBoxBgColor;
  Color? topBoxBorderColor;
  Color? balanceColor;
  Color? activeTextColor;
  Color? washTxtColor;

  //主要文字颜色（比如充值主页，线上支付、转账汇款、vip充值）
  Color? mainTextColor;
  Color? cardManagerTextColor;
  Color? cardManagerNoteColor;
  //线上支付的子支付模式文字
  Color? subTextColor;
  Color? neutralColor;
  Color? neutralColor1;
  Color? neutralColor2;

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

  //刷新按钮的背景
  BoxDecoration? refreshButtonDecoration;

  Color? lightButtonTextColor;
  BoxDecoration? lightButtonDecoration;

  Color? cancelButtonTextColor;
  BoxDecoration? cancelButtonDecoration;

  //银行卡背景
  Gradient? cardBgGradient;
  Gradient? primaryBtnBg;
  Gradient? secondaryBtnBg;
  Gradient? primaryBtnWarp;

  //银行卡背景
  Color? bankCardTextColor;
  BoxDecoration? bankCardDecoration;
  //银行卡背景图片 如果为空 使用默认的图片地址
  String? bankCardBgImage;
  String? remarks;

  //添加银行卡按钮
  Color? addButtonTextColor;
  BoxDecoration? addButtonDecoration;

  //提现账户输入框颜色
  Color? inputAccountColor;

  //底部提示文字隐藏
  bool? hideBottomTips;

  //新增账户按钮
  Color? addAccountButtonTextColor;
  BoxDecoration? addAccountButtonDecoration;

  //类型点选按钮
  Color? typeBtnSelTitleColor;
  Color? typeBtnNorTitleColor;
  Color? typeButtonSelBgColor;
  Color? typeButtonNorBgColor;

  Color? dialogTopTextColor;
  BoxDecoration? dialogTopDecoration;

  Color? inputLabelColor;
  Color? inputBorderColor;
  Color? inputTextColor;
  Color? inputHintTextColor;
  BoxDecoration? accountInfoCardDecoration;
  Color? accountInfoTextColor;
  Color? withdrawTipTextColor;
  Color? withdrawKfTextColor;

  //跳转客服
  VoidCallback? onCustomerServiceTap;

  ///appbar
  BoxDecoration? appbarDecoration;
  String? appbarDecorationImage;

  TextStyle? appbarTitleStyle;
  TextStyle? noDataStyle;

  Color? fieldTextColor;

  Color? addHeaderBgColor;
  Color? addHeaderTextColor;
  Color? addInputTextColor;
  Color? addInputOtherColor;

  //新增账户dialog
  Color? addAccountDialogTipsColor;
  Color? addAccountDialogTipsBlockColor;

  //当前不能提现 请联系在线客服的颜色
  Color? disableWithdrawTipsColor;

  static final WithdrawTheme _instance = WithdrawTheme._internal();
  factory WithdrawTheme() => _instance;

  initDefaultTheme() {
    backgroundColor = const Color(0xFFFFFFFF);
    primary = const Color(0xFFc89d42);
    onPrimary = Colors.white;
    balanceColor = const Color(0xFFc89d42);
    washTxtColor = const Color.fromRGBO(11, 33, 59, 0.7);
    activeTextColor = const Color(0xFF4ad134);
    topBoxBgColor = const Color(0xFFeef1f8);
    topBoxBorderColor = const Color(0xFFebebeb);
    cardManagerTextColor = const Color(0xFF999999);
    cardManagerNoteColor = const Color(0xFF959596);
    cardBgGradient =
        const LinearGradient(colors: [Color(0xFFc89d42), Color(0xfff3d28d)]);
    mainTextColor = const Color(0xFF000000);
    subTextColor = mainTextColor;
    cardBackgroundColor = onPrimary;
    borderColor = const Color(0xff666666);
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
    refreshButtonDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
      color: primary,
    );
    addButtonDecoration = BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/blank.png', package: 'generics'),
        ),
        color: Colors.white,
        // border: Border.all(color: Color(0xFFB1B1B1)),
        borderRadius: BorderRadius.all(Radius.circular(5.r)));
    addButtonTextColor = const Color(0xFFa7adbb);
    addAccountButtonTextColor = const Color(0xFFc89d42);
    addAccountButtonDecoration = BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 1, color: const Color(0xFFc89d42)),
    );
    lightButtonTextColor = mainTextColor;
    lightButtonDecoration = BoxDecoration(
        color: const Color(0xFFF3F4F9),
        borderRadius: BorderRadius.all(Radius.circular(5.r)));
    dialogTopTextColor = const Color(0xFFF3F4F9);
    dialogTopDecoration = const BoxDecoration(
        color: Color(0xFFF6f6f6),
        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5)));
    cancelButtonTextColor = const Color(0xFFc89d42);
    cancelButtonDecoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: const Color(0xFFc89d42)),
        borderRadius: BorderRadius.all(Radius.circular(5.r)));
    inputLabelColor = const Color(0xFF282828);
    inputBorderColor = const Color(0xFFa5b9d1);
    inputTextColor = const Color(0xFF282828);
    inputHintTextColor = const Color(0xFFa5b9d1);
    accountInfoCardDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      color: const Color(0xFFeef1f8),
    );
    accountInfoTextColor = const Color(0xFF282828);
    withdrawTipTextColor = const Color(0xFF595959);
    withdrawKfTextColor = const Color(0xffff0000);
    appbarDecoration = const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xFF202020),
        Color(0xFF494949),
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
    );
    appbarTitleStyle = TextStyle(
        fontSize: 16.sp, color: onPrimary, fontWeight: FontWeight.normal);
    primaryBtnBg = const LinearGradient(
      colors: [
        Color.fromRGBO(247, 229, 181, 1),
        Color.fromRGBO(181, 149, 105, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.715],
    );

    secondaryBtnBg = const LinearGradient(
      colors: [
        Color.fromRGBO(227, 222, 204, 1),
        Color.fromRGBO(144, 132, 115, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    primaryBtnWarp = const LinearGradient(
      colors: [
        Color.fromRGBO(164, 124, 72, 1),
        Color.fromRGBO(229, 172, 75, 1),
        Color.fromRGBO(143, 98, 44, 1),
        Color.fromRGBO(227, 171, 74, 1),
        Color.fromRGBO(140, 93, 37, 1),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.034, 0.175, 0.341, 0.53, 0.783],
    );

    fieldTextColor = Colors.black;
  }

  WithdrawTheme._internal() {
    initDefaultTheme();
  }
}
