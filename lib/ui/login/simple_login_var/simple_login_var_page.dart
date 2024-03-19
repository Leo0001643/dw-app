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
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/var_code_entity.dart';

import 'simple_login_var_logic.dart';

/// Author: Soushin-932707629@qq.com
/// Date: 2024/3/19 16:04
/// Description: 简易密码验证码
class SimpleLoginVarPage extends StatefulWidget {
  @override
  State<SimpleLoginVarPage> createState() => _SimpleLoginVarPageState();
}

class _SimpleLoginVarPageState extends State<SimpleLoginVarPage> {
  final logic = Get.find<SimpleLoginVarLogic>();
  final state = Get.find<SimpleLoginVarLogic>().state;

  @override
  void dispose() {
    Get.delete<SimpleLoginVarLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intr().login,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600,),),
        centerTitle: true,
        backgroundColor: ColorX.pageBg(),
        elevation: 0,
        leadingWidth: 0,
        leading: Container(),
        actions: [
          InkWell(
            onTap: ()=>Get.back(),
            child: Image.asset(ImageX.icon_close,color: ColorX.icon586(),),
          ),
        ],
      ),
      backgroundColor: ColorX.pageBg(),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          Obx(() {
            return _getVarCode(state.varcode.value);
          }),
          SizedBox(height: 10.h,),
          Obx(() {
            return _getAliCode(state.varcode.value);
          }),
          SizedBox(height: 10.h,),
          Center(
            child: WidgetUtils().buildElevatedButton(Intr().login, 335.w, 48.h,
                bg: ColorX.color_fd273e,
                textColor: Colors.white,
                textSize: 16.sp, onPressed: () {
                  if (state.varcode.value.status == 1 && state.varcode.value.type == 3) {
                    _handleClickVerify();
                  } else {
                    logic.clickLogin();
                  }
                }),
          ),
        ],
      ),
    );
  }


  Widget _getAliCode(VarCodeEntity varcode) {
    if (varcode.status == 1 && varcode.type == 2) {
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
        logic.clickLogin(data: data);
      },
      onFail: (dynamic data) {},
    );
  }

  _getVarCode(VarCodeEntity varcode) {
    if(varcode.type == 1 && varcode.status == 1){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 335.w,
              decoration: BoxDecoration(
                color: ColorX.cardBg3(),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetUtils().buildTextField(
                          225.w, 46.h, 14.sp, ColorX.text949(), Intr().yzm,
                          hintColor: ColorX.text586(),
                          backgroundColor: Colors.transparent,
                          inputType: TextInputType.text,
                          onChanged: (v) => state.vcode = v),
                      WidgetUtils().buildVarCode(varcode.varCode.em(),
                              () => logic.getVarcode())
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 35.w),
            child: Text(
              Intr().qsrzcyzm,
              style: TextStyle(fontSize: 13.sp, color: ColorX.text586()),
            ),
          ),
        ],
      );
    }else {
      return Container();
    }
  }


}