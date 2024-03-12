
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/btc_source_entity.dart';

class UnbrokenNumberBtnDialog extends StatefulWidget{

  final BtcSourceEntity item;
  const UnbrokenNumberBtnDialog(this.item, {super.key});

  @override
  State<StatefulWidget> createState() =>StateUnbrokenNumberBtnDialog();

}

class StateUnbrokenNumberBtnDialog extends State<UnbrokenNumberBtnDialog>{

  var current = 0.obs;

  @override
  Widget build(BuildContext context) {

    var num1 = "";
    var num2 = "";
    var num3 = "";
    var list = widget.item.btcHash.em().split(",");
    for(var i=0;i<list.em();i++){
      switch(i){
        case 0:
          num1 = list[i];
          break;
        case 1:
          num2 = list[i];
          break;
        case 2:
          num3 = list[i];
          break;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w,top: 15.h),
                    child: Text(Intr().cancel,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: ColorX.text586()),),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(Intr().wanzhenghaoyuanzhanshi,style: TextStyle(fontSize: 16.sp,color: ColorX.text0917(),fontWeight: FontWeight.w600),),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(right: 15.w),
                  child: WidgetUtils().buildElevatedButton(Intr().jiaoyan, 50.w, 26.h,textSize: 12.sp, bg:ColorX.color_fc243b,onPressed: (){
                    Navigator.pop(context,num1+num2+num3);
                  }),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Intr().qihao_(["${widget.item.term.em()}"]),style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),height: 1.5)),
                Text(Intr().zhuaqushijian([DateUtil.formatDateMs(widget.item.openTime.em())]),style: TextStyle(fontSize: 12.sp,color: ColorX.text586(),height: 1.5)),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          buildNumberItem("1",num1),
          buildNumberItem("2",num2),
          buildNumberItem("3",num3),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(Intr().shuominghaoyuan,style: TextStyle(fontSize: 14.sp,color: ColorX.text586()),),
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }

  Widget buildNumberItem(String num,String code) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${num}.",style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
          Expanded(
            child: InkWell(
              onTap: (){
                WidgetUtils().clickCopy(code);
              },
              child: Text(code,
                style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7,fontWeight: FontWeight.w600,),),
            ),
          ),
        ],
      ),
    );
  }


}


