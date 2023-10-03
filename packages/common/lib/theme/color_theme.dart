import 'package:flutter/material.dart';

class AoneAppTheme {
  static AppThemeConfig appThemeConfig = AppThemeConfig();

  static void setup(AppThemeConfig config) {
    appThemeConfig = config;
  }

  static AppThemeConfig get appTheme => appThemeConfig;

  static bool get isDarkBackWater =>
      appThemeConfig.siteTag == 'b97' || appThemeConfig.siteTag == 'g87';
}

class AppThemeConfig {
  final String? siteTag; //站点
  final Color? primary; //主色调
  final Color? onPrimary; //副色调
  final Color? primaryOne; //副色调1   //navbar 风格等
  final Gradient? primaryGradient; //主色调渐变
  final Gradient? primaryGradientBtnBg; //风格按钮

  final Color? greyColor; //灰色色调系列

  //首页弹窗/充值提现注册弹窗
  final LinearGradient? noticeStyle3TitleBgGradient;
  final LinearGradient? noticeStyle3KnowBgGradient;

  //recharge
  final Color? rechargeTextColor;
  final Color? rechargeSelectedColor;
  final Color? rechargeUnselectedColor;
  final Color? rechargeBtnColor;
  final Color? rechargeHighLightTextColor;

  //user
  final LinearGradient? userHeaderBgGradient; //个人中心头部渐变色
  final Color? userMainTextColor;
  final Color? userSubTextColor;
  final Color? userSubTextColor1;
  final Color? userItemBgColor;
  final Color? userBgColor; //个人中心背景色
  final Color? userDividerColor;
  final Color? userButtonBg;

  //推广返利
  final Color? promotionHeaderBgColor;
  final Color? backgroundColor;
  final Color? greenTextColor;
  final Color? textRedColor;
  final Color? blueColor;
  final Color? undeer_line_color1;
  final Color? goldTextColor;
  final TextStyle? regularStyle;
  final Color? shareTuiGuang;
  final Color? regularBtnStyle;
  final BoxDecoration? shareBtnDecoration;
  final BoxDecoration? shareSelectBtnDecoration;
  final BoxDecoration? shareBtnDecoration2;
  final BoxDecoration? shareBarDecoration;
  final Color? themeBackgroundColor;
  final Color? undeer_line_color;
  final Color? normalBgColor;
  final Color? normalTextColor;
  final Color? shareUrlTextColor;
  final Color? shareTitle2TextColor;
  final Color? shareSelectTextColor;
  final Color? shareBgSelectTextColor;
  final Color? shareUnSelectTextColor;
  final BoxDecoration? shareUrlBgDecoration;
  final LinearGradient? shareAppBarGradient;
  final LinearGradient? shareTitleGradient;
  //App更新
  final Color? appUpdateBgColor;
  final Color? appUpdateLineColor;
  final LinearGradient? appUpdateBtnGradient;
  final LinearGradient? shareUpdateBtnGradient;
  //返水
  final Color? fsBgColor;
  final Gradient? fsAppbarGradient;
  final Color? fsHeaderCardBgColor;
  final Color? fsPrimaryColor;
  final Gradient? fsButtonGradient;
  final Color? fsButtonTextColor;
  final Color? fsTitleBgColor;
  final Color? fsTitleSelectedBgColor;
  final Color? fsTitleUnSelectedBgColor;
  final Gradient? fsTitleSelectedBgGradient;
  final Gradient? fsTitleUnSelectedBgGradient;
  final Color? fsTitleBorderColor;
  final Color? fsTitleSelectedColor;
  final Color? fsTitleUnSelectedColor;
  final Color? fsNoDataTextColor;
  final Color? fsItemBgColor;
  final Gradient? fsItemBgGradient;
  final Color? fsItemContentColor;
  final Gradient? fsTitleBgGradient;
  final Color? fsChildItemTextColor;
  final String? imgUrl;

