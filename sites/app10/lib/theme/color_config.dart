import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import '../config/site_config.dart';
import 'color_schema.dart';

abstract class AppColorsConfig {
  // static AppThemeConfig get appTheme =>
  //     _siteColorConfigs[AppRuntimeConfig.siteTag]!;
  static AppThemeConfig get appTheme => _siteColorConfigs["a10"]!;
}

final Map<String, AppThemeConfig> _siteColorConfigs = {
  'a10': AppThemeConfig(
    siteTag: 'b97',
    primary: const Color(0xFF271515),
    primaryOne: Colors.black,
    onPrimary: Colors.white,

    //充值
    rechargeTextColor: Colors.white,
    rechargeSelectedColor: const Color(0xFFffb113),
    rechargeUnselectedColor: const Color(0xFFc5c5c5),
    rechargeBtnColor: const Color(0xFFc89d42),
    rechargeHighLightTextColor: const Color(0xFFffb113),

    //user
    userMainTextColor: Colors.white,
    userSubTextColor: const Color(0xFF4b3b1c),
    userSubTextColor1: const Color(0xFF65320C),
    userItemBgColor: const Color(0xFF111111),
    userBgColor: const Color(0xFF0C0C0C),
    userDividerColor: const Color(0xFF1E1E1E),
    userButtonBg: const Color(0xFFC19E52),

    //推广返利
    promotionHeaderBgColor: Colors.black,

    //App更新
    appUpdateBgColor: Colors.black,
    appUpdateLineColor: const Color(0xFF222222),
    appUpdateBtnGradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xffFFC957),
        Color(0xffF6A52A),
      ],
    ),

    //返水
    fsBgColor: const Color(0xFF0C0C0C),
    fsAppbarGradient: const LinearGradient(
      colors: [Color(0xFF0C0C0C), Color(0xFF0C0C0C)],
    ),
    fsHeaderCardBgColor: const Color(0xff151515),
    fsPrimaryColor: const Color(0xffFFE1BE),
    fsButtonGradient: const LinearGradient(
      colors: [Color(0xffFFD6B0), Color(0xffC68764)],
    ),
    fsButtonTextColor: const Color(0xffFFFFFF),
    imgUrl:"assets/images/betback/no_data.png",
    // fsTitleBgColor:
    // fsTitleSelectedBgColor: Colors.transparent,
    // fsTitleUnSelectedBgColor: Colors.transparent,
    // fsTitleSelectedColor: const Color(0xff2B1D0E),
    fsTitleSelectedBgGradient: const LinearGradient(
      colors: [Color(0xffC8AC77), Color(0xffC8AC77)],
    ),
    // fsTitleUnSelectedColor: const Color(0xffC8AC77),
    fsTitleUnSelectedBgGradient: const LinearGradient(
      colors: [Color(0xFF0C0C0C), Color(0xFF0C0C0C)],
    ),
    fsTitleBorderColor: const Color(0xffFFE1BE),
    // fsItemBgColor: const Color(0xffC8AC77),
    fsItemBgGradient: const LinearGradient(
      colors: [Color(0xffC8AC77), Color(0xffC8AC77)],
    ),
    fsItemContentColor: const Color(0xff8E5C36),
    fsNoDataTextColor: Colors.white,

    fsDetailAppbarGradient: const LinearGradient(
      colors: [Color(0xFF0C0C0C), Color(0xFF0C0C0C)],
    ),
    fsDetailBackgroundColor: const Color(0xFF0C0C0C),
    fsDetailPrimary: const Color(0xffFFE1BE),
    fsDetailSecondBg: const Color(0xff1F1F1F),
    fsDetailItemBg1: const Color(0xff1F1F1F),
    fsDetailItemBg2: const Color(0xFF0C0C0C),
    fsDetailItemTextColor: Colors.white,


    //卡包跟提现
    appbarDecoration: BoxDecoration(color: AppTheme.primaryBg),
    withdrawBgColor:const Color(0xFFFFFFFF),
    withDrawalNormalBntDecoration:const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xFFC89D42),
      ),
    withDrawalBalanceColor:const Color(0xFF7DBAFE),
    washTxtColor : const Color(0xff4AD134),
    normalButtonTextColor :Colors.white,
    lightButtonTextColor : const Color(0xFF000000),
    lightButtonDecoration : const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color:  Color(0xFFF3F4F9),
      ),
    bankCardTextColor: Colors.white,
    
    addButtonTextColor : const Color(0xFFa7adbb),
    addButtonDecoration :const BoxDecoration(
        image:  DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/blank.png', package: 'generics'),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5))),
      fieldTextColor : Colors.black,
      addHeaderBgColor : const Color(0xffF1F4F9),
      addHeaderTextColor : const Color(0xff364658),
      addInputTextColor : const Color(0xff364658),
      addInputOtherColor : const Color(0xff9AA4B4),
      typeBtnSelTitleColor : Colors.white, //选择类型按钮
      typeBtnNorTitleColor : Colors.black,
      cancelButtonTextColor : const Color(0xFFc89d42),
      cancelButtonDecoration:const BoxDecoration(
        color:  Color(0xFFEAEAEA),
        borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(10))),
      saveButtonDecoration:const BoxDecoration(
       gradient: LinearGradient(
      colors: 
      [ Color(0xFFC89D42), 
        Color(0xFFC89D42)],
       ),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
      topBoxBgColor : const Color(0xFFeef1f8),
      topBoxBorderColor : const Color(0xFFebebeb),
    
      refreshButtonDecoration :const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color:  Color(0xFFc89d42),
      ),
      inputLabelColor : const Color(0xFF282828),
      withdrawTipTextColor : const Color(0xFF212121),
      withdrawKfTextColor : const Color(0xFFC89D42),
      inputAccountColor : Colors.transparent,
      addAccountButtonDecoration : BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 1, color: const Color(0xFFc89d42)),
     ),
      addAccountButtonTextColor : const Color(0xFFc89d42),
      inputTextColor :const Color(0xFF282828),
      inputBorderColor : const Color(0xFFa5b9d1),
      addAccountDialogTipsColor : const Color(0xFF9AA4B4),
      addAccountDialogTipsBlockColor : const Color(0xFFF0C59A),
      disableWithdrawTipsColor : Colors.white,
      mainTextColor : const Color(0xFF000000),
      accountInfoCardDecoration:const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color:  Color(0xFFeef1f8),
      )
  )
};
