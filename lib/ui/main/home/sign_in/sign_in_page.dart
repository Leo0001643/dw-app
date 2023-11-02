import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
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
    state.currentDate.value = DateUtil.formatDate(DateTime.now(),format: Intr().nianyueri);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SignInLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageX.sign_bg),fit: BoxFit.fill,),
      ),
      child: Column(
        children: [
          WidgetUtils().buildAppBar(Intr().qiandaoyouli,msg: true,bgColor: Colors.transparent),
          Container(
            height: 87.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 25.w,),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text("12.19",style: TextStyle(fontSize: 32.sp,color: ColorX.color_091722,decoration: TextDecoration.none),),
                SizedBox(width: 5.w,),
                Text(Intr().jifen,style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,decoration: TextDecoration.none,),),
              ],
            ),
          ),
          Container(
            height: 60.h,
            // color: Colors.black12,
            padding: EdgeInsets.symmetric(horizontal: 10.w,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w,top: 15.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Intr().benyueyiqian(["2"]),style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,decoration: TextDecoration.none),),
                      Text(Intr().zongjifen_(["6.19"]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d,decoration: TextDecoration.none),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40.w,top: 17.h,),
                  child: Text(state.currentDate.value,style: TextStyle(fontSize: 14.sp,color: Colors.white,decoration: TextDecoration.none),),
                ),
              ],
            ),
          ),
          GFCard(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.symmetric(horizontal: 15.w,),
            color: Colors.transparent,
            elevation: 0,
            content: buildCalendar(),
          ),
          SizedBox(height: 15.h,),
          WidgetUtils().buildElevatedButton(Intr().lijiqiandao, 320.w, 48.h, bg: ColorX.color_fc9824,onPressed: (){
            DialogUtils().showSignSuccessDialog(context, logic);
          }),
        ],
      ),
    );
  }

  Widget buildCalendar() {
    var now = DateTime.now();
    return TableCalendar(
      firstDay: DateTime.utc(now.year, now.month, 1),
      lastDay: DateTime.utc(now.year, now.month + 1, 0),
      focusedDay: now,
      locale: 'zh_ZH',
      headerVisible: false,
      rowHeight: 52.h,
      daysOfWeekHeight: 45.h,
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
              if(day.day % 2 == 0 || day.day == focusedDay.day){
                var text = day.day == focusedDay.day ? "•":"√";
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    gradient: const LinearGradient(
                      colors: [Color(0xfffeab4a),Color(0xfffc8f24),],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  width: 24.w,
                  height: 38.h,
                  padding: EdgeInsets.symmetric(vertical: 1.h,),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${day.day}",
                        textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,
                          color: Colors.white,fontWeight: FontWeight.w500,),),
                      Text(text,style: TextStyle(fontSize: 14.sp,color: Colors.white,),),
                    ],
                  ),
                );
              }
              ///未签到
              return Center(
                child: Text("${day.day}",
                  textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,
                    color: ColorX.color_58698d,fontWeight: FontWeight.w500,),),
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