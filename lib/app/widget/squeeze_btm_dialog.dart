
import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_item_logic.dart';
import 'package:leisure_games/ui/main/home/game_room/text_timer/text_timer_item.dart';
import 'package:leisure_games/ui/main/home/game_room/utils/game_rule_util.dart';
import 'package:scratcher/scratcher.dart';

class SqueezeBtmDialog extends StatefulWidget{
  final GameRoomLogic logic;

  const SqueezeBtmDialog(this.logic, {super.key});

  @override
  State<StatefulWidget> createState() => StateSqueezeBtmDialog();

}


class StateSqueezeBtmDialog extends State<SqueezeBtmDialog>{
  bool isScratched = false;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageX.mipaibg),fit: BoxFit.fill),
      ),
      height: 0.81.sh,
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w,top: 15.h),
            child: InkWell(
              onTap: ()=> Navigator.of(context).pop(),
              child: WidgetUtils().buildImage(ImageX.iconDownArrow(), 24.r, 24.r),
            ),
          ),
          SizedBox(height: 15.h,),
          Center(child: Image.asset(ImageX.titlegjP()),),
          GetBuilder<TextItemLogic>(
            id: TextItemLogic.id_textTimerItem,
            builder: (logic){
              var term = widget.logic.term.value;
              if(isInt(term) ){
                term="${(int.tryParse(term)??0)-1}";
              }
              var nextTerm = term;
              if(isInt(term) && term.length > 8){
                nextTerm = "${int.parse(term) + 1}";
                nextTerm = nextTerm.substring(4,nextTerm.length);
                term = term.substring(4,term.length);
              }

              return Stack(
                children: [
                  Center(child: Image.asset(ImageX.guajiabg,width: 362.w,height: 347.h,fit: BoxFit.fill,),),
                  Positioned(
                    top: 14.h, left: 0,right: 2.w,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            logic.scratchKey.currentState?.reset(duration: const Duration(milliseconds: 200));
                          },
                          child: Text(Intr().dixqi([term]),style: TextStyle(fontSize: 18.sp,color: ColorX.color_fdf7e0,fontWeight: FontWeight.w600,),),
                        ),
                        SizedBox(height: 38.h,),
                        Center(
                          child: LayoutBuilder(
                            builder: (context,cts){
                              var headWSLotteryEntityData = Get.find<GameRoomLogic>().headWSLotteryEntityData;
                              List<int> arr2 = GameRuleUtil.parseLottery(headWSLotteryEntityData?.originalNum??""); //3
                              // loggerArray(["咪牌开奖结果更新",arr2,logic.guaguaMask]);
                              var result = arr2[3] > 9 ? '${arr2[3]}' : (arr2[3] > 0 ? '0${arr2[3]}' : '${arr2[3]}');
                              var icon = AnimatedOpacity(
                                opacity: opacity,
                                duration: const Duration(milliseconds: 750),
                                child: Container(
                                  width: 287.w,
                                  height: 137.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      buildDrawNum("${arr2[0]}",),
                                      buildDrawMark("+"),
                                      buildDrawNum("${arr2[1]}",),
                                      buildDrawMark("+"),
                                      buildDrawNum("${arr2[2]}",),
                                      buildDrawMark("="),
                                      buildDrawResult(result),
                                    ],
                                  ),
                                ),
                              );
                              return SizedBox(
                                width: 287.w,
                                height: 137.h,
                                ///开奖中状态下直接显示图片即可，需要刮奖的时候再去显示呱呱
                                child: logic.guaguaMask == ImageX.lotteringP() ? WidgetUtils().buildImage(logic.guaguaMask, 287.w, 137.h,fit: BoxFit.fill)
                                : Scratcher(
                                  key: logic.scratchKey,
                                  accuracy: ScratchAccuracy.low,
                                  color: Colors.transparent,
                                  image: Image.asset(logic.guaguaMask,fit: BoxFit.fill,),
                                  brushSize: 25.r,
                                  threshold: 50,
                                  onThreshold: () {
                                    setState(() {
                                      opacity = 1;
                                      isScratched = true;
                                      ///刮开了 显示全部的开奖结果
                                      logic.scratchKey.currentState?.reveal(duration: const Duration(milliseconds: 200));
                                    });
                                  },
                                  child: Container(child: icon,),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 23.h,),
                        SizedBox(
                          width: 270.w,
                          child: Row(
                            children:[
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (context,cts){
                                    var lotteryTime = (int.tryParse(logic.mipaiOpenTime)??0) > 0 ? logic.mipaiOpenTime : Intr().kaijiangzhong;
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(Intr().dixqitouzhu([nextTerm,logic.mipaiBetTime]),style: TextStyle(fontSize: 14.sp,color: ColorX.color_fdf7e0),),
                                        SizedBox(height: 3.h,),
                                        Text(Intr().dixqikaijiang([nextTerm,lotteryTime]),style: TextStyle(fontSize: 14.sp,color: ColorX.color_fdf7e0),),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              WidgetUtils().buildElevatedButton(Intr().shuaxin, 59.w, 40.h,bg: ColorX.color_50_c13,textColor: ColorX.color_ffe0ac, onPressed: (){
                                logic.scratchKey.currentState?.reset(duration: const Duration(milliseconds: 200));
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }


  Widget buildDrawNum(String num) {
    return Container(
      width: 43.r,height: 43.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(22.r),),
      child: Text(num, style: TextStyle(fontSize: 16.sp,color: ColorX.color_091722,fontWeight: FontWeight.w600),),
    );
  }

  Widget buildDrawMark(String mark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(mark,style: TextStyle(fontSize: 18.sp,color: Colors.white, fontWeight: FontWeight.w500),),
    );
  }

  Widget buildDrawResult(String result) {
    var color = DataUtils.getResultDrawble(int.tryParse(result) ?? 0);
    return Container(
      width: 43.r,height: 43.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color,width: 2.w),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Text(result, style: TextStyle(fontSize: 14.sp,color: color,fontWeight: FontWeight.w600),),
    );
  }


}




