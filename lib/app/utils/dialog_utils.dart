
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/widget/currency_dialog.dart';
import 'package:leisure_games/app/widget/language_dialog.dart';

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


  void showEditFastBtmDialog(BuildContext context){
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
            child: Container(),
          );
        }
    );
  }



}


