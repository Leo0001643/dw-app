import 'package:flutter/material.dart';
import 'package:flutter_aliyun_captcha/flutter_aliyun_captcha.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tencent_captcha/tencent_captcha.dart';
import 'package:flutter_tencent_captcha/tencent_captcha_config.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/focus_container.dart';

import 'login_logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  void initState() {
    state.varcode.listen((p0) {
      aliyunCaptchaController.reset();
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBarBtn(Intr().login,
        InkWell(
          onTap: () => Get.toNamed(Routes.register),
          child: Row(
            children: [
              Text(
                Intr().register,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorX.textBlack()),
              ),
              Image.asset(
                ImageX.icon_right_black,
                color: ColorX.iconBlack(),
              ),
              SizedBox(width: 10.w,),
            ],
          ),
        ),),
      backgroundColor: ColorX.pageBg(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: FocusContainer(
                width: 335.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Text(Intr().yhm, style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.bold),),
                    WidgetUtils().buildTextField(
                        325.w, 46.h, 14.sp, ColorX.textBlack(), Intr().sidao12shuzihuozimu,
                        hintColor: ColorX.text949(),
                        defText: state.accountValue,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        onChanged: (v) => logic.editChange(true, v),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: FocusContainer(
                width: 335.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                        Text(
                          Intr().mm,
                          style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            return WidgetUtils().buildTextField(
                                0, 46.h, 14.sp, ColorX.textBlack(), Intr().wszhzm,
                                backgroundColor: Colors.transparent,
                                onChanged: (v) => logic.editChange(false, v),
                                defText: state.pwdValue,
                                hintColor: ColorX.text949(),
                                obscureText: !state.pwdVisible.value,
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                              color: ColorX.icon586(),
                              width: 30.w,
                            )
                                : Image.asset(
                              ImageX.icon_hide,
                              color: ColorX.icon586(),
                              width: 30.w,
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            _getCode(),
            SizedBox(height: 10.h,),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: InkWell(
                  onTap: () => showToast(Intr().lianxizaixiankefu),
                  child: Text(
                    Intr().wjmm,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorX.textBlack()),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Obx(() {
              return Visibility(
                visible: state.varcode.value.type != 2,
                child: Center(
                  child: Obx(() {
                    return WidgetUtils().buildElevatedButton(Intr().login, 335.w, 48.h,
                        bg: state.btnEnable.value
                            ? ColorX.color_fd273e
                            : ColorX.color_ff5163,
                        textColor: Colors.white,
                        textSize: 16.sp, onPressed: () {
                          if (state.varcode.value.status == 1 &&
                              state.varcode.value.type == 3) {
                            _handleClickVerify();
                          } else {
                            String?varCodeId= state.varcode.value.varCodeId;
                            logic.clickLogin(varCode:state.vcode,varCodeId:varCodeId);
                          }
                        });
                  }),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 根据类型判断验证码
  Widget _getCode() {
    return Obx(() {
      print(
          "-------->类型  ${(state.varcode.value.status == 1 && state.varcode.value.type == 1)}");
      if (state.varcode.value.status == 1 && state.varcode.value.type == 1 ) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: FocusContainer(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("*", style: TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),),
                          Expanded(
                            child: Text(
                              Intr().yzm,
                              style: TextStyle(fontSize: 13.sp, color: ColorX.text586(),fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      WidgetUtils().buildTextField(
                        double.infinity, 46.h, 14.sp, ColorX.textBlack(), Intr().qsrzcyzm,
                        hintColor: ColorX.text949(),
                        backgroundColor: Colors.transparent,
                        inputType: TextInputType.text,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        onChanged: (v) => state.vcode = v,
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
        );
      } else if (state.varcode.value.status == 1 &&
          state.varcode.value.type == 2) {
        return _getAliCode();
      } else {
        return Container();
      }
    });
  }

  AliyunCaptchaController aliyunCaptchaController = AliyunCaptchaController();
  Widget _getAliCode() {
    if (state.varcode.value.status == 1 && state.varcode.value.type == 2) {
      return Container(
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
            // {"sig": "...", "token": "..."}
            logic.clickLogin(data: data);
          },
          onFailure: (String failCode) {
            aliyunCaptchaController.reset();
          },
          onError: (String errorCode) {
            aliyunCaptchaController.reset();
          },
        ),
      );
    } else {
      return Container();
    }
  }

  //腾讯登录验证
  void _handleClickVerify() async {
    TencentCaptchaConfig config = TencentCaptchaConfig(
      bizState: 'tencent-captcha',
      enableDarkMode: true,
    );
    await TencentCaptcha.verify(
      config: config,
      onLoaded: (dynamic data) {},
      onSuccess: (dynamic data) {
        logic.clickLogin(data: data);
      },
      onFail: (dynamic data) {},
    );
  }
}
