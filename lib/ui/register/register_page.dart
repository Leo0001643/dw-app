import 'package:flutter/material.dart';
import 'package:flutter_aliyun_captcha/flutter_aliyun_captcha.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tencent_captcha/tencent_captcha.dart';
import 'package:flutter_tencent_captcha/tencent_captcha_config.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/focus_container.dart';
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
  var _disableScrolling = false.obs;

  @override
  void initState() {
    state.nameFocus.addListener(() {
      ///当真实姓名输入框失去焦点时调用校验
      if (!state.nameFocus.hasFocus) {
        logic.memberRegCheck();
      }
    });
    state.varcode.listen((p0) {
      aliyunCaptchaController.reset();
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
        ),
      ),
      backgroundColor: ColorX.pageBg(),
      body: Obx(() {
        return SingleChildScrollView(
          physics: _disableScrolling.value ? NeverScrollableScrollPhysics():null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Expanded(child: Container()),
                  InkWell(
                    onTap: ()=> Get.toNamed(Routes.select_language),
                    child: Row(
                      children: [
                        WidgetUtils().buildImage(ImageX.languageT(), 18.r, 18.r),
                        SizedBox(width: 2.w,),
                        Text(
                          Intr().zhongwenjianti,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorX.textBlack(),),
                        ),
                        Image.asset(ImageX.icon_right_black,color: ColorX.iconBlack(),),
                        SizedBox(width: 10.w,),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Center(
                child: FocusContainer(
                  width: 335.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                      WidgetUtils().buildTextField(
                        290.w, 46.h, 14.sp, ColorX.textBlack(), Intr().yhm,
                        hintColor: ColorX.text949(),
                        backgroundColor: Colors.transparent,
                        onChanged: (v) => state.accountValue = v,
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: ColorX.line10949(), width: 1.w),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(left: 35.w),
                child: Text(Intr().sidao12shuzihuozimu, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: FocusContainer(
                  width: 335.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                      Expanded(
                        child: Obx(() {
                          return WidgetUtils().buildTextField(
                              260.w, 46.h, 14.sp, ColorX.textBlack(), Intr().denglumima,
                              backgroundColor: Colors.transparent,
                              onChanged: (v) => state.pwdValue = v,
                              defText: state.pwdValue,
                              hintColor: ColorX.text949(),
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
                child: Text(Intr().wszhzm, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
              ),
              SizedBox(height: 20.h,),
              Center(
                child: FocusContainer(
                  width: 335.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                      Expanded(
                        child: Obx(() {
                          return WidgetUtils().buildTextField(
                              260.w, 46.h, 14.sp, ColorX.textBlack(), Intr().querenmima,
                              backgroundColor: Colors.transparent,
                              onChanged: (v) => state.confirmPwdValue = v,
                              defText: state.confirmPwdValue,
                              hintColor: ColorX.text949(),
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
                child: Text(Intr().wszhzm, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
              ),
              SizedBox( height: 20.h,),
              Center(
                child: FocusContainer(
                  width: 335.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                      WidgetUtils().buildTextField(
                          290.w, 46.h, 14.sp, ColorX.textBlack(), Intr().zsxm,
                          hintColor: ColorX.text949(),
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
                child: Text(Intr().ytxyhkhmyz, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
              ),
              SizedBox(height: 20.h,),
              Obx(() {
                return Visibility(
                  visible: state.mobileVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FocusContainer(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              SizedBox(width: 10.w,),
                              InkWell(
                                onTap: () => DialogUtils().showSelectAreaBtmDialog(context, state.phoneData ?? {}).then((value) {
                                  if(unEmpty(value)){ state.areaNo.value = value!; }
                                }),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: state.mobileMust.value,
                                      child: Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                                    ),
                                    Obx(() {
                                      return Text(state.areaNo.value,style: TextStyle(fontSize: 14.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w700),);
                                    }),
                                    WidgetUtils().buildImage(ImageX.iconDownArrow(), 18.r, 18.r),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: WidgetUtils().buildTextField(0, 46.h, 14.sp, ColorX.textBlack(), Intr().shoujihaoma,hintColor: ColorX.text949(),
                                    backgroundColor: Colors.transparent,inputType: TextInputType.phone,onChanged: (v)=> state.mobile=v),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: Text(Intr().shuruzhenshiyouxiao, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                );
              }),//
              Obx(() {
                return Visibility(
                  visible: state.agentVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FocusContainer(
                          width: 335.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Visibility(
                                visible: state.agentMust.value,
                                child: Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                              ),
                              Expanded(
                                child: WidgetUtils().buildTextField(
                                  0, 46.h, 14.sp, ColorX.textBlack(), Intr().jieshaoren,
                                  hintColor: ColorX.text949(),
                                  backgroundColor: Colors.transparent,
                                  onChanged: (v) => state.tgcode = v,
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: Text(Intr().shurujieshaoren, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: state.qqVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FocusContainer(
                          width: 335.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Visibility(
                                visible: state.qqMust.value,
                                child: Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                              ),
                              Expanded(
                                child: WidgetUtils().buildTextField(
                                  0, 46.h, 14.sp, ColorX.textBlack(), Intr().qq_number,
                                  hintColor: ColorX.text949(),
                                  backgroundColor: Colors.transparent,
                                  inputType: TextInputType.number,
                                  onChanged: (v) => state.qq = v,
                                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: Text(Intr().qq_number_tip, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: state.emailVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FocusContainer(
                          width: 335.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Visibility(
                                visible: state.emailMust.value,
                                child: Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                              ),
                              Expanded(
                                child: WidgetUtils().buildTextField(
                                    0, 46.h, 14.sp, ColorX.textBlack(), Intr().e_mail,
                                    hintColor: ColorX.text949(),
                                    backgroundColor: Colors.transparent,
                                    inputType: TextInputType.emailAddress,
                                    onChanged: (v) => state.email = v,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: Text(Intr().e_mail_tip, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                );
              }),
              Obx(() {
                return Visibility(
                  visible: state.weixinVisible.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: FocusContainer(
                          width: 335.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Visibility(
                                visible: state.weixinMust.value,
                                child: Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                              ),
                              Expanded(
                                child: WidgetUtils().buildTextField(
                                    0, 46.h, 14.sp, ColorX.textBlack(), Intr().wx_number,
                                    hintColor: ColorX.text949(),
                                    backgroundColor: Colors.transparent,
                                    inputType: TextInputType.text,
                                    onChanged: (v) => state.wechat = v,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 35.w),
                        child: Text(Intr().wx_number_tip, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                );
              }),
              _getImageCode(),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(Intr().zhucetishiyu,
                  style: TextStyle(fontSize: 13.sp, color: ColorX.text0917(),fontWeight: FontWeight.w700),),
              ),
              SizedBox(height: 20.h,),
              Obx(() {
                return Visibility(
                  visible: state.varcode.value.type != 2,
                  child: Center(
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
                );
              }),
              SizedBox(height: 10.h,),
            ],
          ),
        );
      }),
    );
  }


  AliyunCaptchaController aliyunCaptchaController = AliyunCaptchaController();
  Widget _getAliCode() {
    if (state.varcode.value.status == 1 && state.varcode.value.type == 2) {
      return GestureDetector(
        onTapDown: (details){
          _disableScrolling.value = true;
        },
        onTapUp: (details){
          _disableScrolling.value = false;
        },
        onTapCancel: (){
          _disableScrolling.value = false;
        },
        child: Container(
          width: double.infinity,
          height: 48,
          margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
          child: AliyunCaptchaButton(
            controller: aliyunCaptchaController,
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
              _disableScrolling.value = false;
              logic.clickRegister(data: data);
            },
            onFailure: (String failCode) {
              _disableScrolling.value = false;
              aliyunCaptchaController.reset();
            },
            onError: (String errorCode) {
              _disableScrolling.value = false;
              aliyunCaptchaController.reset();
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getImageCode() {
    return Obx(() {
      if (state.varcode.value.status == 1 && state.varcode.value.type == 1) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FocusContainer(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                          Expanded(
                            child: WidgetUtils().buildTextField(
                              0, 46.h, 14.sp, ColorX.textBlack(), Intr().yzm,
                              hintColor: ColorX.text949(),
                              backgroundColor: Colors.transparent,
                              inputType: TextInputType.text,
                              onChanged: (v) => state.vcode = v,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Obx(() {
                    return WidgetUtils().buildVarCode(state.varcode.value.varCode.em(), ()=> logic.getVarcode());
                  }),
                ],
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(Intr().yzm, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.w700),),
              ),
            ],
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
      onLoaded: (dynamic data) {},
      onSuccess: (dynamic data) {
        logic.clickRegister(data: data);
        loggerArray(['onSuccess', data]);
      },
      onFail: (dynamic data) {
        loggerArray(['onFail', data]);
      },
    );
  }


}
