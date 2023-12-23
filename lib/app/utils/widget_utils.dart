
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/main/main_logic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class WidgetUtils {

  WidgetUtils._internal();

  static WidgetUtils? instance;

  static getInstance() {
    instance ??= WidgetUtils._internal();
    return instance;
  }

  factory WidgetUtils() => getInstance();



  Widget buildElevatedButton(String text,double width,double height,
      {Color? bg,Color textColor = Colors.white,double textSize = 14,VoidCallback? onPressed}){
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: bg,
        minimumSize: Size(width, height),
        maximumSize: Size(width, height),
        padding: EdgeInsets.zero,
      ),
      child: Text(text,
        style: TextStyle(fontSize: textSize.sp,color: textColor,fontWeight: FontWeight.w600),
      ),
    );
  }


  Widget buildHomeAppBar({bool msg=false,bool drawer=false,}){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 10.r),
      child: Row(
        children: [
          SizedBox(width: 10.w,),
          Image.asset(ImageX.icon_logo,),
          Expanded(child: Container()),
          Visibility(
            visible: msg,
            child: InkWell(
              onTap: ()=> goMessageCenter(),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(ImageX.icon_user_msg,color: ColorX.icon586(),),
              ),
            ),
          ),
          Visibility(
            visible: drawer,
            child: InkWell(
              onTap: ()=> Get.find<MainLogic>().openDrawer(),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(ImageX.icon_more,color: ColorX.icon586(),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(String? title,{bool msg = false,bool drawer=false,bool back=true,Color? bgColor}){
    return AppBar(
      title: Text(title.em(),
        style: TextStyle(
            fontSize: 16.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      backgroundColor: bgColor ?? ColorX.appBarBg2(),
      elevation: 0,
      toolbarHeight: 44.h,
      leading: Visibility(
        visible: back,
        child: InkWell(
          onTap: ()=>Get.back(),
          child: Image.asset(ImageX.icon_page_back,),
        ),
      ),
      actions: [
        Row(
          children: [
            Visibility(
              visible: msg,
              child: InkWell(
                onTap: ()=> goMessageCenter(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(ImageX.icon_user_msg,color: ColorX.icon586(),),
                ),
              ),
            ),
            Visibility(
              visible: drawer,
              child: InkWell(
                onTap: ()=> Get.find<MainLogic>().openDrawer(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(ImageX.icon_more,color: ColorX.icon586(),),
                ),
              ),
            ),
            SizedBox(width: 10.w,),
          ],
        ),
      ],
    );
  }

  AppBar buildAppBarBtn(String? title,Widget right){
    return AppBar(
      title: Text(title.em(),
        style: TextStyle(
            fontSize: 16.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      backgroundColor: ColorX.appBarBg(),
      elevation: 0,
      toolbarHeight: 44.h,
      leading: InkWell(
        onTap: ()=>Get.back(),
        child: Image.asset(ImageX.icon_page_back),
      ),
      actions: [right],
    );
  }


  AppBar buildRxAppBar(RxString title,{bool msg = false,bool back=true,Color? bgColor}){
    return AppBar(
      title: Obx(() {
        return Text(title.value,
          style: TextStyle(
              fontSize: 16.sp,
              color: ColorX.text0917(),
              fontWeight: FontWeight.w600),
        );
      }),
      centerTitle: true,
      backgroundColor: bgColor ?? ColorX.appBarBg2(),
      elevation: 0,
      toolbarHeight: 44.h,
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
            onTap: ()=> goMessageCenter(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(ImageX.icon_user_msg,color: ColorX.icon586(),),
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildRoomBar(RxString title,{bool msg = false,bool back=true,
    Color? bgColor,GestureTapCallback? onTap,}){
    return AppBar(
      title: InkWell(
        onTap: onTap,
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Obx(() {
              return Text(title.value,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorX.text0917(),
                    fontWeight: FontWeight.w600),
              );
            }),
            SizedBox(width: 5.w,),
            Image.asset(ImageX.icon_down_black,color: ColorX.icon586(),),
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: bgColor ?? ColorX.appBarBg2(),
      elevation: 0,
      toolbarHeight: 44.h,
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
            onTap: ()=> goMessageCenter(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(ImageX.icon_user_msg,color: ColorX.icon586(),),
            ),
          ),
        ),
      ],
    );
  }


  AppBar buildGameBar(RxString title,Widget subTitle,{bool msg = false,bool collect = false, bool back=true,
    Color? bgColor,GestureTapCallback? onTap,GestureTapCallback? onCollect,}){
    return AppBar(
      title: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Obx(() {
                  return Text(title.value,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorX.text0917(),
                        fontWeight: FontWeight.w600),
                  );
                }),
                SizedBox(width: 5.w,),
                Image.asset(ImageX.icon_down_black),
              ],
            ),
            SizedBox(height: 3.h,),
            subTitle,
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: bgColor ?? ColorX.appBarBg2(),
      elevation: 0,
      toolbarHeight: 44.h,
      leading: Visibility(
        visible: back,
        child: InkWell(
          onTap: ()=>Get.back(),
          child: Image.asset(ImageX.icon_page_back),
        ),
      ),
      actions: [
        Row(
          children: [
            Visibility(
              visible: collect,
              child: InkWell(
                onTap: onCollect,
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: const Icon(Icons.collections_outlined,color: ColorX.color_091722,),
                ),
              ),
            ),
            Visibility(
              visible: msg,
              child: InkWell(
                onTap: ()=> goMessageCenter(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(ImageX.icon_user_msg,color: ColorX.icon586(),),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  AppBar buildHtmlBar(RxString title,{bool back=true,Color? bgColor}){
    return AppBar(
      title: Obx(() {
        return Text(title.value,
          style: TextStyle(
              fontSize: 16.sp,
              color: ColorX.text0917(),
              fontWeight: FontWeight.w600),
        );
      }),
      centerTitle: true,
      backgroundColor: bgColor ?? ColorX.appBarBg2(),
      elevation: 0,
      toolbarHeight: 44.h,
      leading: Visibility(
        visible: back,
        child: InkWell(
          onTap: ()=>Get.back(),
          child: Image.asset(ImageX.icon_page_back,),
        ),
      ),
    );
  }


  ///构建文本框
  Widget buildTextField(double? width,double? height,double textSize,Color textColor,String? hint,
      {Color backgroundColor = Colors.white,Color hintColor = ColorX.color_5b6d7b, String? defText,ValueChanged<String>? onChanged,
        TextInputType? inputType,bool obscureText=false,bool autofocus=false,bool enabled = true,
        bool suffixIcon=false,int maxLines=1,List<TextInputFormatter>? inputFormatters,FocusNode? focusNode}){
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      width: width,
      height: height,
      child: suffixIcon ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Text(defText.em()==""?hint.em():defText.em(),style: TextStyle(fontSize: textSize,color: defText.em()==""?hintColor:textColor,overflow: TextOverflow.ellipsis),),),
          // Icon(Icons.keyboard_arrow_down,size: 18.r,color: Colors.black54),
        ],
      ) :TextField(
        autofocus: autofocus,
        enabled: enabled,
        cursorHeight: textSize,
        maxLines: maxLines,
        focusNode: focusNode,
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


  void clickCopy(String value){
    if(unEmpty(value)){
      Clipboard.setData(ClipboardData(text: value));
      showToast(Intr().fuzhichenggong);
    }
  }

  void goMessageCenter() {
    if(AppData.isLogin()){
      Get.toNamed(Routes.message_center);
    } else {
      goLogin();
    }
  }

  void goLogin(){
    if(unEmpty(AppData.simplePwd())){
      Get.toNamed(Routes.simple_login);
    } else {
      Get.toNamed(Routes.login);
    }
  }


  ImageProvider buildImageProvider(String image,{String defImage = ImageX.icon_avatar}){
    if(isEmpty(image) || (!image.isUrl() && !image.contains("assets"))){ return AssetImage(defImage); }
    try{
      return image.isUrl() ? NetworkImage(image,) : AssetImage(image) as ImageProvider;
    }catch(e){
      return AssetImage(defImage);
    }
  }

  Image buildImage(String image,double width,double height,{String defImage = ImageX.icon_avatar,BoxFit? fit}){
    if(isEmpty(image) || (!image.isUrl() && !image.contains("assets"))){
      return Image.asset(defImage,width: width,height: height,fit: fit,);
    }
    try{
      return image.isUrl() ? Image.network(image,width: width,height: height,fit: fit,
      errorBuilder: (context,error,stack){
        loggerArray(["异常了",image,error,stack]);
          if(unEmpty(defImage)){
            return Image.asset(defImage,width: width,height: height,fit: fit,);
          }else {
            return SizedBox(width: width,height: height,);
          }
        },
      ) : Image.asset(image,width: width,height: height,fit: fit,);
    }catch(e){
      loggerArray(["异常了",image,e]);
      return Image.asset(defImage,width: width,height: height,fit: fit,);
    }
  }



  Widget buildBallDraw(int lid,List<String> nums, String e) {
    switch(lid){
      case 9:  // 快三  3位 骰子
      case 18:
      case 19:
      case 30:
        return Image.asset(DataUtils.getDiceImg(e),width: 24.r,fit: BoxFit.fill,);
      case 5:
        return Image.asset(DataUtils.getFruitImg(e),width: 24.r,fit: BoxFit.fill,);
      default:
        return buildDrawNum(e, buildDrawBg(lid,nums,e));
    }
  }


  Widget buildDrawNum(String num,Color bg) {
    return Container(
      width: 24.r,height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }

  Color buildDrawBg(int lid,List<String> nums,String e) {
    switch(lid){
      case 10: // PC系列 4位
      case 11:
      case 12:
      case 13:
      case 31:
      case 33:
      case 34:
      case 32:
      case 42:
        if(nums.indexOf(e)+1 == nums.length){
          return DataUtils.getBallBgColor(int.parse(e));
        }else {
          return ColorX.color_fe2427;
        }
      case 7:  // 六合彩  7位
      case 20:
        return DataUtils.getBallBgColor(int.parse(e));
      case 6: // pK十系列 10位
      case 22:
        return DataUtils.getBallBgColor(int.parse(e));
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
        if(int.parse(e) <= 40){
          return ColorX.color_529aff;
        }else {
          return ColorX.color_fe2427;
        }
      default:
        return ColorX.color_fe2427;
    }
  }

  Widget buildVarCode(String code,GestureTapCallback onTap){
    if(isEmpty(code)){ return Container();}
    // 移除Base64头信息
    String base64String = code.split(',').last;
    return InkWell(
      onTap: onTap,
      child: Image.memory(base64Decode(base64String),width: 73.w,height: 30.h,),
    );
  }



  Widget buildQRCode(String code,double width,double height,){
    if(isEmpty(code)){ return Container();}
    // 移除Base64头信息
    String base64String = code.split(',').last;
    return Image.memory(base64Decode(base64String),fit: BoxFit.fill,width: width,height: height,);
  }


  void loginJump(Map<String,dynamic> params,){
    HttpService.loginBusinessAgent(params).then((value) {
      if(value is Map){
        launchUrl(Uri.parse(value["gameUrl"]),mode: LaunchMode.externalApplication);
        // Get.toNamed(Routes.html,arguments: HtmlEvent(data: value["gameUrl"],isHtmlData:false,pageTitle: ""));
      } else {
        // loggerArray(["打印网页数据提取",value.toString().split("\n")]);
        /*var params = <String,String>{};
        var url = "";
        value.toString().replaceAll("type=\"hidden\"", "").replaceAll("type=\'hidden\'", "")
            .split("\n").forEach((element) {
              if(element.contains("action=\"")){
                url = element.replaceAll("<form method=\"post\" name=\"form1\" action=\"", "").replaceAll("\">", "");
              } else {
                var list = element.replaceAll(" ", "").split("value=");
                if(unEmpty(list) && list.length == 2){
                  params[list[0].replaceAll("<inputname=\"", "").replaceAll("\"]", "").replaceAll("\"", "")]
                  = list[1].replaceAll("/>]", "").replaceAll("\"", "").replaceAll("/>", "").replaceAll(">", "");
                }
              }
        });
        loggerArray(["截取出来的数据处理",url,params]);*/
        ///url_launcher可以打开文件 ，可以把value数据写到本地文件里然后用他打开
        Get.toNamed(Routes.game_html,arguments: HtmlEvent(data: value,isHtmlData:true,pageTitle: ""));
      }
    });
  }

















}


