import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

import 'about_logic.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final logic = Get.find<AboutLogic>();
  final state = Get.find<AboutLogic>().state;

  @override
  void dispose() {
    Get.delete<AboutLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("关于我们",msg: true),
      backgroundColor: ColorX.color_f7f8fb,
      body: Container(
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),),
        margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
        child: Obx(() {
          return ListView.separated(
              itemBuilder: (context,index){
                var item = state.aboutList.value[index];
                return GFListTile(
                  title: Text(item,style: TextStyle(fontSize: 14.sp,color: ColorX.color_0d192d),),
                  shadow: BoxShadow(color: Colors.transparent),
                  padding: EdgeInsets.only(left: 5.w,top: 13.h,right: 9.w,bottom: 13.h),
                  margin: EdgeInsets.zero,
                  icon: Image.asset(ImageX.icon_right_grey),
                  onTap: (){
                    Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: Constants.test_html,pageTitle: item));
                  },
                );
              },
              separatorBuilder: (context,index){
                return Divider(height: 1.h,color: ColorX.color_10_949,indent: 10.w,endIndent: 10.w,);
              },
              itemCount: state.aboutList.value.length
          );
        }),
      ),
    );
  }


}