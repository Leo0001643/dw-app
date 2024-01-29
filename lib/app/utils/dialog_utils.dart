import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/access_route_dialog.dart';
import 'package:leisure_games/app/widget/bullet_bottom_dialog.dart';
import 'package:leisure_games/app/widget/confirm_betting_dialog.dart';
import 'package:leisure_games/app/widget/currency_dialog.dart';
import 'package:leisure_games/app/widget/game_brand_bottom_dialog.dart';
import 'package:leisure_games/app/widget/game_role_bottom_dialog.dart';
import 'package:leisure_games/app/widget/history_lottery_btm_dialog.dart';
import 'package:leisure_games/app/widget/language_dialog.dart';
import 'package:leisure_games/app/widget/load_game_dialog.dart';
import 'package:leisure_games/app/widget/lucky_draw_dialog.dart';
import 'package:leisure_games/app/widget/message_dialog.dart';
import 'package:leisure_games/app/widget/notice_dialog.dart';
import 'package:leisure_games/app/widget/rebate_role_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_account_btm_dialog.dart';
import 'package:leisure_games/app/widget/select_area_btm_dialog.dart';
import 'package:leisure_games/app/widget/select_bank_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_option_btm_dialog.dart';
import 'package:leisure_games/app/widget/select_payway_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_room_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_usdt_btm_dialog.dart';
import 'package:leisure_games/app/widget/select_wallet_bottom_dialog.dart';
import 'package:leisure_games/app/widget/sign_success_dialog.dart';
import 'package:leisure_games/app/widget/squeeze_btm_dialog.dart';
import 'package:leisure_games/app/widget/unbroken_number_btm_dialog.dart';
import 'package:leisure_games/ui/bean/back_water_desc_entity.dart';
import 'package:leisure_games/ui/bean/bank_entity.dart';
import 'package:leisure_games/ui/bean/bet_shake_entity.dart';
import 'package:leisure_games/ui/bean/btc_source_entity.dart';
import 'package:leisure_games/ui/bean/change_main_page_event.dart';
import 'package:leisure_games/ui/bean/check_point_entity.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';
import 'package:leisure_games/ui/bean/payment_list_entity.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';
import 'package:leisure_games/ui/bean/usdt_channel_entity.dart';
import 'package:leisure_games/ui/bean/usdt_entity.dart';
import 'package:leisure_games/ui/bean/user_draw_detail_entity.dart';
import 'package:leisure_games/ui/main/home/game_room/dialog/betting_btm_dialog.dart';
import 'package:leisure_games/ui/main/home/game_room/dialog/not_sufficient_funds_dialog.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_logic.dart';
import 'package:leisure_games/ui/main/home/sign_in/sign_in_logic.dart';
import 'package:leisure_games/ui/main/mine/mine_logic.dart';

import '../widget/bottom_access_route_dialog.dart';
import '../widget/jump_type_dialog.dart';
import '../widget/select_account_btm_usdt_dialog.dart';
import '../widget/select_option_btm_gird_dialog.dart';

class DialogUtils {
  DialogUtils._internal();

  static DialogUtils? instance;

  static getInstance() {
    instance ??= DialogUtils._internal();
    return instance;
  }

  factory DialogUtils() => getInstance();

