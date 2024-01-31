import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';

import 'data_analysis_logic.dart';

///数据分析
class DataAnalysisPage extends StatefulWidget {
  const DataAnalysisPage({Key? key}) : super(key: key);

  @override
  State<DataAnalysisPage> createState() => _DataAnalysisPageState();
}

class _DataAnalysisPageState extends State<DataAnalysisPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  final logic = Get.find<DataAnalysisLogic>();
  final state = Get.find<DataAnalysisLogic>().state;
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    _tabController = TabController(length: state.tabs.length, vsync: this);
    _tabController.addListener(() {
      state.tabIndex = _tabController.index;
      Get.find<RoomTendencyController>().updateTabIndex();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // Get.delete<DataAnalysisLogic>();
    super.dispose();
  }
//RoundedRectangleBorder()

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorX.pageBg2(),
        child: Column(
          children: [
            Container(height: 10.h,color: ColorX.pageBg2(),),
            LCTabBar(
              tabAlignment:TabAlignment.fill,
              length: state.tabs.length,
              controller: _tabController,
              tabBarHeight:40.w,
              tabBarColor: ColorX.cardBg(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor:  ColorX.text0917(),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.text0917(),
              ),
              indicatorWeight: 2,
              indicatorPadding: EdgeInsets.only(top:35.w,left: 40.w,right: 40.w),
              unselectedLabelColor: ColorX.color_58698D,
              labelColor: ColorX.color_091722,
              width: 1.sw,
              tabs: state.tabs.map((e) => Expanded(child: Container(child: Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),))).toList(),
            ),
            Divider(height: 1.h,color: ColorX.color_10_949,),

            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: state.pageController,
                children: state.pages,
              ),
            ),


          ],
        )
    );
  }

  List<DataColumn2> buildTotalTitle(List<String> list) {
    var columns = List<DataColumn2>.empty(growable: true);
    for(var i=0;i<list.length;i++){
      columns.add(DataColumn2(
        numeric: true,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(list[i],
              textAlign: TextAlign.center,
              style: TextStyle(color: i > 0 ? ColorX.text586():ColorX.text0917(),fontSize: 12.sp),
            ),
          ],
        ),
        fixedWidth: i == 0 ? 80.w : 40.w,
      ));
    }
    return columns;
  }


  List<DataCell> buildTotalCell(List<String> list) {
    var cells = List<DataCell>.empty(growable: true);
    for(var i=0;i<list.length;i++){
      cells.add(DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(list[i],style: TextStyle(color: i > 0 ? ColorX.text586():ColorX.text0917(),fontSize: 12.sp),),
          ],
        ),
      ));
    }
    return cells;
  }



  List<DataColumn2> buildFormTitle(List<String> titles) {
    var columns = List<DataColumn2>.empty(growable: true);
    for(var i=0;i<titles.length;i++){
      columns.add(DataColumn2(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(titles[i],
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorX.text0917(),fontSize: 12.sp),
              ),
            ),
          ],
        ),
        fixedWidth: i == 0 ? 80.w : 40.w,
      ));
    }
    return columns;
  }

  List<DataCell> buildFormCell(int index,List<String> item) {
    var cells = List<DataCell>.empty(growable: true);
    for(var i=0;i<item.length;i++){
      var color = i > 1 ? (item[i] == Intr().bet_dan || item[i] == Intr().bet_da || item[i] == Intr().jida
          ? ColorX.color_529aff:ColorX.color_e75555):( i == 0? ColorX.text0917(): ColorX.text586());
      if(isEmpty(item[i])){
        cells.add(DataCell(Container(
          height: 30.h,
          margin: EdgeInsets.all(5.r),
        )));
      } else {
        cells.add(DataCell(
          Container(
            height: 30.h,
            margin: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: i > 1 ? ColorX.cardBg3():null,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(item[i],style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: color),),
                  ),
                ),
              ],
            ),
          ),
        ));
      }
    }
    return cells;
  }



}