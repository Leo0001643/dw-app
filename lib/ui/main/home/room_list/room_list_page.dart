import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/html_event.dart';

import 'room_list_logic.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  final logic = Get.find<RoomListLogic>();
  final state = Get.find<RoomListLogic>().state;

  @override
  void dispose() {
    Get.delete<RoomListLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRoomBar(state.title,msg: true,onTap: (){
        DialogUtils().showSelectRoomBtmDialog(context);
      }),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageX.room),fit: BoxFit.fill,
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            InkWell(
              onTap: ()=> Get.toNamed(Routes.game_room,arguments: 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(image: AssetImage(ImageX.room1),fit: BoxFit.fill),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                height: 0.181.sh,
                width: 335.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intr().card_ptf,style: TextStyle(fontSize: 20.sp,color: ColorX.color_c20015,fontWeight: FontWeight.w600),),
                        Text(Intr().dangqianzaixian(["10","\$8000"]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015),),
                      ],
                    ),
                    InkWell(
                      onTap: ()=> Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: Constants.test_role,pageTitle: Intr().peilvshuoming)),
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015),),
                          Image.asset(ImageX.icon_right_black,color: ColorX.color_c20015,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: ()=> Get.toNamed(Routes.game_room,arguments: 1),
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage(ImageX.room2),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                height: 0.181.sh,
                width: 335.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intr().card_gjf,style: TextStyle(fontSize: 20.sp,color: ColorX.color_344e7b,fontWeight: FontWeight.w600),),
                        Text(Intr().dangqianzaixian(["14","\$8000"]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b),),
                      ],
                    ),
                    InkWell(
                      onTap: ()=> Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: Constants.test_role,pageTitle: Intr().peilvshuoming)),
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b),),
                          Image.asset(ImageX.icon_right_black,color: ColorX.color_344e7b,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: ()=> Get.toNamed(Routes.game_room,arguments: 2),
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage(ImageX.room3),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
                height: 0.181.sh,
                width: 335.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intr().card_gbf,style: TextStyle(fontSize: 20.sp,color: ColorX.color_4e3100,fontWeight: FontWeight.w600),),
                        Text(Intr().dangqianzaixian(["17","\$8000"]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_4e3100),),
                      ],
                    ),
                    InkWell(
                      onTap: ()=> Get.toNamed(Routes.html,arguments: HtmlEvent(isHtmlData: true,data: Constants.test_role,pageTitle: Intr().peilvshuoming)),
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_4e3100),),
                          Image.asset(ImageX.icon_right_black,color: ColorX.color_4e3100,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: ()=> DialogUtils().showGameRoleBtmDialog(context),
                      child: buildRoleItem(Intr().wanfaguizhe,Intr().wanfaguizhe_jieshao,0),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: InkWell(
                      onTap: ()=> DialogUtils().showGameRoleBtmDialog(context),
                      child: buildRoleItem(Intr().youxishuyu,Intr().youxishuyu_jieshao, 1),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: InkWell(
                      onTap: ()=> DialogUtils().showGameRoleBtmDialog(context),
                      child: buildRoleItem(Intr().xiazhujiqiao,Intr().xiazhujiqiao_jieshao, 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget buildRoleItem(String name, String role, int i) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
              Image.asset(ImageX.ic_into_right),
            ],
          ),
          SizedBox(height: 5.h,),
          Text(role,style: TextStyle(fontSize: 12.sp,color: ColorX.color_091722),),
        ],
      ),
    );
  }
}