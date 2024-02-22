import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import '../../../../main.dart';
import '../../ends_drawer_view.dart';
import 'room_list_logic.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

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
          DialogUtils().showSelectRoomBtmDialog(context,state.pc28Lotto.value).then((value) {
            if(unEmpty(value?.name)){
              print("跳转传入2 ${jsonEncode(value?.toJson())}");
              Get.toNamed(Routes.game_room,arguments: value);
            }
          });
        },drawEnd: () {
          scaffoldMineKey.currentState?.openEndDrawer();
        }),
        endDrawer: EndsDrawerView(),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageX.roomT()),fit: BoxFit.fill,
              )
          ),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              InkWell(
                onTap: ()=> logic.clickRoom(state.room.value.tables?[0]),
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
                      Obx(() {
                        var room = state.room.value.tables?[0];
                        if(isEmpty(room)){ return Container(); }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(room!.name.em(),style: TextStyle(fontSize: 20.sp,color: ColorX.color_c20015,fontWeight: FontWeight.w600),),
                            Text(Intr().dangqianzaixian([room.memo1.em(),room.memo2.em()]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015),),
                          ],
                        );
                      }),
                      InkWell(
                        onTap: ()=> logic.clickRate(state.room.value.tables?[0],"LowRate"),
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015,),),
                                Container(height: 1.h,width: 50.w,color: ColorX.color_c20015,),
                              ],
                            ),
                            // Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015,decoration: TextDecoration.underline),),
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
                onTap: ()=> logic.clickRoom(state.room.value.tables?[1]),
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
                      Obx(() {
                        var room = state.room.value.tables?[1];
                        if(isEmpty(room)){ return Container(); }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(room!.name.em(),style: TextStyle(fontSize: 20.sp,color: ColorX.color_344e7b,fontWeight: FontWeight.w600),),
                            Text(Intr().dangqianzaixian([room.memo1.em(),room.memo2.em()]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b),),
                          ],
                        );
                      }),
                      InkWell(
                        onTap: ()=> logic.clickRate(state.room.value.tables?[1],"MinRate"),
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b,),),
                                Container(height: 1.h,width: 50.w,color: ColorX.color_344e7b,),
                              ],
                            ),
                            // Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b,decoration: TextDecoration.underline),),
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
                onTap: ()=> logic.clickRoom(state.room.value.tables?[2]),
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
                      Obx(() {
                        var room = state.room.value.tables?[2];
                        if(isEmpty(room)){ return Container(); }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(room!.name.em(),style: TextStyle(fontSize: 20.sp,color: ColorX.color_4e3100,fontWeight: FontWeight.w600),),
                            Text(Intr().dangqianzaixian([room.memo1.em(),room.memo2.em()]),style: TextStyle(fontSize: 12.sp,color: ColorX.color_4e3100),),
                          ],
                        );
                      }),
                      InkWell(
                        onTap: ()=> logic.clickRate(state.room.value.tables?[2],"HighRate"),
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_4e3100,),),
                                Container(height: 1.h,width: 50.w,color: ColorX.color_4e3100,),
                              ],
                            ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: ()=> DialogUtils().showGameRoleBtmDialog(context,0,logic),
                        child: buildRoleItem(Intr().wanfaguizhe,Intr().wanfaguizhe_jieshao,0),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: InkWell(
                        onTap: ()=> DialogUtils().showGameRoleBtmDialog(context,1,logic),
                        child: buildRoleItem(Intr().youxishuyu,Intr().youxishuyu_jieshao, 1),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: InkWell(
                        onTap: ()=> DialogUtils().showGameRoleBtmDialog(context,2,logic),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(name,style: TextStyle(fontSize: 13.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
              ),
              Image.asset(ImageX.ic_into_right),
            ],
          ),
          // SizedBox(height: 5.h,),
          // Text(role,style: TextStyle(fontSize: 12.sp,color: ColorX.text0917(),overflow: TextOverflow.ellipsis),maxLines: 2,),
        ],
      ),
    );
  }
}