  //GameCategoryView
  //如果gameAppBarDecoration都是一样的，只用设置gameAppBarDecoration
  final BoxDecoration? gameAppBarDecoration;
  final BoxDecoration? categoryAppBarDecoration;
  final Color? categoryAppBarIconColor;
  final Color? categoryBg;
  final Color? categoryCheckBg;
  final Color? categoryTabTitleColor;
  final Color? categoryTabIndicatorColor;
  //GameCategoryTitleWidget
  final BoxDecoration? categoryTitleWidgetDecoration; //分类弹窗整体背景
  final Color? categoryTitleWidgetColor; //分类弹窗item名称颜色
  //GameCategoryView List样式
  BoxDecoration? categoryListLayoutItemDecoration;
  Color? categoryListLayoutTextColor;
  Color? categoryListLayoutSubTextColor;
  Color? categoryListItemTextColor;
  //searchView
  BoxDecoration? searchAppBarDecoration;
  Color? searchAppBarIconColor;
  BoxDecoration? searchAppBarFieldDecoration;
  TextStyle? searchAppBarFieldTextStyle;
  Color? searchItemBgColor;
  Color? searchItemFontColor;
  Color? searchBgColor;
  //strongActivityView
  BoxDecoration? strongAppBarDecoration;
  Color? strongAppBarIconColor;
  Color? strongAppBarCheckIconColor;
  Color? strongBgColor;
  Color? strongDisabledColor;
  BoxDecoration? strongListHeaderDecoration;
  BoxDecoration? strongListRightMoreGameDecoration;
  Color? strongListFirstGameColor;
  Color? strongListRightMoreGameTextColor;
  Color? strongListHeaderTextColor;
  Color? strongListHeaderSubTextColor;
  Color? strongListSubTextColor;
  Color? strongListLineColor;
  Color? gameNoDataTitleColor;
  Color? progressBarColor;
  bool? strongListMoreIsTop = true;

  //activity
  Color? activityDialogTitleTextColor;
  Color? activityDialogSubTitleTextColor;
  Color? activityDialogButtonTextColor;
  Color? activityDialogButtonBgColor;
  Color? activityDialogHintTextColor;

  //优惠中心
  final Color? yhcBgColor;
  final Color? yhcMoneyColor;
  final Color? yhcBtnTitleColor;
  final Color? yhcBtnDisableTitleColor;
  final BoxDecoration? yhcBtnDisableBgDecoration;
  final BoxDecoration? yhcBtnBgDecoration;

  //我的优惠
  final Color? myOfferReceiveBtnColor;

  //taskCenter
  final Color? tcBgColor;
  final Color? tcMenuTitleColor;
  final Color? tcMenuSelectTitleColor;
  final Color? tcCellTitleColor;
  final Color? tcCellSubTitleColor;
  final Color? tcCellSliderBgColor;
  final Color? tcCellSliderColor;
  final Color? tcCellSliderTitleColor;
  //可能有2个颜色，文字显示在slider里面或者外面，有2种颜色
  final Color? tcCellSliderTitleColor1;
  final Color? tcCellRightTopStatusColor;
  final LinearGradient? tcCellBottomBtnGradient;
  final LinearGradient? tcCellBottomBtnDisableGradient;
  final Color? tcCellBottomBtnDisableTitleColor;
  final Color? tcCellBottomBtnTitleColor;
  final Color? tcDialogTitleColor;
  final Color? tcDialogMenuBgColor;
  final Color? tcDialogMenuTitleColor;
  final Color? tcDialogMenuSubTitleColor;

  ///cell中 slider 的颜色 和 dialog slider 颜色一致，可以不设置
  final Color? tcDialogSliderBgColor;
  final Color? tcDialogSliderColor;
  final Color? tcDialogSliderTitleColor;

  final LinearGradient? fsDetailAppbarGradient;
  final Color? fsDetailBackgroundColor;
  final Color? fsDetailTitleColor;
  final Color? fsDetailTitleBgColor;
  final Color? fsDetailSecondBg;
  final Color? fsDetailPrimary;
  final Color? fsDetailPrimary1;
  final Color? fsDetailPrimary2;
  final Color? fsDetailPrimary3;
  final Color? fsDetailItemBg1;
  final Color? fsDetailItemBg2;
  final Color? fsDetailItemBg3;
  final Color? fsDetailItemTextColor;
  final Color? fsDetailItemTitleColor;
  final bool? fsDetailHasBackground;
  final Color? fsDetailItemBackgroundColor;

  /*
  * 卡包管理
  * */
  //页面背景色
  final Color? withdrawBgColor;
  final Color? topBoxBgColor; //提现头部背景
  final Color? topBoxBorderColor;
  final Color? withDrawalBalanceColor;
  final Color? withDrawalBalanceColor1;

  final Color? activeTextColor;
  final Color? washTxtColor;

  //主要文字颜色（比如充值主页，线上支付、转账汇款、vip充值）
  final Color? mainTextColor;
  final Color? cardManagerTextColor;
  final Color? cardManagerNoteColor;
  //线上支付的子支付模式文字
  final Color? subTextColor;
  final Color? neutralColor;
  final Color? neutralColor1;
  final Color? neutralColor2;

  ///
  final Color? usdtJiaochengColor;
  final Color? remarkColor;
  final Color? cellDividerColor;
  //提示浏览器不可用
  final Color? tipsNoColor;

