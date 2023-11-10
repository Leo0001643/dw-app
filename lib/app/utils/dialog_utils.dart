
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/access_route_dialog.dart';
import 'package:leisure_games/app/widget/betting_btm_dialog.dart';
import 'package:leisure_games/app/widget/bullet_bottom_dialog.dart';
import 'package:leisure_games/app/widget/confirm_betting_dialog.dart';
import 'package:leisure_games/app/widget/currency_dialog.dart';
import 'package:leisure_games/app/widget/game_brand_bottom_dialog.dart';
import 'package:leisure_games/app/widget/game_role_bottom_dialog.dart';
import 'package:leisure_games/app/widget/history_lottery_btm_dialog.dart';
import 'package:leisure_games/app/widget/language_dialog.dart';
import 'package:leisure_games/app/widget/lucky_draw_dialog.dart';
import 'package:leisure_games/app/widget/rebate_role_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_option_btm_dialog.dart';
import 'package:leisure_games/app/widget/select_payway_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_room_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_wallet_bottom_dialog.dart';
import 'package:leisure_games/app/widget/sign_success_dialog.dart';
import 'package:leisure_games/app/widget/squeeze_btm_dialog.dart';
import 'package:leisure_games/app/widget/unbroken_number_btm_dialog.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/sign_in/sign_in_logic.dart';

class DialogUtils {

  DialogUtils._internal();

  static DialogUtils? instance;

  static getInstance() {
    instance ??= DialogUtils._internal();
    return instance;
  }

  factory DialogUtils() => getInstance();


  void showLanguageDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            contentPadding: EdgeInsets.zero,
            content: LanguageDialog(),
          );
        }
    );
  }


  void showCurrencyDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            contentPadding: EdgeInsets.zero,
            content: CurrencyDialog(),
          );
        }
    );
  }

  void showAccessRouteDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            contentPadding: EdgeInsets.zero,
            content: AccessRouteDialog(),
          );
        }
    );
  }

  Future<bool?> showLogoutDialog(BuildContext context){
    return showDialog<bool>(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70.h,
                  alignment: Alignment.center,
                  child: Text(Intr().shifoutuichudenglu
                    ,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917()),),
                ),
                Divider(color: ColorX.color_10_949,height: 1.h,),
              ],
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
            actions: [
              WidgetUtils().buildElevatedButton(Intr().cancel, 116.w, 40.h,
                  bg: ColorX.cardBg3(),textColor: ColorX.text586(),onPressed: (){
                Navigator.of(context).pop(false);
              }),
              SizedBox(width: 10.w,),
              WidgetUtils().buildElevatedButton(Intr().confirm, 116.w, 40.h,
                  bg: ColorX.color_fc243b,textColor: Colors.white,onPressed: (){
                    Navigator.of(context).pop(true);
              })
            ],
          );
        }
    );
  }


  ///选择房间
  Future<Pc28LottoRoomsTables?> showSelectRoomBtmDialog(BuildContext context,Pc28LottoEntity pc28Lotto){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectRoomBottomDialog(pc28Lotto),
          );
        }
    );
  }


  ///游戏品牌
  void showGameBrandBtmDialog(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),topLeft: Radius.circular(20.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: GameBrandBottomDialog(),
          );
        }
    );
  }

  ///切换钱包
  void showSelectWalletBtmDialog(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectWalletBottomDialog(),
          );
        }
    );
  }

  ///选择付款方式
  Future<int?> showSelectPaywayBtmDialog(BuildContext context){
    return showModalBottomSheet<int>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectPaywayBottomDialog(),
          );
        }
    );
  }

  ///游戏规则
  void showGameRoleBtmDialog(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: GameRoleBottomDialog(),
          );
        }
    );
  }

  ///返水比例
  void showRebateRoleBtmDialog(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: RebateRoleBottomDialog(),
          );
        }
    );
  }

  ///单选底部弹窗
  Future<dynamic> showSelectOptionBtmDialog(BuildContext context,String title,List data){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectOptionBtmDialog(title,data),
          );
        }
    );
  }



  ///完整号源
  Future<dynamic> showUnbrokenNumberBtmDialog(BuildContext context){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: UnbrokenNumberBtnDialog(),
          );
        }
    );
  }


  ///历史开奖
  Future<dynamic> showHistoryLotteryBtmDialog(BuildContext context,GameRoomLogic logic){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: HistoryLotteryBtmDialog(logic),
          );
        }
    );
  }

  ///咪牌
  Future<dynamic> showSqueezeBtmDialog(BuildContext context,GameRoomLogic logic){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(18.r),topLeft: Radius.circular(18.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SqueezeBtmDialog(logic),
          );
        }
    );
  }

  ///投注
  Future<dynamic> showBettingBtmDialog(BuildContext context,GameRoomLogic logic){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return BettingBtmDialog(logic);
        }
    );
  }

  ///确认注单
  void showConfirmBetDialog(BuildContext context,GameRoomLogic logic){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            contentPadding: EdgeInsets.zero,
            content: ConfirmBettingDialog(logic),
          );
        }
    );
  }

  ///弹幕
  Future<dynamic> showBulletBtmDialog(BuildContext context,GameRoomLogic logic,Function valueCallBack){
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context){
          return BulletBottomDialog(logic,valueCallBack);
        }
    );
  }



  ///确认签到
  void showSignSuccessDialog(BuildContext context,SignInLogic logic){
    showDialog(
        context: context,
        builder: (context){
          return SignSuccessDialog(logic);
        }
    );
  }

  ///抽奖详情
  void showLuckyDrawDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return LuckyDrawDialog();
        }
    );
  }



}


