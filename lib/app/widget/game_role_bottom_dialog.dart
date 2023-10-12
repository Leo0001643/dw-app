
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

class GameRoleBottomDialog extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>StateGameRoleBottomDialog();

}

class StateGameRoleBottomDialog extends State<GameRoleBottomDialog> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  var progress = 0.0.obs;
  var progressVisible= true.obs;//显示隐藏


  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Stack(
            children: [
              Center(
                child: GFTabBar(
                  length: 3,
                  controller: _tabController,
                  tabBarHeight: 35.h,
                  tabBarColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(top: 28.h,left: 20.w,right: 20.w,bottom: 3.r),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: ColorX.color_091722,
                  ),
                  labelColor: ColorX.color_091722,
                  unselectedLabelColor: ColorX.color_58698d,
                  width: 280.w,
                  tabs: [
                    Text("玩法规则",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                    Text("游戏术语",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                    Text("下注技巧",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              InkWell(
                onTap: ()=> Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: SizedBox(
                    height: 35.h,width: 35.w,
                    child: Image.asset(ImageX.icon_down_arrow),
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


