
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/dialog_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';

class BettingLeftItem extends StatefulWidget{

  final int index;
  final GameRoomLogic logic;
  BettingLeftItem(this.index,this.logic);

  @override
  State<StatefulWidget> createState() =>StateBettingLeftItem();

}

class StateBettingLeftItem extends State<BettingLeftItem>{


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 13.w),
            child: Row(
              children: [
                GFAvatar(
                  backgroundImage: WidgetUtils().buildImageProvider(ImageX.icon_avatar,),
                  shape: GFAvatarShape.circle,
                  radius: 16.r,
                ),
                SizedBox(width: 5.w,),
                Text("Zoe",style: TextStyle(fontSize: 14.sp,color: ColorX.text606(),),),
              ],
            ),
          ),
          GFCard(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(left: 50.w,right: 53.w,bottom: 5.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            color: ColorX.cardBg(),
            elevation: 3.r,
            content: Column(
              children: [
                InkWell(
                  onTap: ()=> DialogUtils().showConfirmBetDialog(context,widget.logic),
                  child: Obx(() {
                    var color = ColorX.color_68_e2e;
                    switch(widget.logic.state.roomType.value){
                      case 2:
                        color= ColorX.color_70_dee;
                      case 3:
                        color= ColorX.color_44_f0e;
                      default:
                        color= ColorX.color_68_e2e;
                    }
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 15.w,),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Intr().dixqi(["1231312"]),style: TextStyle(fontSize: 14.sp,color: ColorX.text80091()),),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(Intr().touzhu,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorX.textBlack()),),
                              Image.asset(ImageX.icon_right_black,color: ColorX.iconBlack(),),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                Container(
                  padding: EdgeInsets.only(right: 10.w,top: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(Intr().zhudan_,style: TextStyle(fontSize: 13.sp,color: ColorX.text605()),),
                      Text("4",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
                      Text(Intr().zongji_,style: TextStyle(fontSize: 13.sp,color: ColorX.text605()),),
                      Text("¥80",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
                    ],
                  ),
                ),
                SizedBox(height: 7.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildBettingInfoItem() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("First ball - 3",style: TextStyle(fontSize: 13.sp,color: ColorX.text333()),),
              Text("8.666 x \$5",style: TextStyle(fontSize: 13.sp,color: ColorX.text586()),),
            ],
          ),
        ),
        Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
      ],
    );
  }

}




