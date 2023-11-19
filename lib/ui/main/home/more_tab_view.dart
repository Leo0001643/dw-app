
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  var homeMenu = [HomeGameMenuEntity(name: "个人中心",group: ImageX.icon_dai,),
    HomeGameMenuEntity(name: Intr().zoushi,group: ImageX.icon_gywm,),
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
          bodyBuilder: (context) => Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            children: homeMenu.map((e) => buildMenuItem(context,e,homeMenu.indexOf(e))).toList(),
          ),
          onPop: () => print('Popover was popped!'),
          direction: PopoverDirection.bottom,
          backgroundColor: ColorX.cardBg5(),
          barrierColor: Colors.transparent,
          width: 206.w,
          height: 130.h,
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
      child: SizedBox(
        width: 68.w,
        height: 65.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(e.group.em(),width: 24.r,fit: BoxFit.fill,),
            SizedBox(height: 4.h,),
            Text(e.name.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),),
          ],
        ),
      ),
    );
  }






}


