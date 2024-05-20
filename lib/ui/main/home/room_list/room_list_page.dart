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
import 'package:leisure_games/app/widget/drawer_scaffold.dart';
import 'package:leisure_games/ui/bean/pc28_lotto_entity.dart';

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
    return DrawerScaffold(
      scaffoldKey: state.scaffoldKey,
        appBar: WidgetUtils().buildRoomBar(state.title,msg: true,drawer: true,
            scaffoldKey: state.scaffoldKey,onTap: (){
          DialogUtils().showSelectRoomBtmDialog(context,state.pc28Lotto.value).then((value) {
            if(unEmpty(value?.name)){
              Get.toNamed(Routes.game_room,arguments: value);
            }
          });
        }),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageX.roomT()),fit: BoxFit.fill,
              )
          ),
          child: Obx(() {
            if(isEmpty(state.room.value.tables)) return Container();
            return Column(
              children: [
                ...state.room.value.tables!.map((e) => buildRoomItem(e)).toList(),

                SizedBox(height: 20.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: ()=> DialogUtils().showGameRoleBtmDialog(context,0,logic),
                          child: buildRoleItem(Intr().wanfaguizhe,"",0),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: InkWell(
                          onTap: ()=> DialogUtils().showGameRoleBtmDialog(context,1,logic),
                          child: buildRoleItem(Intr().youxishuyu,"", 1),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: InkWell(
                          onTap: ()=> DialogUtils().showGameRoleBtmDialog(context,2,logic),
                          child: buildRoleItem(Intr().xiazhujiqiao,"", 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        )
    );
  }

  Widget buildRoleItem(String name, String role, int i) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg14(),
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

  Widget buildRoomItem(Pc28LottoRoomsTables e) {
    var bg = e.level == 1 ? ImageX.room1 : (e.level == 2 ? ImageX.room2:ImageX.room3);
    var color = e.level == 1 ? ColorX.color_c20015 : (e.level == 2 ? ColorX.color_344e7b:ColorX.color_4e3100);
    return Column(
      children: [
        SizedBox(height: 20.h,),
        InkWell(
          onTap: ()=> logic.clickRoom(e),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(image: AssetImage(bg),fit: BoxFit.fill),
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
                    Text(e.name.em(),style: TextStyle(fontSize: 20.sp,color: color,fontWeight: FontWeight.w600),),
                    Text(Intr().dangqianzaixian([e.memo1.em(),e.memo2.em()]),style: TextStyle(fontSize: 12.sp,color: color),),
                  ],
                ),
                InkWell(
                  onTap: ()=> logic.clickRate(e, e.level == 1 ? "LowRate" : (e.level == 2 ? "MinRate":"HighRate")),
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: color,),),
                          Container(height: 1.h,width: 50.w,color: color,),
                        ],
                      ),
                      // Text(Intr().peilvshuoming,style: TextStyle(fontSize: 12.sp,color: ColorX.color_c20015,decoration: TextDecoration.underline),),
                      Image.asset(ImageX.icon_right_black,color: color,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }




}
