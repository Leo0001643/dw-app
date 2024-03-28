
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/route_test.dart';

class AccessRouteDialog extends StatefulWidget{

  final List<String> list;
  final String path;
  const AccessRouteDialog(this.list, this.path, {super.key});


  @override
  State<StatefulWidget> createState() => StateAccessRouteDialog();

}

class StateAccessRouteDialog extends State<AccessRouteDialog>{

  var routes = RxList<RouteTest>.empty(growable: true);

  @override
  void initState() {
    routes.clear();
    for(var i=0;i<widget.list.length;i++){
      routes.add(RouteTest(0, Intr().xianlu_(["${i+1}"]), widget.list[i]));
    }
    loggerArray(["输出查询线路",routes.value]);

    routes.refresh();
    routes.forEach((element) async {
      var apiurl = element.url+widget.path;
      element.delayTime = await testApiDelay(apiurl);
      routes[routes.indexOf(element)] = element;
      routes.refresh();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h,),
      width: 0.8.sw,
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("fangwenluxian".tr,style: TextStyle(fontSize: 16.sp,color: ColorX.text3e3()),),
            ),
            SizedBox(height: 20.h,),
            ...routes.map((e) => buildRouteState(e)).toList(),
            // buildRouteState(),
            // SizedBox(height: 12.h,),
            // buildRouteState(),
            SizedBox(height: 18.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 5.h,
                          color: ColorX.color_60c549,
                        ),
                        SizedBox(height: 7.h,),
                        Text("kuai".tr,style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 5.h,
                          color: ColorX.color_ff9e52,
                        ),
                        SizedBox(height: 7.h,),
                        Text("yiban".tr,style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 5.h,
                          color: ColorX.color_d53849,
                        ),
                        SizedBox(height: 7.h,),
                        Text("henman".tr,style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 5.h,
                          color: ColorX.color_b5b5b5,
                        ),
                        SizedBox(height: 7.h,),
                        Text("bukeyong".tr,style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h,),
            Center(
              child: WidgetUtils().buildOutlineButton("fanhui".tr, 131.w, 40.h,ColorX.cardBg18(), bg: ColorX.cardBg17(),
                  textColor: ColorX.text0917(),onPressed: ()=> Navigator.pop(context)),
            ),
          ],
        );
      }),
    );
  }


  Widget buildRouteState(RouteTest route){
    var color = ColorX.color_fc243b;
    if(route.delayTime < 200){
      color = ColorX.color_60c549;
    }else if(route.delayTime < 600){
      color = ColorX.color_ff9e52;
    }else if(route.delayTime < 900){
      color = ColorX.color_d53849;
    }else{
      color = ColorX.color_b5b5b5;
    }
    return InkWell(
      onTap: (){ Navigator.pop(context,route.url); },
      child: Container(
        height: 45.h,
        margin: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorX.line10949(),width: 1.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w,),
            Text(route.title,style: TextStyle(fontSize: 16.sp,color: ColorX.text333()),),
            Expanded(
              child: Center(
                child: route.delayTime.em() == 0 ?
                const CupertinoActivityIndicator(color: ColorX.color_2c2c2c,) :
                Text("${route.delayTime}ms",style: TextStyle(fontSize: 16.sp,color: color),),
              ),
            ),
            // Image.asset(ImageX.icon_right_black),
            Container(
              height: 45.h,
              width: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: ColorX.cardBg17(),borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),bottomRight: Radius.circular(10.r))),
              child: Text(Intr().entry,style: TextStyle(fontSize: 14.sp,color: ColorX.text333()),),
            ),
          ],
        ),
      ),
    );
  }


  Future<int> testApiDelay(String apiurl) async {
    apiurl = apiurl.startsWith("http") ? apiurl : "http://${apiurl}";
    final uri = Uri.parse(apiurl); // 替换为你要测试的接口地址
    final stopwatch = Stopwatch();
    stopwatch.start(); // 启动计时器
    final response = await http.get(uri); // 发起接口请求
    stopwatch.stop(); // 停止计时器
    final duration = stopwatch.elapsed; // 获取经过的时间
    loggerArray(["访问延时，状态",duration.inMilliseconds,response.statusCode]);
    return Future.value(duration.inMilliseconds);
  }






}

