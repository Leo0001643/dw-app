
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/game_kind_entity.dart';

class GameBrandBottomDialog extends StatefulWidget{
  final List<GameKindGameKindList> list;
  final GameKindGameKindList? defKind;
  const GameBrandBottomDialog(this.list, {super.key,this.defKind,});

  @override
  State<StatefulWidget> createState() =>StateGameBrandBottomDialog();

}

class StateGameBrandBottomDialog extends State<GameBrandBottomDialog>{

  // var current = (-1).obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(Intr().qingxuanzhe,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: ()=> Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h,right: 15.w),
                    child: Image.asset(ImageX.icon_close,width: 25.r,height: 25.r,color: ColorX.icon586(),),
                  ),
                ),
              ),
            ],
          ),
          // buildAllBrand(0),
          ...widget.list.map((e) => buildBrandItem(e)).toList(),
        ],
      ),
    );
  }

  // Widget buildAllBrand(int i) {
  //   return Column(
  //     children: [
  //       InkWell(
  //         onTap: ()=> current.value = i,
  //         child: Obx(() {
  //           return Container(
  //             height: 57.h,
  //             alignment: Alignment.center,
  //             color: current.value == i ? Colors.black12 : ColorX.cardBg(),
  //             child: Text(Intr().quanbuyouxi,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
  //           );
  //         }),
  //       ),
  //       Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
  //     ],
  //   );
  // }

  Widget buildBrandItem(GameKindGameKindList item) {
    return Column(
      children: [
        InkWell(
          onTap: ()=> Navigator.pop(context,item),
          child: Container(
            height: 57.h,
            color: item.liveId == widget.defKind?.liveId ? ColorX.cardBg7() : ColorX.cardBg5(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network("${item.host.em()}${item.imageUrl.em()}",width: 25.r,),
                SizedBox(width: 5.w,),
                Text(item.gameName.em(),style: TextStyle(fontSize: 12.sp,color: ColorX.text5862()),),
              ],
            ),
          ),
        ),
        Divider(color: ColorX.color_10_949,height: 1.h,indent: 10.w,endIndent: 10.w,),
      ],
    );
  }

  

}


