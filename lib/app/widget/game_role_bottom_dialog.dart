
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/network/http_service.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/main/home/room_list/room_list_logic.dart';

class GameRoleBottomDialog extends StatefulWidget{

  final int tabIndex;
  final RoomListLogic logic;

  GameRoleBottomDialog(this.tabIndex,this.logic, {super.key});

  @override
  State<StatefulWidget> createState() =>StateGameRoleBottomDialog();

}

class StateGameRoleBottomDialog extends State<GameRoleBottomDialog> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  InAppWebViewController? controller;


  var progress = 0.0.obs;
  var progressVisible= true.obs;//显示隐藏

  var tabs = [Intr().wanfaguizhe,Intr().youxishuyu,Intr().xiazhujiqiao,];

  @override
  void initState() {
    _tabController = TabController(initialIndex: widget.tabIndex,length: tabs.length, vsync: this)
    ..addListener(() {
      loadData(_tabController.index);
    });
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
        color: ColorX.pageBg(),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Stack(
            children: [
              Center(
                child: LCTabBar(
                  length: 3,
                  controller: _tabController,
                  tabBarHeight: 35.h,
                  tabBarColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(top: 28.h,left: 20.w,right: 20.w,bottom: 3.r),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.r),
                    color: ColorX.text0917(),
                  ),
                  labelColor: ColorX.text0917(),
                  unselectedLabelColor: ColorX.text586(),
                  width: 280.w,
                  tabs: tabs.map((e) => Text(e, style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w600))).toList(),
                ),
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
            child: Column(
              children: [
                Obx(() => Visibility(
                    visible: progressVisible.value,
                    child: LinearProgressIndicator(
                      value: progress.value/100,//取值为0-1
                      minHeight: 3,
                      valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: InAppWebView(
                    initialOptions: InAppWebViewGroupOptions(
                      android: AndroidInAppWebViewOptions(
                        loadWithOverviewMode: false,
                        overScrollMode: AndroidOverScrollMode.OVER_SCROLL_NEVER,
                        displayZoomControls: false,
                        builtInZoomControls: false,
                        useWideViewPort: false,
                      ),
                      ios: IOSInAppWebViewOptions(
                        disallowOverScroll: true,
                        enableViewportScale: true,
                        ignoresViewportScaleLimits: true,
                      ),
                    ),
                    onWebViewCreated: (ct){
                      controller = ct;
                      loadData(widget.tabIndex);
                    },
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

  void loadData(int i) {
    var tag = widget.logic.state.room.value.gameType.em();
    switch(i){
      case 0:
        break;
      case 1:
        tag = "sy_$tag";
        break;
      case 2:
        tag = "jq_$tag";
        break;
    }
    HttpService.getGameRole(tag).then((value) {
      controller?.loadData(data: value.content.em());
    });
  }


}


