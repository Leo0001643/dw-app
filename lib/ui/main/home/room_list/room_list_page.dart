import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRoomBar("台湾宾果PC28",msg: true,onTap: (){
        DialogUtils().showSelectRoomBtmDialog(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("普通房",style: TextStyle(fontSize: 20.sp,color: ColorX.color_c20015,fontWeight: FontWeight.w600),),
                  Text("当前在线18人|奖金池\$8,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015),),
                  SizedBox(height: 44.h,),
                  Row(
                    children: [
                      Text("赔率说明",style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015),),
                      Image.asset(ImageX.icon_right_black,color: ColorX.color_c20015,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("高级房",style: TextStyle(fontSize: 20.sp,color: ColorX.color_344e7b,fontWeight: FontWeight.w600),),
                  Text("当前在线18人|奖金池\$8,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b),),
                  SizedBox(height: 44.h,),
                  Row(
                    children: [
                      Text("赔率说明",style: TextStyle(fontSize: 12.sp,color: ColorX.color_344e7b),),
                      Image.asset(ImageX.icon_right_black,color: ColorX.color_344e7b,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("贵宾房",style: TextStyle(fontSize: 20.sp,color: ColorX.color_4e3100,fontWeight: FontWeight.w600),),
                  Text("当前在线18人|奖金池\$8,888",style: TextStyle(fontSize: 12.sp,color: ColorX.color_4e3100),),
                  SizedBox(height: 44.h,),
                  Row(
                    children: [
                      Text("赔率说明",style: TextStyle(fontSize: 12.sp,color: ColorX.color_4e3100),),
                      Image.asset(ImageX.icon_right_black,color: ColorX.color_4e3100,),
                    ],
                  ),
                ],
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
                      child: buildRoleItem("玩法规则","给大家介绍下玩法规则,为了游…",0),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: InkWell(
                      onTap: ()=> DialogUtils().showGameRoleBtmDialog(context),
                      child: buildRoleItem("游戏术语","了解常用的术语后提高游戏效…", 1),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: InkWell(
                      onTap: ()=> DialogUtils().showGameRoleBtmDialog(context),
                      child: buildRoleItem("下注技巧","以下是一些下注的技巧,例如 …", 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RoomListLogic>();
    super.dispose();
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