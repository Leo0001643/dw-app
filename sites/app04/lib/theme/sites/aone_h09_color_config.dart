
import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';

import '../color_schema.dart';


 AppThemeConfig getH09AppThemeConfig(){
   
   return AppThemeConfig(
    siteTag: 'h09',
    primary: const Color(0xFF02C285),
    primaryOne: const Color(0xFF02C285),

    //activity
    activityDialogTitleTextColor: Colors.black,
    activityDialogSubTitleTextColor: Colors.black,
    activityDialogButtonTextColor: Colors.white,
    activityDialogButtonBgColor: AppTheme.primary,
    activityDialogHintTextColor: Colors.black.withOpacity(0.5),

    //优惠中心
    yhcBgColor: const Color(0xFF093020),
    yhcMoneyColor: const Color(0xFF44FFC4),
    yhcBtnTitleColor: const Color(0xFF44FFC4),
    yhcBtnDisableTitleColor: Colors.white,
    yhcBtnBgDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        boxShadow: const [
          BoxShadow(
              color: Color(0xFF2FDAA4), blurRadius: 1, offset: Offset(0, 2))
        ],
        gradient: const LinearGradient(
          colors: [
            Color(0xFF14805E),
            Color(0xFF09513A),
          ],
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
    myOfferReceiveBtnColor: const Color(0xFF249672),
    //taskCenter
    tcBgColor: const Color(0xFFDCEDE7),
    tcMenuTitleColor: const Color(0xFF878FA1),
    tcMenuSelectTitleColor: Colors.white,
    tcCellTitleColor: Colors.white,
    tcCellSubTitleColor: const Color(0xFF249672),
    tcCellSliderBgColor: const Color(0xFF003927),
    tcCellSliderColor: const Color(0xFF249672),
    tcCellSliderTitleColor: Colors.white,
    tcDialogTitleColor: Colors.white,
    tcDialogMenuBgColor: const Color(0xFF249672),
    tcDialogMenuTitleColor: Colors.white,
    tcDialogMenuSubTitleColor: Colors.white,
    tcDialogSliderBgColor: const Color(0xFF003927),
    tcDialogSliderTitleColor: Colors.white,
    tcDialogSliderColor: const Color(0xFF249672),
    tcCellRightTopStatusColor: Colors.white,
    tcCellBottomBtnGradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF48C8A0),
          Color(0xFF15815F),
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

    //返水
    fsBgColor: const Color(0xff13805E),
    fsAppbarGradient: const LinearGradient(
      colors: [Color(0xff13805E), Color(0xff06C285)],
    ),
    fsHeaderCardBgColor: Colors.white,
    fsPrimaryColor: Colors.black,
    fsButtonGradient: const LinearGradient(
      colors: [Color(0xff30652B), Color(0xff5A976C)],
    ),
    fsButtonTextColor: Colors.white,
    // fsTitleBgColor: Colors.transparent,
    fsTitleSelectedColor: const Color(0xffffffff),
    fsTitleUnSelectedColor: const Color(0xff06C285),
    fsTitleSelectedBgGradient: const LinearGradient(
      colors: [Color(0xff30652B), Color(0xff5A976C)],
    ),
    fsTitleUnSelectedBgGradient: const LinearGradient(
      colors: [Color(0xff30652B), Color(0xff30652B)],
    ),
    fsTitleBorderColor: const Color(0xff06C285),
    // fsItemBgColor: Colors.transparent,
    fsItemBgGradient: const LinearGradient(
      colors: [Color(0xff30652B), Color(0xff5A976C)],
    ),
    fsNoDataTextColor: Colors.black,
    fsItemContentColor: Colors.white,

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
      addHeaderTextColor : const Color(0xff364658),
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