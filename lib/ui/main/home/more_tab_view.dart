
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/home_game_menu_entity.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';
import 'package:popover/popover.dart';

class MoreTabView extends StatelessWidget {

  final HomeLogic logic;
  MoreTabView(this.logic, {super.key});

  var homeMenu = [HomeGameMenuEntity(name: Intr().grzx,group: ImageX.iconMineT(),),
    HomeGameMenuEntity(name: Intr().zoushi,group: ImageX.iconZoushiT(),),
    HomeGameMenuEntity(name: Intr().eduzhuanhuan,group: ImageX.iconEdzhT(),),
    HomeGameMenuEntity(name: Intr().bibiduihuan,group: ImageX.iconBbT(),),
    HomeGameMenuEntity(name: Intr().touzhujilu,group: ImageX.iconTzjlT(),),
    HomeGameMenuEntity(name: Intr().tuiguangzhuanqian,group: ImageX.iconTuiguangT(),),];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPopover(
          arrowDyOffset:ScreenUtil().screenHeight*0.16,
          arrowDxOffset: ScreenUtil().screenWidth*0.15,
          context: context,
          bodyBuilder: (context) => GridView.builder(
            itemCount:homeMenu.length ,
            padding: EdgeInsets.zero,
            itemBuilder: (context,index){
              var e=homeMenu[index];
              return buildMenuItem(context,e,homeMenu.indexOf(e));
            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
          ),
          onPop: (){},
          direction: PopoverDirection.left,
          backgroundColor: ColorX.cardBg5(),
          barrierColor: Colors.transparent,
          width: 80.w * homeMenu.length*1.0/2,
          height: 160.h,
          arrowHeight: 0.r,
          arrowWidth: 0.r,
        );
      },
      child: SizedBox(
        width: 55.w,
        child: Column(
          children: [
            SvgPicture.asset(
              ImageX.icGengDuoT(),
              width: 20.w,
              height: 20.w,
              color: ColorX.iconBlack(),
              fit: BoxFit.contain,
            ),
            SizedBox(height: 4.h,),
            Text(Intr().gengduo,style: TextStyle(fontSize: 11.sp,color: ColorX.text0917()),),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context,HomeGameMenuEntity e,int index) {
    return InkWell(
      onTap: ()=> logic.clickMenu(context, 7+index),
      child: Container(
        color: Colors.transparent,
        width: 68,
        height: 65.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetUtils().buildImage(e.group.em(), 24.r, 24.r,fit: BoxFit.contain),
            SizedBox(height: 4.h,),
            Text(e.name.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

}


