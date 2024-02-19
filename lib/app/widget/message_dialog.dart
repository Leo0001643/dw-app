
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

class MessageDialog{
  bool? divider=true;
  MessageDialog({this.divider});
  AlertDialog create(BuildContext context,String msg,{String? title,String? btnConfirm,String? btnCancel,VoidCallback? onConfirm,VoidCallback? onCancel}){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      backgroundColor: ColorX.cardBg5(),
      titlePadding: EdgeInsets.only(top: 10.h),
      contentPadding: EdgeInsets.all(15.r),
      title: Center(
        child: Text(title.em(),style: TextStyle(fontSize: 16.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w600,),),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(msg,
              style: TextStyle(fontSize: 15.sp,color: ColorX.text0917()),),
          ),
          Visibility(
            visible: this.divider==true,
              child: Divider(color: ColorX.color_10_949,height: 1.h,)),
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
                      btnCancel.em(), 116.w, 40.h,
                      bg: ColorX.cardBg3(),
                      textColor: ColorX.text586(), onPressed: () {
                    if(onCancel == null){
                      Navigator.of(context).pop(false);
                    }else {
                      onCancel.call();
                    }
                  }),
                  SizedBox(
                    width: 10.w,
                  ),
                  WidgetUtils().buildElevatedButton(
                      btnConfirm.em(), 116.w, 40.h,
                      bg: ColorX.color_fc243b,
                      textColor: Colors.white, onPressed: (){
                        if(onConfirm == null){
                          Navigator.of(context).pop(true);
                        }else {
                          onConfirm.call();
                        }
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}