  ///选择语言
  void showLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            contentPadding: EdgeInsets.zero,
            content: LanguageDialog(),
          );
        });
  }

  ///选择钱包
  Future<bool?> showCurrencyDialog(BuildContext context) {
    return showDialog<bool?>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            contentPadding: EdgeInsets.zero,
            content: CurrencyDialog(),
          );
        });
  }

  ///选择线路
  Future<String?> showAccessRouteDialog(
      BuildContext context, List<String> list, String path) {
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            contentPadding: EdgeInsets.zero,
            backgroundColor: ColorX.cardBg5(),
            content: AccessRouteDialog(list, path),
          );
        });
  }

  Future<String?> showAccessRouteDialog2(BuildContext context) {
    return showModalBottomSheet<String>(
      backgroundColor: ColorX.appBottomDialog(), // 设置底部模态表单的背景颜色
      context: context,
      builder: (context) => BottomAccessRouteDialog(),
    );
  }

  ///退出登录
  Future<bool?> showLogoutDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
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
                  child: Text(
                    Intr().shifoutuichudenglu,
                    style: TextStyle(fontSize: 16.sp, color: ColorX.text0917()),
                  ),
                ),
                Divider(
                  color: ColorX.color_10_949,
                  height: 1.h,
                ),
                Align(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetUtils().buildElevatedButton(
                            Intr().cancel, 116.w, 40.h,
                            bg: ColorX.cardBg3(),
                            textColor: ColorX.text586(), onPressed: () {
                          Navigator.of(context).pop(false);
                        }),
                        SizedBox(
                          width: 10.w,
                        ),
                        WidgetUtils().buildElevatedButton(
                            Intr().confirm, 116.w, 40.h,
                            bg: ColorX.color_fc243b,
                            textColor: Colors.white, onPressed: () {
                          Navigator.of(context).pop(true);
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  ///

  //重新绘制
  Future<bool?> showGetureDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
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
                  child: Text(
                    Intr().shifouchongxinhuizhi,
                    style: TextStyle(fontSize: 16.sp, color: ColorX.text0917()),
                  ),
                ),
                Divider(
                  color: ColorX.color_10_949,
                  height: 1.h,
                ),
              ],
            ),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            actions: [
              WidgetUtils().buildElevatedButton(Intr().cancel, 116.w, 40.h,
                  bg: ColorX.cardBg3(),
                  textColor: ColorX.text586(), onPressed: () {
                Navigator.of(context).pop(false);
              }),
              SizedBox(
                width: 10.w,
              ),
              WidgetUtils().buildElevatedButton(Intr().confirm, 116.w, 40.h,
                  bg: ColorX.color_fc243b,
                  textColor: Colors.white, onPressed: () {
                Navigator.of(context).pop(true);
              })
            ],
          );
        });
  }

  ///游戏页面加载选择弹窗
  Future<bool?> showLoadGameDialog(BuildContext context, String title) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          // return LoadGameDialog().create(context, title);
          return JumpTypeDialog(title);
        });
  }

  ///信息确认弹窗
  Future<bool?> showMessageDialog(BuildContext context, String msg,
      {String? title,
      String? btnConfirm,
      String? btnCancel,
      VoidCallback? onConfirm,
      VoidCallback? onCancel,
      bool? divider = false}) {
    title = title ?? Intr().tishi;
    btnConfirm = btnConfirm ?? Intr().confirm;
    btnCancel = btnCancel ?? Intr().cancel;

    return showDialog<bool>(
        context: context,
        builder: (context) {
          return MessageDialog(divider: divider).create(context, msg,
              title: title,
              btnConfirm: btnConfirm,
              btnCancel: btnCancel,
              onConfirm: onConfirm,
              onCancel: onCancel);
        });
  }

  ///信息确认弹窗
  Future<bool?> showNoticeDialog(
      BuildContext context, String title, String msg) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return NoticeDialog(title, msg);
        });
  }

  ///跳转应用内，应用外
  Future<bool?> showJumpTypeDialog(
      BuildContext context, String title, String msg) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return JumpTypeDialog(title);
        });
  }

  ///选择房间
  Future<Pc28LottoRoomsTables?> showSelectRoomBtmDialog(
      BuildContext context, Pc28LottoEntity pc28Lotto) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectRoomBottomDialog(pc28Lotto),
          );
        });
  }

  ///游戏品牌
  Future<GameKindGameKindList?> showGameBrandBtmDialog(
      BuildContext context, List<GameKindGameKindList> list) {
    return showModalBottomSheet<GameKindGameKindList>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: GameBrandBottomDialog(list),
          );
        });
  }

  ///切换钱包
  void showSelectWalletBtmDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectWalletBottomDialog(),
          );
        });
  }

  ///选择付款方式
  Future<PaymentListBanks?> showSelectPaywayBtmDialog(
      BuildContext context, PaymentListEntity entity) {
    return showModalBottomSheet<PaymentListBanks>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectPaywayBottomDialog(entity),
          );
        });
  }

  ///选择银行
  Future<BankEntity?> showSelectBankBtmDialog(
      BuildContext context, List<BankEntity> list) {
    return showModalBottomSheet<BankEntity>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectBankBottomDialog(list),
          );
        });
  }

  ///游戏规则
  void showGameRoleBtmDialog(
      BuildContext context, int tabIndex, RoomListLogic logic) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: GameRoleBottomDialog(tabIndex, logic),
          );
        });
  }

  ///返水比例
  void showRebateRoleBtmDialog(BuildContext context, BackWaterDescEntity desc) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: RebateRoleBottomDialog(desc),
          );
        });
  }

  ///底部区号选择弹窗
  Future<String?> showSelectAreaBtmDialog(
      BuildContext context, Map<String, List<String>> data) {
    return showModalBottomSheet<String>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SelectAreaBtmDialog(data);
        });
  }

  ///底部区号选择弹窗
  Future<UsdtChannelEntity?> showSelectUsdtBtmDialog(
      BuildContext context, List<UsdtChannelEntity> data) {
    return showModalBottomSheet<UsdtChannelEntity>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SelectUsdtBtmDialog(data);
        });
  }

  ///单选底部弹窗
  Future<dynamic> showSelectOptionBtmDialog(
      BuildContext context, String title, List data) {
    return showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectOptionBtmDialog(title, data),
          );
        });
  }

  Future<dynamic> showSelectOptionBtmGirdDialog(
      BuildContext context, String title, List data) {
    return showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectOptionBtmGirdDialog(title, data),
          );
        });
  }

  ///选择账户弹窗
  Future<UserDrawDetailBanks?> showSelectAccountBtmDialog(
      BuildContext context, List<UserDrawDetailBanks> data) {
    return showModalBottomSheet<UserDrawDetailBanks>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectAccountBtmDialog(data),
          );
        });
  }

  Future<UsdtEntity?> showSelectAccountBtmUsdtDialog(
      BuildContext context, List<UsdtEntity> data) {
    return showModalBottomSheet<UsdtEntity>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectAccountBtmUsdtDialog(data),
          );
        });
  }


  ///完整号源
  Future<dynamic> showUnbrokenNumberBtmDialog(
      BuildContext context, BtcSourceEntity item) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: UnbrokenNumberBtnDialog(item),
          );
        });
  }

  ///历史开奖
  Future<dynamic> showHistoryLotteryBtmDialog(
      BuildContext context, GameRoomLogic logic) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: HistoryLotteryBtmDialog(logic),
          );
        });
  }

  ///咪牌
  Future<dynamic> showSqueezeBtmDialog(
      BuildContext context, GameRoomLogic logic) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(18.r), topLeft: Radius.circular(18.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SqueezeBtmDialog(logic),
          );
        });
  }

  ///投注
  Future<dynamic> showBettingBtmDialog(
      BuildContext context, GameRoomLogic logic) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return BettingBtmDialog(logic);
        });
  }

  ///确认注单
  void showConfirmBetDialog(BuildContext context, GameRoomLogic logic,{double total=0}) {
    MineLogic   mineLogic = Get.find<MineLogic>();
    double selfMoney=mineLogic.state.cnyBal.value.money??0;
    if(selfMoney<total) {
      showMessageDialog(context,"余额不足,投注失败。是否前往充值",title:"提示",onConfirm: (){
        eventBus.fire(ChangeMainPageEvent(2));
        Navigator.pop(context);
      });
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            backgroundColor: ColorX.cardBg5(),
            contentPadding: EdgeInsets.zero,
            content: ConfirmBettingDialog(logic),
          );
        });
  }

  ///弹幕
  Future<dynamic> showBulletBtmDialog(
      BuildContext context, GameRoomLogic logic, Function valueCallBack) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r), topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: ColorX.pageBg(),
        builder: (context) {
          return BulletBottomDialog(logic, valueCallBack);
        });
  }

  ///确认签到
  void showSignSuccessDialog(
      BuildContext context, SignInLogic logic, CheckPointEntity check) {
    showDialog(
        context: context,
        builder: (context) {
          return SignSuccessDialog(logic, check);
        });
  }

  ///抽奖详情
  Future<bool?> showLuckyDrawDialog(
      BuildContext context, List<BetShakeEntity> result) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return LuckyDrawDialog(result);
        });
  }
}