  //卡片背景色.输入框背景色
  final Color? cardBackgroundColor;

  final Color? borderColor;

  //普通按钮的颜色，确认，提交
  final Color? normalButtonTextColor;
  //普通按钮的背景
  final BoxDecoration? withDrawalNormalBntDecoration;

  //刷新按钮的背景
  final BoxDecoration? refreshButtonDecoration;

  final Color? lightButtonTextColor;
  final BoxDecoration? lightButtonDecoration;

  final Color? cancelButtonTextColor;
  final BoxDecoration? cancelButtonDecoration;
  final BoxDecoration? saveButtonDecoration;

  //银行卡背景
  final Gradient? cardBgGradient;
  final Gradient? primaryBtnBg;
  final Gradient? secondaryBtnBg;
  final Gradient? primaryBtnWarp;

  //银行卡背景
  final Color? bankCardTextColor;
  final BoxDecoration? bankCardDecoration;
  //银行卡背景图片 如果为空 使用默认的图片地址
  final String? bankCardBgImage;

  //添加银行卡按钮
  final Color? addButtonTextColor;
  final BoxDecoration? addButtonDecoration;

  //提现账户输入框颜色
  final Color? inputAccountColor;

  //底部提示文字隐藏
  final bool? hideBottomTips;

  //新增账户按钮
  final Color? addAccountButtonTextColor;
  final BoxDecoration? addAccountButtonDecoration;

  //类型点选按钮
  final Color? typeBtnSelTitleColor;
  final Color? typeBtnNorTitleColor;
  final Color? typeButtonSelBgColor;
  final Color? typeButtonNorBgColor;

  final Color? dialogTopTextColor;
  final BoxDecoration? dialogTopDecoration;

  final Color? inputLabelColor;
  final Color? inputBorderColor;
  final Color? inputTextColor;
  final Color? inputHintTextColor;
  final BoxDecoration? accountInfoCardDecoration;
  final Color? accountInfoTextColor;
  final Color? withdrawTipTextColor;
  final Color? withdrawScopeMoneyTextColor; //提现金额范围
  final Color? withdrawKfTextColor;

  ///appbar
  final BoxDecoration? appbarDecoration;
  final String? appbarDecorationImage;

  final TextStyle? appbarTitleStyle;
  final TextStyle? noDataStyle;

  final Color? fieldTextColor;

  final Color? addHeaderBgColor;
  final Color? addHeaderTextColor;
  final Color? addInputTextColor;
  final Color? addInputOtherColor;

  //新增账户dialog
  Color? addAccountDialogTipsColor;
  Color? addAccountDialogTipsBlockColor;

  //当前不能提现 请联系在线客服的颜色
  Color? disableWithdrawTipsColor;

  final String? cardManagerBgImg;

  //游戏启动页，暂时先这样写着
  final String? gameInitImage;

  //收藏配色
  final Color? collectionAppBar;
  final Color? collectionTitle1;

  //资金记录 投注记录
  final LinearGradient? recordsPrimaryGradient;
  final Color? recordBgColor;
  final Color? recordCardColor;
  final Color? recordsSelectedTextColor;
  final Color? recordsUnselectedTextColor;
  final Color? recordsMainTextColor;
  final Color? recordsSubTextColor;
  final LinearGradient? recordsBottomTotalGradient;
  final Color? recordsBottomTotalTextColor;
  final Color? recordsBottomTotalMoneyTextColor;

