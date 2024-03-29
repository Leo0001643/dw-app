import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';
import 'package:leisure_games/ui/main/main_logic.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetUtils {
  WidgetUtils._internal();

  static WidgetUtils? instance;

  static getInstance() {
    instance ??= WidgetUtils._internal();
    return instance;
  }

  factory WidgetUtils() => getInstance();

  Widget buildNoElevatedButton(String text, double width, double height,
      {Color? bg,
        Color textColor = Colors.white,
        double textSize = 14,
        bool showBorder = false,
        VoidCallback? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: showBorder == true
                ? Border.all(color: Colors.grey, width: 1)
                : Border.all(color: Colors.transparent)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: textSize.sp,
              color: textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildElevatedButton(String text, double width, double height,
      {Color? bg,
        Color textColor = Colors.white,
        double textSize = 14,
        VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: bg,
        minimumSize: Size(width, height),
        maximumSize: Size(width, height),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: textSize.sp,
            color: textColor,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget buildOutlineButton(String text, double width, double height,
      Color lineColor,
      {Color? bg,
        Color textColor = Colors.white,
        double textSize = 14,
        VoidCallback? onPressed}) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        side: BorderSide(color: lineColor, width: 1.r),
        backgroundColor: bg,
        minimumSize: Size(width, height),
        maximumSize: Size(width, height),
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: textSize.sp,
            color: textColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildHomeAppBar(context,RxInt unRead,RxString routeName, {bool msg = false, bool drawer = false,}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.r),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Image.asset(
            ImageX.icon_logo,
          ),
          Expanded(child: Container()),
          Visibility(
            visible: msg,
            child: InkWell(
              onTap: () => DialogUtils().showAccessRouteDialog2(context),
              child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Row(
                    children: [
                      Obx(() {
                        return Text(routeName.value, style: TextStyle(color: ColorX.iconBlack()));
                      }),
                      WidgetUtils().buildImage(ImageX.iconDownArrow(), 18.r, 18.r),
                    ],
                  )),
            ),
          ),
          Visibility(
            visible: msg,
            child: InkWell(
              onTap: () => goMessageCenter(),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Image.asset(
                      ImageX.icon_user_msg,
                      color: ColorX.icon586(),
                    ),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: unRead.value > 0,
                      child: Positioned(
                        top: 7.r, right: 2.r,
                        child: GFBadge(
                          size: 20.r,
                          color: Colors.transparent,
                          textColor: ColorX.color_fc243b,
                          text: "${unRead.value}",
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Visibility(
            visible: drawer,
            child: InkWell(
              onTap: () => Get.find<MainLogic>().openDrawer(),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Image.asset(
                  ImageX.icon_more,
                  color: ColorX.icon586(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(String? title,
      {bool msg = false,
        bool back = true,
        Color? bgColor,
        bool drawer = false,
        String? backIcon,
        GlobalKey<ScaffoldState>? scaffoldKey,
      }) {
    if(isEmpty(backIcon)){
      backIcon = ImageX.iconPageBackT();
    }
    return AppBar(
      title: Text(
        title.em(),
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
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(backIcon.em(), 24.r, 24.r,fit: BoxFit.scaleDown),
        ),
      ),
      actions: [
        Row(
          children: [
            Visibility(
              visible: msg,
              child: InkWell(
                onTap: () => goMessageCenter(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(
                    ImageX.icon_user_msg,
                    color: ColorX.icon586(),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: drawer,
              child: InkWell(
                onTap: () => scaffoldKey?.currentState?.openEndDrawer(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(
                    ImageX.icon_more,
                    color: ColorX.icon586(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ],
    );
  }

  AppBar buildAppBarBtn(String? title, Widget right,{bool back = true,}) {
    return AppBar(
      title: Text(
        title.em(),
        style: TextStyle(
            fontSize: 16.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      backgroundColor: ColorX.appBarBg(),
      elevation: 0,
      toolbarHeight: 44.h,
      leading: Visibility(
        visible: back,
        child: InkWell(
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(ImageX.iconPageBackT(), 24.r, 24.r),
        ),
      ),
      actions: [right],
    );
  }

  AppBar buildRxAppBar(RxString title,
      {bool msg = false,
        bool back = true,
        Color? bgColor,
        bool drawer = true,
        GlobalKey<ScaffoldState>? scaffoldKey,
      }) {
    return AppBar(
      title: Obx(() {
        return Text(
          title.value,
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
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(ImageX.iconPageBackT(), 24.r, 24.r),
        ),
      ),
      actions: [
        Visibility(
          visible: msg,
          child: InkWell(
            onTap: () => goMessageCenter(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(
                ImageX.icon_user_msg,
                color: ColorX.icon586(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: drawer,
          child: InkWell(
            onTap: () => scaffoldKey?.currentState?.openEndDrawer(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(
                ImageX.icon_more,
                color: ColorX.icon586(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
  }

  AppBar buildRoomBar(RxString title, {
    bool msg = false,
    bool back = true,
    Color? bgColor,
    bool drawer = true,
    GlobalKey<ScaffoldState>? scaffoldKey,
    GestureTapCallback? onTap,
  }) {
    return AppBar(
      title: InkWell(
        onTap: onTap,
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Obx(() {
              return Text(
                title.value,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorX.text0917(),
                    fontWeight: FontWeight.w600),
              );
            }),
            SizedBox(
              width: 5.w,
            ),
            Image.asset(
              ImageX.icon_down_black,
              color: ColorX.icon586(),
            ),
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
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(ImageX.iconPageBackT(), 24.r, 24.r),
        ),
      ),
      actions: [
        Visibility(
          visible: msg,
          child: InkWell(
            onTap: () => goMessageCenter(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(
                ImageX.icon_user_msg,
                color: ColorX.icon586(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: drawer,
          child: InkWell(
            onTap: () => scaffoldKey?.currentState?.openEndDrawer(),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Image.asset(
                ImageX.icon_more,
                color: ColorX.icon586(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildGameBar(RxString title, Widget subTitle,
      {bool msg = false,
        bool collect = false,
        bool back = true,
        bool drawer = true,
        Color? bgColor,
        GestureTapCallback? onTap,
        GestureTapCallback? onCollect,
        GlobalKey<ScaffoldState>? scaffoldKey,
      }) {
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
                  return Text(
                    title.value,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorX.text0917(),
                        fontWeight: FontWeight.w600),
                  );
                }),
                SizedBox(
                  width: 5.w,
                ),
                Image.asset(ImageX.icon_down_black,color: ColorX.iconBlack(),),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
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
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(ImageX.iconPageBackT(), 24.r, 24.r),
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
                  child: const Icon(
                    Icons.collections_outlined,
                    color: ColorX.color_091722,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: msg,
              child: InkWell(
                onTap: () => goMessageCenter(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(
                    ImageX.icon_user_msg,
                    color: ColorX.icon586(),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: drawer,
              child: InkWell(
                onTap: ()=> scaffoldKey?.currentState?.openEndDrawer(),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Image.asset(
                    ImageX.icon_more,
                    color: ColorX.icon586(),
                  ),
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }

  AppBar buildHtmlBar(RxString title, {bool back = true, Color? bgColor}) {
    return AppBar(
      title: Obx(() {
        return Text(
          title.value,
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
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(ImageX.iconPageBackT(), 24.r, 24.r),
        ),
      ),
    );
  }

  AppBar buildLossHtmlBar(RxString title,RxString subTitle, {bool back = true, Color? bgColor}) {
    return AppBar(
      title: Obx(() {
        return Column(
          children: [
            SizedBox(height: 5.h,),
            Text(
              title.value,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: ColorX.text0917(),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.h,),
            Text(
              subTitle.value,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorX.color_58698d,
                  fontWeight: FontWeight.w600),
            ),
          ],
        );
      }),
      centerTitle: true,
      backgroundColor: bgColor ?? ColorX.appBarBg2(),
      elevation: 0,
      toolbarHeight: 55.h,
      leading: Visibility(
        visible: back,
        child: InkWell(
          onTap: () => Get.back(),
          child: WidgetUtils().buildImage(ImageX.iconDownArrow(), 24.r, 24.r,fit: BoxFit.scaleDown),
        ),
      ),
    );
  }

  ///构建文本框
  Widget buildTextField(double? width, double? height, double textSize,
      Color textColor, String? hint,
      {Color backgroundColor = Colors.white,
        Color hintColor = ColorX.color_5b6d7b,
        String? defText,
        ValueChanged<String>? onChanged,
        TextInputType? inputType,
        bool obscureText = false,
        bool autofocus = false,
        bool enabled = true,
        bool suffixIcon = false,
        int maxLines = 1,
        EdgeInsetsGeometry? padding,
        List<TextInputFormatter>? inputFormatters,
        FocusNode? focusNode}) {

    padding ??= EdgeInsets.symmetric(horizontal: 10.w);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      padding: padding,
      width: width,
      height: height,
      child: suffixIcon
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              defText.em() == "" ? hint.em() : defText.em(),
              style: TextStyle(
                  fontSize: textSize,
                  color: defText.em() == "" ? hintColor : textColor,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          // Icon(Icons.keyboard_arrow_down,size: 18.r,color: Colors.black54),
        ],
      )
          : TextField(
        autofocus: autofocus,
        enabled: enabled,
        // cursorHeight: textSize,
        cursorColor: ColorX.textBlack(),
        maxLines: maxLines,
        focusNode: focusNode,
        controller: TextEditingController.fromValue(TextEditingValue(
            text: defText.em(),
            selection: TextSelection.fromPosition(TextPosition(
                affinity: TextAffinity.downstream,
                offset: defText
                    .em()
                    .length)))),
        onChanged: onChanged,
        keyboardType: inputType,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        style: TextStyle(fontSize: textSize, color: textColor),
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          enabled: enabled,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(fontSize: textSize, color: hintColor),
          labelStyle: TextStyle(fontSize: textSize, color: hintColor),
          errorStyle: TextStyle(fontSize: textSize, color: hintColor),
        ),
      ),
    );
  }

  void clickCopy(String value) {
    if (unEmpty(value)) {
      Clipboard.setData(ClipboardData(text: value));
      showToast("copy_suc".tr);
    }
  }

  void goMessageCenter() {
    if (AppData.isLogin()) {
      Get.toNamed(Routes.message_center);
    } else {
      goLogin();
    }
  }


  void goLogin() {
    if (unEmpty(AppData.getGestureValue())) {
      Get.toNamed(Routes.simple_login);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  ImageProvider buildImageProvider(String image, {String defImage = ImageX.defultImg}) {
    // loggerArray(["加载的图片地址",image]);
    if (isEmpty(image) || (!image.isUrl() && !image.contains("assets"))) {
      return AssetImage(defImage);
    }
    try {
      return image.isUrl()
          ? NetworkImage(image,)
          : AssetImage(image) as ImageProvider;
    } catch (e) {
      return AssetImage(defImage);
    }
  }

  Widget buildImage(String image, double width, double height,
      {String defImage = ImageX.defultImg, BoxFit? fit,bool placeholder=false}) {
    if (isEmpty(image) || (!image.isUrl() && !image.contains("assets"))) {
        return Image.asset(defImage, width: width, height: height, fit: fit,);
    }
    try {
      return image.isUrl()
          ? CachedNetworkImage(imageUrl: image,fit: fit,width: width,height: height,
          errorWidget: (context,url,error){
            return Image.asset(defImage,width: width, height: height, fit: fit,);
          },
        placeholder: (context,url){
          return placeholder ? Image.asset(defImage,width: width, height: height, fit: fit,) : SizedBox(width: width,height: height,);
        },
      )
          : (image.endsWith('svg') ? SvgPicture.asset(image, width: width, height: height, fit: fit ?? BoxFit.contain,)
          :Image.asset(image,width: width, height: height, fit: fit,));
    } catch (e) {
      loggerArray(["异常了", image, e]);
      return Image.asset(defImage, width: width, height: height, fit: fit,);
    }
  }

  Widget buildBallDraw(int lid, List<String> nums, String e) {
    switch (lid) {
      case 9: // 快三  3 位 骰子
      case 18:
      case 19:
      case 30:
        return Image.asset(
          DataUtils.getDiceImg(e),
          width: 24.r,
          fit: BoxFit.fill,
        );
      case 5:
        return Image.asset(
          DataUtils.getFruitImg(e),
          width: 24.r,
          fit: BoxFit.fill,
        );
      default:
        return buildDrawNum(e, buildDrawBg(lid, nums, e));
    }
  }

  Widget buildDrawNum(String num, Color bg) {
    return Container(
      width: 24.r,
      height: 24.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Text(
        num,
        style: TextStyle(
            fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Color buildDrawBg(int lid, List<String> nums, String e) {
    switch (lid) {
      case 10: // PC 系列 4 位
      case 11:
      case 12:
      case 13:
      case 31:
      case 33:
      case 34:
      case 32:
      case 42:
        if (nums.indexOf(e) + 1 == nums.length) {
          return DataUtils.getBallBgColor(int.parse(e));
        } else {
          return ColorX.color_fe2427;
        }
      case 7: // 六合彩  7 位
      case 20:
        return DataUtils.getBallBgColor(int.parse(e));
      case 6: // pK 十系列 10 位
      case 22:
        return DataUtils.getBallBgColor(int.parse(e));
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
        if (int.parse(e) <= 40) {
          return ColorX.color_529aff;
        } else {
          return ColorX.color_fe2427;
        }
      default:
        return ColorX.color_fe2427;
    }
  }

  Widget buildVarCode(String code, GestureTapCallback onTap) {
    if (isEmpty(code)) {
      return Container();
    }
    // 移除 Base64 头信息
    String base64String = code
        .split(',')
        .last;
    return InkWell(
      onTap: onTap,
      child: Image.memory(
        base64Decode(base64String),
        width: 73.w,
        height: 30.h,
      ),
    );
  }

  Widget buildQRCode(String code,
      double width,
      double height,) {
    if (isEmpty(code)) {
      return Container();
    }
    // 移除 Base64 头信息
    String base64String = code
        .split(',')
        .last;
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
      width: width,
      height: height,
    );
  }

  ///打开游戏页面
  void loginJump(String title, Map<String, dynamic> params,) {
    HttpService.loginBusinessAgent(params).then((value) {
      DialogUtils().showLoadGameDialog(Get.context!, title,).then((inapp) {
        if (unEmpty(inapp)) {
          if (value is Map) {
            if (inapp!) {
              Get.toNamed(Routes.game_html,
                  arguments: HtmlEvent(
                      data: value["gameUrl"],
                      isHtmlData: !value["gameUrl"].toString().isUrl(),
                      pageTitle: title));
            } else {
              launchUrl(Uri.parse(value["gameUrl"]),
                  mode: LaunchMode.externalApplication);
            }
          }
        }
      });
    });
  }



  Widget buildDixqi1(String term){
    if(AppData.localeIndex() == 0){
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 3.w,
        children: [
          Text(Intr().di,style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),),),
          Text(term,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),),),
          Text(Intr().qi,style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),),),
        ],
      );
    }else {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 3.w,
        children: [
          Text(Intr().no,style: TextStyle(fontSize: 13.sp,color: ColorX.text586(),),),
          Text(term,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),),),
        ],
      );
    }
  }



  Widget buildDixqi2(String term){
    if(AppData.localeIndex() == 0){
      return Text.rich(TextSpan(children: [
        TextSpan(
          text:  Intr().di,
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.text333(),
          ),
        ),
        TextSpan(
          text: term,
          style: TextStyle(
              fontSize: 12.sp,
              color:  ColorX.color_fc243b,
              fontWeight: FontWeight.w500
          ),
        ),
        TextSpan(
          text: Intr().qi,
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.text333(),
          ),
        )
      ]));
    }else {
      return Text.rich(TextSpan(children: [
        TextSpan(
          text:  Intr().no,
          style: TextStyle(
            fontSize: 12.sp,
            color: ColorX.color_333333,
          ),
        ),
        TextSpan(
          text: term,
          style: TextStyle(
              fontSize: 12.sp,
              color:  ColorX.color_fc243b,
              fontWeight: FontWeight.w500
          ),
        ),
      ]));
    }
  }


  Widget buildDixqi3(String term,int roomType){
    var textColor = roomType == 1 ? ColorX.text333() : ColorX.color_ffe0ac;
    var termData = term.length > 8 ? term.substring(term.length-8,term.length) : term;
    if(AppData.localeIndex() == 0){
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 3.w,
        children: [
          Text(Intr().di,style: TextStyle(fontSize: 13.sp,color: textColor,),),
          Text(termData,style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b,),),
          Text(Intr().qi,style: TextStyle(fontSize: 13.sp,color: textColor,),),
        ],
      );
    }else {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 3.w,
        children: [
          Text(Intr().no,style: TextStyle(fontSize: 13.sp,color: textColor,),),
          Text(termData,style: TextStyle(fontSize: 13.sp,color: ColorX.color_fc243b,),),
        ],
      );
    }
  }


}
