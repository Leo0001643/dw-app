import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'message_details_logic.dart';

class MessageDetailsPage extends StatefulWidget {
  const MessageDetailsPage({Key? key}) : super(key: key);

  @override
  State<MessageDetailsPage> createState() => _MessageDetailsPageState();
}

class _MessageDetailsPageState extends State<MessageDetailsPage> {
  final logic = Get.find<MessageDetailsLogic>();
  final state = Get.find<MessageDetailsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar(Intr().gonggaoxiangqing,bgColor: Colors.white),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
        child: Obx(() {
          var item = state.details.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.noteTitle.em(),style: TextStyle(fontSize: 18.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
              SizedBox(height: 10.h,),
              Text(DateUtil.formatDateMs(item.addTime.em() * 1000),style: TextStyle(fontSize: 12.sp,color: ColorX.color_58698d),),
              SizedBox(height: 10.h,),
              Text(item.noteContent.em(),style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722),),
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MessageDetailsLogic>();
    super.dispose();
  }
}