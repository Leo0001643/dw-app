
import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import '../color_schema.dart';

AppThemeConfig getH18AppThemeConfig(){
   return AppThemeConfig(
    siteTag: 'h18',
    primary: const Color(0xFFa98a68),
    primaryOne: const Color(0xFFa98a68),
    noticeStyle3TitleBgGradient: AppTheme.brownCommonGradient,
    noticeStyle3KnowBgGradient: AppTheme.brownCommonGradient,

    //返水
    fsBgColor: const Color(0xFF2C1500),
    fsAppbarGradient: const LinearGradient(
      colors: [Color(0xFF693409), Color(0xFFA98A67)],
    ),
    fsHeaderCardBgColor: const Color(0xFFFBFAF9),
    fsPrimaryColor: const Color(0xff6B4321),
    fsButtonGradient: const LinearGradient(
      colors: [Color(0xFF693409), Color(0xFFA98A67)],
    ),
    fsButtonTextColor: Colors.white,
    fsTitleSelectedColor: Colors.white,
    fsTitleUnSelectedColor: const Color(0xFFA98A67),
    fsTitleSelectedBgGradient: const LinearGradient(
      colors: [Color(0xFF693409), Color(0xFFA98A67)],
    ),
    fsTitleUnSelectedBgGradient: const LinearGradient(
      colors: [Color(0xFF2C1500), Color(0xFF2C1500)],
    ),
    fsTitleBorderColor: const Color(0xFFA98A67),
    fsItemBgGradient: const LinearGradient(
      colors: [Color(0xFF693409), Color(0xFFA98A67)],
    ),
    fsItemContentColor: Colors.white,
    fsNoDataTextColor: Colors.white,

    fsDetailAppbarGradient: const LinearGradient(
      colors: [Color(0xFF693409), Color(0xFFA98A67)],
    ),
    fsDetailBackgroundColor: const Color(0xFF2C1500),
    fsDetailPrimary: const Color(0xff693409),
    fsDetailSecondBg: const Color(0xffFBFAF9),
    fsDetailItemBg1: const Color(0xffF3F4F5),
    fsDetailItemBg2: const Color(0xFFFBFAF9),
    fsDetailItemTextColor: const Color(0xff693409),

    //activity
    activityDialogTitleTextColor: Colors.black,
    activityDialogSubTitleTextColor: Colors.black,
    activityDialogButtonTextColor: Colors.white,
    activityDialogButtonBgColor: AppTheme.primary,
    activityDialogHintTextColor: Colors.black.withOpacity(0.5),

    //优惠中心
    yhcBgColor: const Color(0xFF2C1500),
    yhcMoneyColor: Colors.white,
    yhcBtnTitleColor: Colors.white,
    yhcBtnDisableTitleColor: Colors.white,
    yhcBtnBgDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFDCB68C), blurRadius: 1, offset: Offset(0, 2))
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFFA88966), Color(0xFF693409)],
        )),
    yhcBtnDisableBgDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFFD3D3D3), blurRadius: 1, offset: Offset(0, 2))
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF949494), Color(0xFF545454)],
        )),

    //我的优惠
    myOfferReceiveBtnColor: const Color(0xFFE76F51),

    //taskCenter
    tcBgColor: const Color(0xFF211100),
    tcMenuTitleColor: const Color(0xFFF6E1C8),
    tcMenuSelectTitleColor: Colors.white,
    tcCellTitleColor: Colors.white,
    tcCellSubTitleColor: Colors.white,
    tcCellSliderBgColor: const Color(0xFF999999),
    tcCellSliderColor: Colors.white,
    tcCellSliderTitleColor: Colors.white,
    tcCellSliderTitleColor1: Colors.black,
    tcDialogTitleColor: Colors.white,
    tcDialogMenuBgColor: Colors.white,
    tcDialogMenuTitleColor: const Color(0xFF1F0000),
    tcDialogMenuSubTitleColor: Colors.white,
    tcDialogSliderBgColor: const Color(0xFF999999),
    tcDialogSliderColor: Colors.white,
    tcDialogSliderTitleColor: Colors.white,
    tcCellRightTopStatusColor: Colors.white,

    tcCellBottomBtnGradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFA78865),
          Color(0xFF693409),
        ]),
    tcCellBottomBtnDisableGradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFCECECE),
          Color(0xFF818181),
        ]),
    tcCellBottomBtnDisableTitleColor: Colors.white,
    tcCellBottomBtnTitleColor: Colors.white,

     //卡包跟提现
    appbarDecoration:  BoxDecoration(gradient: AppTheme.primaryGradient),
    withdrawBgColor:const Color(0xFFFFFFFF),
    withDrawalNormalBntDecoration: BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(5)),
        color: AppTheme.primary,
      ),
    withDrawalBalanceColor:const Color(0xFF7DBAFE),
    washTxtColor : const Color(0xFF02C285),
    normalButtonTextColor :const Color(0xFFffffff),
    lightButtonTextColor : const Color(0xFF504d4d),
    lightButtonDecoration :const BoxDecoration(
          image:  DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/blank.png', package: 'generics'),
          ),
          color: Color(0xFFF5F7FA),
          // border: Border.all(color: Color(0xFFB1B1B1)),
          borderRadius: BorderRadius.all(Radius.circular(5))),
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
      addHeaderTextColor : Color.fromRGBO(54, 70, 88, 1),
      addInputTextColor : const Color(0xff364658),
      addInputOtherColor : const Color(0xff9AA4B4),
      typeBtnSelTitleColor : Colors.white, //选择类型按钮
      typeBtnNorTitleColor : const Color(0xFF364658),
      cancelButtonTextColor : const Color(0xFF504d4d),
      cancelButtonDecoration:const BoxDecoration(
        color:  Color(0xFFEAEAEA),
        borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(10))),
     saveButtonDecoration: BoxDecoration(
       gradient: LinearGradient(
      colors: 
      [AppTheme.primary, 
       AppTheme.primary],
       ),
        borderRadius: const  BorderRadius.only(bottomRight: Radius.circular(10))),
      topBoxBgColor : const Color(0xFFeef1f8),
      topBoxBorderColor : const Color(0xFFebebeb),
    
      refreshButtonDecoration : BoxDecoration(
        borderRadius:const BorderRadius.all(Radius.circular(15)),
        color:  AppTheme.primary,
      ),
      inputLabelColor : const Color(0xFF282828),
      withdrawTipTextColor : const Color(0xFF504d4d),
      withdrawKfTextColor : const Color(0xffff0000),
      inputAccountColor : Colors.transparent,
      addAccountButtonDecoration : BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(width: 1, color: AppTheme.primary),
      ),
      addAccountButtonTextColor : AppTheme.primary,
      inputTextColor :const Color(0xFF282828),
      inputBorderColor : const Color(0xFFa7adbb),
      addAccountDialogTipsColor : const Color(0xFF9AA4B4),
      addAccountDialogTipsBlockColor : const Color(0xFFF0C59A),
      disableWithdrawTipsColor : Colors.white,
      mainTextColor : const Color(0xFF000000),
      inputHintTextColor:const Color(0xFFa7adbb),
      accountInfoCardDecoration:const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color:  Color(0xFFffffff),
      ),
      accountInfoTextColor:const Color(0xFF504d4d),
  );
}