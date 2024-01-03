
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/ui/bean/home_game_menu_entity.dart';
import 'package:leisure_games/ui/main/home/home_logic.dart';
import 'package:popover/popover.dart';

class MoreTabView extends StatelessWidget {

  final HomeLogic logic;
  MoreTabView(this.logic, {super.key});

  var homeMenu = [HomeGameMenuEntity(name: Intr().grzx,group: ImageX.icon_mine_svg,),
    HomeGameMenuEntity(name: Intr().zoushi,group: ImageX.icon_zoushi,),
    HomeGameMenuEntity(name: Intr().eduzhuanhuan,group: ImageX.icon_edzh,),
    HomeGameMenuEntity(name: Intr().bibiduihuan,group: ImageX.icon_bb,),
    HomeGameMenuEntity(name: Intr().touzhujilu,group: ImageX.icon_tzjl,),
    HomeGameMenuEntity(name: Intr().tuiguangzhuanqian,group: ImageX.icon_tuiguang,),];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => GridView.builder(
            itemCount:homeMenu.length ,
            itemBuilder: (context,index){
              var e=homeMenu[index];
              return buildMenuItem(context,e,homeMenu.indexOf(e));
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

          ),
          ),
          onPop: (){},
          direction: PopoverDirection.bottom,
          backgroundColor: ColorX.cardBg5(),
          barrierColor: Colors.transparent,
          width: 80*homeMenu.length*1.0/2,
          height: 200.h,
          arrowHeight: 5.r,
          arrowWidth: 8.r,
        );
      },
      child: SizedBox(
        width: 50.w,
        child: Column(
          children: [
            Image.asset(ImageX.icGengDuoT(),width: 20.r,fit: BoxFit.fill,),
            SizedBox(height: 4.h,),
            Text(Intr().gengduo,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
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
            buildImageItem(e.group.em(),),
            SizedBox(height: 4.h,),
            Text(e.name.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
          ],
        ),
      ),
    );
  }
  Widget buildImageItem(String icon) {
    if (icon.contains("mine.svg")||icon.contains("zoushi.svg")) {
      return SvgPicture.asset(
        icon,
        width: 24.w,
        height: 24.w,
        fit: BoxFit.contain,
      );
    }else{
      return Image.asset(
        icon,
        width: 24.w,
        height: 24.w,
        fit: BoxFit.contain,
      );
    }
  }

}