  AppThemeConfig({
    this.siteTag,
    this.primary,
    this.primaryOne,
    this.onPrimary,
    this.greyColor,
    this.primaryGradient,
    this.primaryGradientBtnBg,

    //首页弹窗/充值提现注册弹窗
    this.noticeStyle3TitleBgGradient,
    this.noticeStyle3KnowBgGradient,

    //user
    this.userHeaderBgGradient,
    this.userMainTextColor,
    this.userSubTextColor,
    this.userSubTextColor1,
    this.userItemBgColor,
    this.userBgColor,
    this.userDividerColor,
    this.userButtonBg,
    //推广返利
    this.promotionHeaderBgColor,
    this.shareTuiGuang,
    this.shareUrlTextColor,
    this.shareTitle2TextColor,
    this.shareSelectTextColor,
    this.shareUpdateBtnGradient,
    this.shareBgSelectTextColor,
    this.shareUnSelectTextColor,
    this.shareUrlBgDecoration,
    this.shareAppBarGradient,
    this.shareTitleGradient,
    this.shareBarDecoration,
    this.shareBtnDecoration,
    this.shareSelectBtnDecoration,
    this.shareBtnDecoration2,
    this.themeBackgroundColor,
    this.undeer_line_color,
    this.normalBgColor,
    this.normalTextColor,
    // this.primaryGradient,
    this.backgroundColor,
    this.greenTextColor,
    this.textRedColor,
    this.blueColor,
    this.undeer_line_color1,
    this.goldTextColor,
    this.regularStyle,
    this.regularBtnStyle,
    //recharge
    this.rechargeTextColor,
    this.rechargeSelectedColor,
    this.rechargeUnselectedColor,
    this.rechargeBtnColor,
    this.rechargeHighLightTextColor,

    //推广返利

    //App更新
    this.appUpdateBgColor,
    this.appUpdateLineColor,
    this.appUpdateBtnGradient,

    //返水
    this.fsBgColor,
    this.fsAppbarGradient,
    this.fsHeaderCardBgColor,
    this.fsPrimaryColor,
    this.fsButtonGradient,
    this.fsButtonTextColor,
    this.fsTitleBgColor,
    this.fsTitleSelectedBgGradient,
    this.fsTitleSelectedBgColor,
    this.fsTitleUnSelectedBgGradient,
    this.fsTitleUnSelectedBgColor,
    this.fsTitleBorderColor,
    this.fsTitleSelectedColor,
    this.fsTitleUnSelectedColor,
    this.fsNoDataTextColor,
    this.fsItemBgColor,
    this.fsItemBgGradient,
    this.fsItemContentColor,
    this.fsTitleBgGradient,
    this.fsChildItemTextColor,
    this.fsDetailAppbarGradient,
    this.fsDetailBackgroundColor,
    this.fsDetailTitleColor,
    this.fsDetailTitleBgColor,
    this.fsDetailPrimary,
    this.fsDetailPrimary1,
    this.fsDetailPrimary2,
    this.fsDetailPrimary3,
    this.fsDetailSecondBg,
    this.fsDetailItemBg1,
    this.fsDetailItemBg2,
    this.fsDetailItemBg3,
    this.fsDetailItemTextColor,
    this.fsDetailItemTitleColor,
    this.fsDetailHasBackground,
    this.fsDetailItemBackgroundColor,

    //GameCategoryView
    this.gameAppBarDecoration,
    this.strongListFirstGameColor,
    this.strongListRightMoreGameDecoration,
    this.strongBgColor,
    this.strongListRightMoreGameTextColor,
    this.strongListLineColor,
    this.categoryCheckBg,
    this.searchItemBgColor,
    this.searchItemFontColor,
    this.categoryAppBarDecoration,
    this.categoryAppBarIconColor,
    this.categoryBg,
    this.searchBgColor,
    this.categoryTabTitleColor,
    this.categoryListItemTextColor,
    this.categoryTabIndicatorColor,
    this.categoryTitleWidgetDecoration,
    this.categoryTitleWidgetColor,
    this.categoryListLayoutItemDecoration,
    this.categoryListLayoutTextColor,
    this.categoryListLayoutSubTextColor,
    this.searchAppBarDecoration,
    this.searchAppBarIconColor,
    this.searchAppBarFieldDecoration,
    this.searchAppBarFieldTextStyle,
    this.strongAppBarDecoration,
    this.strongAppBarIconColor,
    this.strongListMoreIsTop,
    this.strongAppBarCheckIconColor,
    this.strongDisabledColor,
    this.strongListHeaderDecoration,
    this.strongListHeaderTextColor,
    this.strongListHeaderSubTextColor,
    this.strongListSubTextColor,
    this.gameNoDataTitleColor,
    this.progressBarColor,

    //activity
    this.activityDialogTitleTextColor,
    this.activityDialogSubTitleTextColor,
    this.activityDialogButtonTextColor,
    this.activityDialogButtonBgColor,
    this.activityDialogHintTextColor,

    //优惠中心
    this.yhcBgColor,
    this.yhcMoneyColor,
    this.yhcBtnTitleColor,
    this.yhcBtnDisableTitleColor,
    this.yhcBtnDisableBgDecoration,
    this.yhcBtnBgDecoration,

    //我的优惠
    this.myOfferReceiveBtnColor,

    //taskCenter
    this.tcBgColor,
    this.tcMenuTitleColor,
    this.tcMenuSelectTitleColor,
    this.tcCellTitleColor,
    this.tcCellSubTitleColor,
    this.tcCellSliderBgColor,
    this.tcCellSliderColor,
    this.tcCellSliderTitleColor,
    this.tcCellSliderTitleColor1,
    this.tcCellRightTopStatusColor,
    this.tcCellBottomBtnGradient,
    this.tcCellBottomBtnDisableGradient,
    this.tcCellBottomBtnDisableTitleColor,
    this.tcCellBottomBtnTitleColor,
    this.tcDialogTitleColor,
    this.tcDialogMenuBgColor,
    this.tcDialogMenuTitleColor,
    this.tcDialogMenuSubTitleColor,
    this.tcDialogSliderBgColor,
    this.tcDialogSliderColor,
    this.tcDialogSliderTitleColor,
    this.imgUrl,
    //卡包管理
    this.cardManagerBgImg,

    ///通用的属性
    //页面背景色
    this.withdrawBgColor,
    this.withDrawalNormalBntDecoration,
    this.topBoxBgColor,
    this.topBoxBorderColor,
    this.withDrawalBalanceColor,
    this.withDrawalBalanceColor1,
    this.activeTextColor,
    this.washTxtColor,

    //主要文字颜色（比如充值主页，线上支付、转账汇款、vip充值）
    this.mainTextColor = const Color(0xFF000000),
    this.cardManagerTextColor,
    this.cardManagerNoteColor = const Color(0xFF848DA4),
    //线上支付的子支付模式文字
    this.subTextColor,
    this.neutralColor,
    this.neutralColor1,
    this.neutralColor2,

    ///
    this.usdtJiaochengColor,
    this.remarkColor,
    this.cellDividerColor,
    //提示浏览器不可用
    this.tipsNoColor,

    //卡片背景色.输入框背景色
    this.cardBackgroundColor,
    this.borderColor,

    //普通按钮的颜色，确认，提交
    this.normalButtonTextColor,
    //普通按钮的背景
    // this.normalButtonDecoration,

    //刷新按钮的背景
    this.refreshButtonDecoration,
    this.lightButtonTextColor,
    this.lightButtonDecoration,
    this.cancelButtonTextColor,
    this.cancelButtonDecoration,
    this.saveButtonDecoration,
    //银行卡背景
    this.cardBgGradient,
    this.primaryBtnBg,
    this.secondaryBtnBg,
    this.primaryBtnWarp,

    //银行卡背景
    this.bankCardTextColor,
    this.bankCardDecoration,
    //银行卡背景图片 如果为空 使用默认的图片地址
    this.bankCardBgImage,

    //添加银行卡按钮
    this.addButtonTextColor,
    this.addButtonDecoration,

    //提现账户输入框颜色
    this.inputAccountColor,

    //底部提示文字隐藏
    this.hideBottomTips,

    //新增账户按钮
    this.addAccountButtonTextColor,
    this.addAccountButtonDecoration,

    //类型点选按钮
    this.typeBtnSelTitleColor,
    this.typeBtnNorTitleColor,
    this.typeButtonSelBgColor,
    this.typeButtonNorBgColor,
    this.dialogTopTextColor, //未用
    this.dialogTopDecoration, //未用

    this.inputLabelColor,
    this.inputBorderColor,
    this.inputTextColor,
    this.inputHintTextColor = const Color(0xFFa5b9d1),
    this.accountInfoCardDecoration,
    this.accountInfoTextColor = const Color(0xFF282828),
    this.withdrawTipTextColor,
    this.withdrawScopeMoneyTextColor = const Color(0xFF00A010),
    this.withdrawKfTextColor,

    ///appbar
    this.appbarDecoration,
    this.appbarDecorationImage,
    this.appbarTitleStyle,
    this.noDataStyle,
    this.fieldTextColor,
    this.addHeaderBgColor,
    this.addHeaderTextColor,
    this.addInputTextColor,
    this.addInputOtherColor,

    //新增账户dialog
    this.addAccountDialogTipsColor,
    this.addAccountDialogTipsBlockColor,

    //当前不能提现 请联系在线客服的颜色
    this.disableWithdrawTipsColor,
    this.gameInitImage,
    //收藏配色
    this.collectionAppBar,
    this.collectionTitle1,

    //资金记录 投注记录
    this.recordsPrimaryGradient,
    this.recordsSelectedTextColor,
    this.recordsUnselectedTextColor,
    this.recordsMainTextColor,
    this.recordsSubTextColor,
    this.recordBgColor,
    this.recordCardColor,
    this.recordsBottomTotalGradient,
    this.recordsBottomTotalTextColor,
    this.recordsBottomTotalMoneyTextColor,
  });

//克隆对象 暂时没用到
//  copyWith({
//   String? siteTag,
//   Color? primary,
//   Color? primaryOne,
// }) {
//   return AppThemeConfig(
//     siteTag: siteTag ?? this.siteTag,
//     primary: primary ?? this.primary,
//     primaryOne: primaryOne ?? this.primaryOne,

//   );
// }
}
