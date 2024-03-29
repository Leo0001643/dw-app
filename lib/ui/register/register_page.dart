import 'package:flutter/material.dart';
import 'package:flutter_aliyun_captcha/flutter_aliyun_captcha.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tencent_captcha/tencent_captcha.dart';
import 'package:flutter_tencent_captcha/tencent_captcha_config.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

import 'register_logic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final logic = Get.find<RegisterLogic>();
  final state = Get.find<RegisterLogic>().state;

  @override
  void initState() {
    state.nameFocus.addListener(() {
      ///当真实姓名输入框失去焦点时调用校验
      if (!state.nameFocus.hasFocus) {
        logic.memberRegCheck();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<RegisterLogic>();
    state.nameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBarBtn("hyzc".tr,
        InkWell(
          onTap: (){
            //腾讯验证滑动测试
            Get.until((ModalRoute.withName(Routes.main)));
            Get.toNamed(Routes.login);
          },
          child: Row(
            children: [
              Text(
                Intr().login,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorX.textBlack(),
                    decoration: TextDecoration.underline),
              ),
              Image.asset(ImageX.icon_right_black,color: ColorX.iconBlack(),),
              SizedBox(width: 10.w,),
            ],
          ),
        )
      ),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(
                  color: ColorX.cardBg3(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                    WidgetUtils().buildTextField(
                        290.w, 46.h, 14.sp, ColorX.text949(), Intr().qsryhm,
                        hintColor: ColorX.text586(),
                        backgroundColor: Colors.transparent,
                        onChanged: (v) => state.accountValue = v),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().sidao12shuzihuozimu, style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(
                  color: ColorX.cardBg3(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                    Expanded(
                      child: Obx(() {
                        return WidgetUtils().buildTextField(
                            260.w, 46.h, 14.sp, ColorX.text949(), Intr().mm,
                            backgroundColor: Colors.transparent,
                            onChanged: (v) => state.pwdValue = v,
                            defText: state.pwdValue,
                            hintColor: ColorX.text586(),
                            obscureText: !state.pwdVisible.value,
                            inputType: TextInputType.visiblePassword);
                      }),
                    ),
                    InkWell(
                      onTap: () =>
                          state.pwdVisible.value = !state.pwdVisible.value,
                      child: Obx(() {
                        return state.pwdVisible.value
                            ? Image.asset(
                                ImageX.icon_show,
                                color: ColorX.iconBlack(),
                                width: 30.w,
                              )
                            : Image.asset(
                                ImageX.icon_hide,
                                color: ColorX.iconBlack(),
                                width: 30.w,
                              );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().wszhzm, style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(
                  color: ColorX.cardBg3(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                    Expanded(
                      child: Obx(() {
                        return WidgetUtils().buildTextField(
                            260.w, 46.h, 14.sp, ColorX.text949(), Intr().querenmima,
                            backgroundColor: Colors.transparent,
                            onChanged: (v) => state.confirmPwdValue = v,
                            defText: state.confirmPwdValue,
                            hintColor: ColorX.text586(),
                            obscureText: !state.confirmPwdVisible.value,
                            inputType: TextInputType.visiblePassword);
                      }),
                    ),
                    InkWell(
                      onTap: () => state.confirmPwdVisible.value =
                          !state.confirmPwdVisible.value,
                      child: Obx(() {
                        return state.confirmPwdVisible.value
                            ? Image.asset(
                                ImageX.icon_show,
                                color: ColorX.iconBlack(),
                                width: 30.w,
                              )
                            : Image.asset(
                                ImageX.icon_hide,
                                color: ColorX.iconBlack(),
                                width: 30.w,
                              );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().wszhzm, style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),),
            ),
            SizedBox( height: 20.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(
                  color: ColorX.cardBg3(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                    WidgetUtils().buildTextField(
                        290.w, 46.h, 14.sp, ColorX.text949(), Intr().zsxm,
                        hintColor: ColorX.text586(),
                        backgroundColor: Colors.transparent,
                        onChanged: (v) => state.realname = v,
                        focusNode: state.nameFocus),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().ytxyhkhmyz, style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text("+86",style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack()),),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorX.cardBg3(),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                          WidgetUtils().buildTextField(270.w, 46.h, 14.sp, ColorX.textBlack(), Intr().shoujihaoma,hintColor: ColorX.text586(),
                              backgroundColor: Colors.transparent,inputType: TextInputType.phone,onChanged: (v)=> state.mobile=v),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),//
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().shuruzhenshiyouxiao, style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Container(
                width: 335.w,
                decoration: BoxDecoration(
                  color: ColorX.cardBg3(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: WidgetUtils().buildTextField(
                    335.w, 46.h, 14.sp, ColorX.text949(), Intr().jieshaoren,
                    hintColor: ColorX.text586(),
                    backgroundColor: Colors.transparent,
                    onChanged: (v) => state.tgcode = v,
                    padding: EdgeInsets.symmetric(horizontal: 5.w)),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Text(Intr().shurujieshaoren, style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),),
            ),
            SizedBox(height: 20.h,),
            _getImageCode(),
            SizedBox(height: 10.h,),
            Center(
              child: Text.rich(TextSpan(children: [
                WidgetSpan(
                  // child: InkWell(
                  //   onTap: ()=> state.agreeCheck.value = !state.agreeCheck.value,
                  child: Obx(() {
                    return WidgetUtils().buildImage(state.agreeCheck.value ? ImageX.icon_select : ImageX.iconUnselect(), 24.r, 24.r,fit: BoxFit.scaleDown);
                  }),
                  // ),
                ),
                WidgetSpan(
                  child: SizedBox(
                    width: 5.w,
                  ),
                ),
                TextSpan(
                  text: Intr().wywdbty,
                  style: TextStyle(fontSize: 13.sp, color: ColorX.text0917()),
                ),
                WidgetSpan(
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.html,
                          arguments: HtmlEvent(
                              data: Constants.contact,
                              isHtmlData: false,
                              pageTitle: Intr().kaihuxieyi));
                    },
                    child: Text(
                      Intr().kaihuxieyi,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorX.text0917(),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ])),
            ),
            SizedBox(height: 10.h,),
            Center(
              child: WidgetUtils().buildElevatedButton(Intr().register, 335.w, 48.h,
                  bg: ColorX.color_fd273e,
                  textColor: Colors.white,
                  textSize: 16.sp, onPressed: () {
                    if (state.varcode.value.status == 1 &&
                        state.varcode.value.type == 3) {
                      _handleClickVerify();
                    } else {
                      logic.clickRegister();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAliCode() {
    if (state.varcode.value.status == 1 && state.varcode.value.type == 2) {
      return Container(
        width: double.infinity,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
        child: AliyunCaptchaButton(
          type: AliyunCaptchaType.slide,
          // 重要：请设置正确的类型
          option: AliyunCaptchaOption(
            appKey: 'FFFF0N00000000009A34',
            scene: 'cn-hangzhou',
            language: 'cn',
            // 更多参数请参见：https://help.aliyun.com/document_detail/193141.html
          ),
          customStyle: '''
      .nc_scale {
        background: #eeeeee !important;
        /* 默认背景色 */
      }

      .nc_scale div.nc_bg {
        background: #68bc25 !important;
        /* 滑过时的背景色 */
      }

      .nc_scale .scale_text2 {
        color: #fff !important;
        /* 滑过时的字体颜色 */
      }

      .errloading {
        border: #ff0000 1px solid !important;
        color: #ef9f06 !important;
      }
    ''',
          onSuccess: (dynamic data) {
            // {"sig": "...", "token": "..."}
            logic.clickRegister(data: data);
          },
          onFailure: (String failCode) {},
          onError: (String errorCode) {},
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getImageCode() {
    return Obx(() {
      if (state.varcode.value.status == 1 && state.varcode.value.type == 1) {
        return Center(
          child: Container(
            width: 335.w,
            decoration: BoxDecoration(
              color: ColorX.cardBg3(),
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                WidgetUtils().buildTextField(
                    225.w, 46.h, 14.sp, ColorX.text949(), Intr().qsrzcyzm,
                    hintColor: ColorX.text586(),
                    backgroundColor: Colors.transparent,
                    inputType: TextInputType.text,
                    onChanged: (v) => state.vcode = v),
                Obx(() {
                  return WidgetUtils()
                      .buildVarCode(state.varcode.value.varCode.em(), () {
                    logic.getVarcode();
                  });
                }),
              ],
            ),
          ),
        );
      } else if (state.varcode.value.status == 1 &&
          state.varcode.value.type == 2) {
        return _getAliCode();
      }else {
        return Container();
      }
    });
  }

  void _handleClickVerify() async {
    TencentCaptchaConfig config = TencentCaptchaConfig(
      enableDarkMode: true,
    );
    await TencentCaptcha.verify(
      config: config,
      onLoaded: (dynamic data) {
        print(">tx>>>onLoaded" + data.toString());
      },
      onSuccess: (dynamic data) {
        print(">tx>>>onSuccess" + data.toString());
        logic.clickRegister(data: data);
        _addLog('onSuccess', data);
      },
      onFail: (dynamic data) {
        _addLog('onFail', data);
      },
    );
  }

  void _addLog(String method, dynamic data) {
    print(data.toString());
  }
}
