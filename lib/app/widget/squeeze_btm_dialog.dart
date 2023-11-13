
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/main/home/game_room/game_room_logic.dart';
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

    var icon = AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 750),
      child: Container(
        width: 287.w,
        height: 137.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDrawNum("8"),
            buildDrawMark("+"),
            buildDrawNum("10"),
            buildDrawMark("+"),
            buildDrawNum("15"),
            buildDrawMark("="),
            buildDrawResult("33"),
          ],
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(ImageX.mipaibg),fit: BoxFit.fill),
      ),
      height: 0.77.sh,
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w,top: 15.h),
            child: InkWell(
              onTap: ()=> Navigator.of(context).pop(),
              child: Image.asset(ImageX.icon_down_arrow,color: Colors.white,),
            ),
          ),
          SizedBox(height: 15.h,),
          Center(child: Image.asset(ImageX.titlegjP()),),
          Stack(
            children: [
              Center(child: Image.asset(ImageX.guajiabg,width: 362.w,height: 347.h,fit: BoxFit.fill,),),
              Positioned(
                top: 14.h, left: 0,right: 2.w,
                child: Column(
                  children: [
                    Text(Intr().dixqi([" 1231312 "]),style: TextStyle(fontSize: 18.sp,color: ColorX.color_fdf7e0,fontWeight: FontWeight.w600,),),
                    SizedBox(height: 38.h,),
                    Center(
                      child:Container(
                        width: 287.w,
                        height: 137.h,
                        child: Scratcher(
                          accuracy: ScratchAccuracy.low,
                          color: Colors.transparent,
                          image: Image.asset(ImageX.guaguaMask1P(),fit: BoxFit.fill,),
                          brushSize: 20.r,
                          threshold: 50,
                          onThreshold: () {
                            setState(() {
                              opacity = 1;
                              isScratched = true;
                            });
                            showToast("刮开了呀");
                          },
                          child: Container(child: icon,),
                        ),
                      ),
                    ),
                    SizedBox(height: 23.h,),
                    SizedBox(
                      width: 270.w,
                      child: Row(
                        children:[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Intr().dixqitouzhu(["06161240","00:43"]),style: TextStyle(fontSize: 14.sp,color: ColorX.color_fdf7e0),),
                                SizedBox(height: 3.h,),
                                Text(Intr().dixqikaijiang(["06161240","9s"]),style: TextStyle(fontSize: 14.sp,color: ColorX.color_fdf7e0),),
                              ],
                            ),
                          ),
                          WidgetUtils().buildElevatedButton(Intr().shuaxin, 59.w, 40.h,bg: ColorX.color_50_c13,textColor: ColorX.color_ffe0ac, onPressed: (){

                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
    var color = ColorX.color_fc243b;
    switch(widget.logic.state.roomType.value){
      case 1:
        color = ColorX.color_fc243b;
        break;
      case 2:
        color = ColorX.color_70b6ff;
        break;
      case 3:
        color = ColorX.color_ffe0ac;
        break;
    }
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




