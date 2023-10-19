
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

class BettingLeftItem extends StatefulWidget{

  final int index;
  BettingLeftItem(this.index);

  @override
  State<StatefulWidget> createState() =>StateBettingLeftItem();

}

class StateBettingLeftItem extends State<BettingLeftItem>{


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 13.w),
            child: Row(
              children: [
                GFAvatar(
                  backgroundImage: NetworkImage(Constants.test_image),
                  shape: GFAvatarShape.circle,
                  radius: 16.r,
                ),
                SizedBox(width: 5.w,),
                Text("Zoe",style: TextStyle(fontSize: 14.sp,color: ColorX.color_606060),),
              ],
            ),
          ),
          GFCard(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.only(left: 50.w,right: 53.w,bottom: 15.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            elevation: 3.r,
            content: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 15.w,),
                  decoration: BoxDecoration(
                    color: ColorX.color_68_e2e,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r),),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("第123123121期",style: TextStyle(fontSize: 14.sp,color: ColorX.color_80_091),),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("投注",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
                          Image.asset(ImageX.icon_right_black),
                        ],
                      ),
                    ],
                  ),
                ),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                buildBettingInfoItem(),
                Container(
                  padding: EdgeInsets.only(right: 10.w,top: 8.h,bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("注单：",style: TextStyle(fontSize: 13.sp,color: ColorX.color_60543f),),
                      Text("4",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
                      Text("，总计：",style: TextStyle(fontSize: 13.sp,color: ColorX.color_60543f),),
                      Text("¥80",style: TextStyle(fontSize: 15.sp,color: ColorX.color_fc243b),),
                    ],
                  ),
                ),
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
              Text("First ball - 3",style: TextStyle(fontSize: 13.sp,color: ColorX.color_333333),),
              Text("8.666 x \$5",style: TextStyle(fontSize: 13.sp,color: ColorX.color_58698d),),
            ],
          ),
        ),
        Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
      ],
    );
  }

}




