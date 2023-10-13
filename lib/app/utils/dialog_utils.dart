
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/widget/access_route_dialog.dart';
import 'package:leisure_games/app/widget/currency_dialog.dart';
import 'package:leisure_games/app/widget/game_role_bottom_dialog.dart';
import 'package:leisure_games/app/widget/language_dialog.dart';
import 'package:leisure_games/app/widget/select_room_bottom_dialog.dart';
import 'package:leisure_games/app/widget/select_wallet_bottom_dialog.dart';

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


  ///选择房间
  void showSelectRoomBtmDialog(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)),
        ),
        backgroundColor: Colors.white,
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectRoomBottomDialog(),
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
        backgroundColor: Colors.white,
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SelectWalletBottomDialog(),
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
        backgroundColor: Colors.white,
        builder: (context){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: GameRoleBottomDialog(),
          );
        }
    );
  }



}


