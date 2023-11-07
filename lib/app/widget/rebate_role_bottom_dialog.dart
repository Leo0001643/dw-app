
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/constants.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

///返水说明
class RebateRoleBottomDialog extends StatefulWidget{

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
                child: Text("返水说明",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: ColorX.textBlack()),),
              ),
              InkWell(
                onTap: ()=> Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: SizedBox(
                    height: 35.h,width: 35.w,
                    child: Image.asset(ImageX.icon_down_arrow,color: ColorX.icon586(),),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.6.sh,
            child: Column(
              children: [
                Obx(() => Visibility(
                    child: LinearProgressIndicator(
                      value: progress.value/100,//取值为0-1
                      minHeight: 3,
                      valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                      backgroundColor: Colors.white,
                    ),
                    visible: progressVisible.value,
                  ),
                ),
                Expanded(
                  child: InAppWebView(
                    // initialUrlRequest: URLRequest(url: Uri.tryParse('https://juejin.cn/user/1865248698012616')),
                    initialData: InAppWebViewInitialData(data: Constants.test_role,),
                    onProgressChanged: (controller,pg){
                      progress.value = pg.toDouble();
                      progressVisible.value = pg != 100;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}


