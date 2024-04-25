import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

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
  void dispose() {
    Get.delete<MessageDetailsLogic>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().gonggaoxiangqing,bgColor: ColorX.appBarBg(),scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg(),
      body: Container(
        margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h),
        child: Obx(() {
          var item = state.details.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.username.em(),style: TextStyle(fontSize: 18.sp,color: ColorX.textBlack(),fontWeight: FontWeight.w600),),
              SizedBox(height: 10.h,),
              Text(DataUtils.format12Hour(item.addTime.em() * 1000),style: TextStyle(fontSize: 12.sp,color:  ColorX.text586()),),
              SizedBox(height: 10.h,),
              Text(item.message.em(),style: TextStyle(fontSize: 16.sp,color: ColorX.textBlack()),),
            ],
          );
        }),
      ),
    );
  }

}