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
import 'package:leisure_games/ui/bean/change_main_page_event.dart';

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
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Intr().login,
          style: TextStyle(
            fontSize: 16.sp,
            color: ColorX.text0917(),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorX.pageBg(),
        elevation: 0,
        leadingWidth: 0,
        leading: Container(),
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Image.asset(
              ImageX.icon_close,
              color: ColorX.icon586(),
            ),
          ),
        ],
      ),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.w),
            child: Text(
              Intr().yhm,
              style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(
                color: ColorX.cardBg3(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: WidgetUtils().buildTextField(
                  325.w, 46.h, 14.sp, ColorX.text949(), Intr().qsryhm,
                  hintColor: ColorX.text586(),
                  defText: state.accountValue,
                  backgroundColor: Colors.transparent,
                  onChanged: (v) => logic.editChange(true, v)),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 35.w),
            child: Text(
              Intr().mm,
              style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(
                color: ColorX.cardBg3(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Obx(() {
                    return WidgetUtils().buildTextField(
                        285.w, 46.h, 14.sp, ColorX.text949(), Intr().qsrmm,
                        backgroundColor: Colors.transparent,
                        onChanged: (v) => logic.editChange(false, v),
                        defText: state.pwdValue,
                        hintColor: ColorX.text586(),
                        obscureText: !state.pwdVisible.value,
                        inputType: TextInputType.visiblePassword);
                  }),
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
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
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
          SizedBox(
            height: 20.h,
          ),
          _getCode(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.toNamed(Routes.register),
                  child: Row(
                    children: [
                      Text(
                        Intr().cjygzxh,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorX.textBlack()),
                      ),
                      Image.asset(
                        ImageX.icon_right_black,
                        color: ColorX.iconBlack(),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    eventBus.fire(ChangeMainPageEvent(3));
                    Get.back();
                  },
                  child: Text(
                    Intr().lxkf,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorX.textBlack()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /**
   * 根据类型判断验证码
   */
  Widget _getCode() {
    return Obx(() {
      if (state.varcode.value.status == 1 && state.varcode.value.type == 1) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Row(
                children: [
                  Text(
                    "* ",
                    style:
                        TextStyle(color: ColorX.color_fe2427, fontSize: 14.sp),
                  ),
                  Text(
                    Intr().yzm,
                    style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
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
                    WidgetUtils().buildTextField(
                        225.w, 46.h, 14.sp, ColorX.text949(), Intr().qsrzcyzm,
                        hintColor: ColorX.text586(),
                        backgroundColor: Colors.transparent,
                        inputType: TextInputType.number,
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
            ),
          ],
        );
      } else if (state.varcode.value.status == 1 &&
          state.varcode.value.type == 2) {
        return _getAliCode();
      } else {
        return Center(
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
                logic.clickLogin();
              }
            });
          }),
        );
      }
    });
  }

  Widget _getAliCode() {
    if (state.varcode.value.status == 1 && state.varcode.value.type == 2) {
      return Container(
        width: double.infinity,
        height: 48,
        margin: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 16,
          right: 16,
        ),
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
            logic.clickLogin(data: data);
          },
          onFailure: (String failCode) {},
          onError: (String errorCode) {},
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
        print("onSuccess>>data>>"+data.toString());
        logic.clickLogin(data: data);
      },
      onFail: (dynamic data) {},
    );
  }
}
