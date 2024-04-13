
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/ui/bean/back_water_desc_entity.dart';

///返水说明
class RebateRoleBottomDialog extends StatefulWidget{

  final BackWaterDescEntity desc;

  const RebateRoleBottomDialog(this.desc,{super.key});

  @override
  State<StatefulWidget> createState() =>StateRebateRoleBottomDialog();

}

class StateRebateRoleBottomDialog extends State<RebateRoleBottomDialog>{

  var progress = 0.0.obs;
  var progressVisible= true.obs;//显示隐藏


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorX.cardBg5(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Stack(
            children: [
              Center(
                child: Text(widget.desc.name.em()
                  ,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: ColorX.textBlack()),),
              ),
              InkWell(
                onTap: ()=> Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: WidgetUtils().buildImage(ImageX.iconDownArrow(), 24.r, 24.r),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.6.sh,
            child: SingleChildScrollView(
              child: Html(data: widget.desc.content.em(),),
            ),
          ),
        ],
      ),
    );
  }


}


