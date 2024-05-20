
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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

  var htmlContent = "".obs;
  var tabs = [Intr().wanfaguizhe,Intr().youxishuyu,Intr().xiazhujiqiao,];

  @override
  void initState() {
    _tabController = TabController(initialIndex: widget.tabIndex,length: tabs.length, vsync: this)
    ..addListener(() {
      loadData(_tabController.index);
    });
    loadData(widget.tabIndex);
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
      height: 0.7.sh,
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
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() {
                return HtmlWidget(
                  htmlContent.value,
                  textStyle: TextStyle(color: ColorX.color_333333),
                  customStylesBuilder: (element){
                    // loggerArray(['打印看一下构建参数',element.localName,element.styles.map((e) => "${e.property}=${e.value?.toString()}").toList()]);
                    switch (element.localName) {
                    // case "table":
                    //   return {'width': '100%'};
                      case "td":
                        return {'border': '1pt solid windowtext;'};
                    // case "p":
                    //   return {};
                    }
                    return null;
                  },
                );
                // return Html(data: htmlContent.value,shrinkWrap: true,);
              }),
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
      htmlContent.value = value.content.em();
    });
  }


}


