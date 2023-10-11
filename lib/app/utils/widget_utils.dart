
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/widget/language_dialog.dart';
import 'package:leisure_games/ui/main/main_logic.dart';

class WidgetUtils {

  WidgetUtils._internal();

  static WidgetUtils? instance;

  static getInstance() {
    instance ??= WidgetUtils._internal();
    return instance;
  }

  factory WidgetUtils() => getInstance();



  Widget buildElevatedButton(String text,double width,double height,
      {Color bg = ColorX.color_fc243b,Color textColor = Colors.white,double textSize = 14,VoidCallback? onPressed}){
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: bg,
        minimumSize: Size(width, height),
        maximumSize: Size(width, height),
      ),
      child: Text(text,
        style: TextStyle(fontSize: textSize.sp,color: textColor,fontWeight: FontWeight.w600),
      ),
    );
  }


  Widget buildHomeAppBar({bool msg=false,bool drawer=false,}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 11.w),
      child: Row(
        children: [
          SizedBox(width: 10.w,),
          Image.asset(ImageX.icon_logo,),
          Expanded(child: Container()),
          Visibility(
            visible: msg,
            child: InkWell(
              onTap: ()=> Get.toNamed(Routes.message),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(ImageX.icon_user_msg,),
              ),
            ),
          ),
          Visibility(
            visible: drawer,
            child: InkWell(
              onTap: ()=> Get.find<MainLogic>().openDrawer(),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(ImageX.icon_more,),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(String? title,{bool msg = false,bool drawer=false,bool back=true,Color bgColor = ColorX.color_f7f8fb}){
    return AppBar(
      title: Text(title.em(),
        style: TextStyle(
            fontSize: 16.sp,
            color: ColorX.color_091722,
            fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      backgroundColor: bgColor,
      elevation: 0,
      leading: Visibility(
        visible: back,
        child: InkWell(
          onTap: ()=>Get.back(),
          child: Image.asset(ImageX.icon_page_back),
        ),
      ),
      actions: [
        Visibility(
          visible: msg,
          child: InkWell(
            onTap: ()=> Get.toNamed(Routes.message),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(ImageX.icon_user_msg,),
            ),
          ),
        ),
        Visibility(
          visible: drawer,
          child: InkWell(
            onTap: ()=> Get.find<MainLogic>().openDrawer(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(ImageX.icon_more,),
            ),
          ),
        ),
      ],
    );
  }


  ///构建文本框
  Widget buildTextField(double? width,double? height,double textSize,Color textColor,String? hint,
      {Color backgroundColor = Colors.white,Color hintColor = ColorX.color_5b6d7b, String? defText,ValueChanged<String>? onChanged,
        TextInputType? inputType,bool obscureText=false,bool autofocus=false,bool enabled = true,
        bool suffixIcon=false,int maxLines=1,List<TextInputFormatter>? inputFormatters}){
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      width: width,
      height: height,
      child: suffixIcon ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(defText.em()==""?hint.em():defText.em(),style: TextStyle(fontSize: textSize,color: defText.em()==""?hintColor:textColor,overflow: TextOverflow.ellipsis),),),
          Icon(Icons.keyboard_arrow_down,size: 18.r,color: Colors.black54),
        ],
      ) :TextField(
        autofocus: autofocus,
        enabled: enabled,
        cursorHeight: textSize,
        maxLines: maxLines,
        controller: TextEditingController.fromValue(
            TextEditingValue(
                text: defText.em(),
                selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: defText.em().length))
            )),
        onChanged: onChanged,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        style: TextStyle(fontSize: textSize,color: textColor),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          enabled: enabled,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(fontSize: textSize,color: hintColor),
          labelStyle: TextStyle(fontSize: textSize,color: hintColor),
          errorStyle: TextStyle(fontSize: textSize,color: hintColor),
        ),
      ),
    );
  }






}


