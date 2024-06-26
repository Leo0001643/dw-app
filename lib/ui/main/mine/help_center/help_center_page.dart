import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/drawer_scaffold.dart';

import 'help_center_logic.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final logic = Get.find<HelpCenterLogic>();
  final state = Get.find<HelpCenterLogic>().state;

  @override
  void dispose() {
    Get.delete<HelpCenterLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
      appBar: WidgetUtils().buildAppBar(Intr().bangzhuzhongxin,msg: true,drawer:true
          ,scaffoldKey: state.scaffoldKey),
      backgroundColor: ColorX.pageBg2(),
      body: Container(
        decoration: BoxDecoration(color: ColorX.cardBg5(),borderRadius: BorderRadius.circular(12.r),),
        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context,index){
                var item = state.aboutList[index];
                return GFListTile(
                  title: Text(item.name.em(),style: TextStyle(fontSize: 14.sp,color: ColorX.text0d1()),),
                  shadow: BoxShadow(color: Colors.transparent),
                  padding: EdgeInsets.only(left: 5.w,top: 13.h,right: 9.w,bottom: 13.h),
                  margin: EdgeInsets.zero,
                  icon: Image.asset(ImageX.icon_right_grey,color: ColorX.icon586(),),
                  onTap: ()=> logic.clickItem(item),
                );
              },
              separatorBuilder: (context,index){
                return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
              },
              itemCount: state.aboutList.length
          );
        }),
      ),
    );

  }

}