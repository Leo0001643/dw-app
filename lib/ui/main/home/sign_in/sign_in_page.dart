import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/check_in_info_entity.dart';
import 'package:table_calendar/table_calendar.dart';

import 'sign_in_logic.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final logic = Get.find<SignInLogic>();
  final state = Get.find<SignInLogic>().state;

  @override
  void initState() {
    // state.currentDate.value = DateUtil.formatDate(DateTime.now(),format: Intr().nianyueri);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SignInLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageX.sign_bg),fit: BoxFit.fill,),
        ),
        child: Column(
          children: [
            WidgetUtils().buildAppBar(Intr().qiandaoyouli,msg: true,bgColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),scaffoldKey: state.scaffoldKey),
            Container(
              height: 0.125.sh,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25.w,),
              child: Obx(() {
                return Text.rich(TextSpan(
                  children: [
                    TextSpan(text: Intr().jifen,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,decoration: TextDecoration.none,),),
                    WidgetSpan(child: SizedBox(width: 5.w,)),
                    TextSpan(text:state.checkInfo.value.point.em(),style: TextStyle(fontSize: 32.sp,color: ColorX.color_091722,fontWeight: FontWeight.w700),),
                  ],
                ));
              }),
            ),
            Container(
              height: 0.08.sh,
              // color: Colors.black12,
              padding: EdgeInsets.symmetric(horizontal: 30.w,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    return Text(Intr().benyueyiqian([state.checkInfo.value.signInNum.em()]),
                      style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,decoration: TextDecoration.none),);
                  }),

                  Obx(() {
                    var date = DateUtil.getDateTimeByMs(state.checkInfo.value.timestamp.em() * 1000).subtract(const Duration(hours: 12));
                    // var date = DataUtils.format12Hour(state.checkInfo.value.timestamp.em() * 1000,format: Intr().nianyueri,isUtc:true);
                    return Text(DateUtil.formatDate(date,format: Intr().nianyueri),style: TextStyle(fontSize: 14.sp,color: Colors.white,decoration: TextDecoration.none),);
                  }),
                ],
              ),
            ),
            GFCard(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.symmetric(horizontal: 15.w,),
              color: Colors.transparent,
              elevation: 0,
              content: Column(
                children: [
                  Obx(() {
                    return buildCalendar(state.checkInfo.value);
                  }),
                  SizedBox(height: 15.h,),
                  Obx(() {
                    var date = DateUtil.getDateTimeByMs(state.checkInfo.value.timestamp.em() * 1000,).subtract(const Duration(hours: 12));
                    if(state.checkInfo.value.log?.contains("${date.day}") == true){
                      return WidgetUtils().buildElevatedButton(Intr().yiqiandao, 320.w, 48.h, bg: ColorX.color_ffe0ac,onPressed: (){});
                    } else {
                      return WidgetUtils().buildElevatedButton(Intr().lijiqiandao, 320.w, 48.h, bg: ColorX.color_fc9824,onPressed: (){
                        logic.checkInPoint(context);
                      });
                    }
                  }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.black12,
                alignment: Alignment.center,
                child: Text(Intr().biaozhunshijian,style: TextStyle(fontSize: 14.sp,color: Colors.white,),textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCalendar(CheckInInfoEntity check) {
    var now = DateUtil.getDateTimeByMs(check.timestamp.em() * 1000,).subtract(const Duration(hours: 12));
    return TableCalendar(
      firstDay: DateTime.utc(now.year, now.month, 1),
      lastDay: DateTime.utc(now.year, now.month + 1, 0),
      focusedDay: now,
      locale: 'zh_ZH',
      headerVisible: false,
      rowHeight: 40.h,

      daysOfWeekHeight: 35.h,
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context,day){
          var text = DataUtils.getWeekday(day);
          return Center(
            child: Text(text,
              textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,color: ColorX.color_2c2c2c,),),
          );
        },
        prioritizedBuilder: (context,day,focusedDay){
          if(day.month == focusedDay.month){
            ///只渲染当月数据
            if(day.day <= focusedDay.day){
              ///已签到 || 当天
              if(check.log?.contains("${day.day}") ==  true){
                // var text = check.log?.contains("${day.day}") ==  true ? "√":"•";
                var text = check.log?.contains("${day.day}") ==  true ? "•":"•";
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    gradient: const LinearGradient(
                      colors: [Color(0xfffeab4a),Color(0xfffc8f24),],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  width: 24.w,
                  height: 40.w,
                  padding: EdgeInsets.symmetric(vertical: 1.h,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${day.day}",
                        textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,
                          color: Colors.white,fontWeight: FontWeight.w700,),),
                      text=="•"?Container(
                        width: 8.w,
                        height: 8.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.w))),
                        ):
                      Text(text,style: TextStyle(fontSize: 12.sp,color: Colors.white,fontWeight: FontWeight.w700,),),
                    ],
                  ),
                );
              }
              ///未签到
              return Center(
                child: Text("${day.day}",
                  textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,
                    color: ColorX.color_2c2c2c,fontWeight: FontWeight.w500,),),
              );
            }
            return Center(
              child: Text("${day.day}",
                textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,
                  color: ColorX.color_2c2c2c,fontWeight: FontWeight.w500,),),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

}