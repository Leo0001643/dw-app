import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/app_data.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/base_api_oss_entity.dart';
import 'package:leisure_games/ui/bean/route_test.dart';

import 'my_rote_gird_view.dart';

class BottomAccessRouteDialog extends StatefulWidget {
  const BottomAccessRouteDialog({super.key});

  @override
  State<StatefulWidget> createState() => StateAccessRouteDialog();
}

class StateAccessRouteDialog extends State<BottomAccessRouteDialog> {

  BaseWsApiEntity? entity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Text(
                  "fangwenluxian".tr,
                  style: TextStyle(fontSize: 16.sp, color: ColorX.appTextBg()),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    ///这里需要去更换baseurl和 wsbaseurl
                    if(unEmpty(entity)){
                      AppData.setBaseUrl(entity!.baseApi.em());
                      AppData.setBaseWsUrl(entity!.webSocket.em());
                      eventBus.fire(entity);///通知各页面刷新数据
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    alignment: Alignment.center,
                    width: 50.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorX.color_fc243b,
                    ),
                    child: Text(
                      "dialog_see_more".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 6.h, // 设置高度为6像素
                        width: 6.w, // 设置宽度为6像素
                        decoration: const BoxDecoration(
                          color: ColorX.color_60c549,
                          shape: BoxShape.circle, // 设置形状为圆形
                        ),
                      ),
                      SizedBox(
                        width: 7.h,
                      ),
                      Text(
                        "kuai".tr,
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorX.color_58698d),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 6.h, // 设置高度为6像素
                        width: 6.w, // 设置宽度为6像素
                        decoration: const BoxDecoration(
                          color: ColorX.color_ff9e52,
                          shape: BoxShape.circle, // 设置形状为圆形
                        ),
                      ),
                      SizedBox(
                        width: 7.h,
                      ),
                      Text(
                        "yiban".tr,
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorX.color_58698d),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 6.h, // 设置高度为6像素
                        width: 6.w, // 设置宽度为6像素
                        decoration: const BoxDecoration(
                          color: ColorX.color_d53849,
                          shape: BoxShape.circle, // 设置形状为圆形
                        ),
                      ),
                      SizedBox(
                        width: 7.h,
                      ),
                      Text(
                        "henman".tr,
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorX.color_58698d),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 6.h, // 设置高度为6像素
                        width: 6.w, // 设置宽度为6像素
                        decoration: const BoxDecoration(
                          color: ColorX.color_b5b5b5,
                          shape: BoxShape.circle, // 设置形状为圆形
                        ),
                      ),
                      SizedBox(
                        width: 7.h,
                      ),
                      Text(
                       "bukeyong".tr,
                        style: TextStyle(
                            fontSize: 14.sp, color: ColorX.color_58698d),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "fangjiechi".tr,
                      style: TextStyle(
                          fontSize: 14.sp, color: ColorX.color_58698d),
                    ),
                    Transform.scale(
                        scale: 0.8, // 调整这个值以缩放 Switch 的大小
                        child: Switch(
                          thumbColor: MaterialStateColor.resolveWith((states) {
                            // 根据状态返回相应的颜色
                            if (states.contains(MaterialState.selected)) {
                              // Switch 处于激活状态时的颜色
                              return Colors.white;
                            }
                            // Switch 处于非激活状态时的颜色
                            return Colors.white; // 你可以根据需要修改颜色
                          }),
                          onChanged: (value) {},
                          value: false,
                          inactiveTrackColor: ColorX.text949(),
                          activeTrackColor: ColorX.color_69c25c,
                          activeColor: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.r),
            child: MyRoteGridView((value){
              entity = value;
            }),
          ),
        ],
      ),
    );
  }

  Widget buildRouteState(RouteTest route) {
    var color = ColorX.color_fc243b;
    if (route.delayTime < 200) {
      color = ColorX.color_60c549;
    } else if (route.delayTime < 600) {
      color = ColorX.color_ff9e52;
    } else if (route.delayTime < 900) {
      color = ColorX.color_d53849;
    } else {
      color = ColorX.color_b5b5b5;
    }
    return InkWell(
      onTap: () {
        Navigator.pop(context, route.url);
      },
      child: Container(
        height: 45.h,
        margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorX.color_10_949, width: 1.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              "${route.delayTime}mm",
              style: TextStyle(fontSize: 16.sp, color: color),
            ),
            Expanded(child: Container()),
            Image.asset(ImageX.icon_right_black),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
    );
  }

/*  Future<RouteTest> testApiDelay(String baseUrl, String apiurl) async {
    apiurl = apiurl.startsWith("http") ? apiurl : "http://${apiurl}";
    final uri = Uri.parse(apiurl); // 替换为你要测试的接口地址
    final stopwatch = Stopwatch();
    stopwatch.start(); // 启动计时器
    final response = await http.get(uri); // 发起接口请求
    stopwatch.stop(); // 停止计时器
    final duration = stopwatch.elapsed; // 获取经过的时间
    loggerArray(["访问延时，状态", duration.inMilliseconds, response.statusCode]);
    return Future.value(RouteTest(duration.inMilliseconds,"", baseUrl));
  }*/
}
