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
              tabBarHeight: 40.h,
              width: 1.sw,
              tabBarColor: ColorX.cardBg(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor:  ColorX.text0917(),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.text0917(),
              ),
              indicatorWeight: 2.h,
              indicatorPadding: EdgeInsets.only(top:35.w,left: 40.w,right: 40.w),
              labelColor: ColorX.text0917(),
              unselectedLabelColor: ColorX.text586(),
              tabs: state.tabs.map((e) => Expanded(child: Container(child: Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),))).toList(),
            ),
            Divider(height: 1.h,color: ColorX.color_10_949,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              color: ColorX.cardBg(),
              child: GetBuilder<RoomTendencyController>(
                id: RoomTendencyController.room_tendency_id,
                builder: (ctl){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Intr().lx_tongji([ctl.getTitle(state.tabIndex)]),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
                      Text(Intr().xianshiqishu_(["${ctl.data?.list.em()}"]),style: TextStyle(fontSize: 13.sp,color: ColorX.text0917()),),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 90.h,
              child: GetBuilder<RoomTendencyController>(
                id: RoomTendencyController.room_tendency_id,
                builder: (ctl){
                  if(isEmpty(ctl.getNumberCount(state.tabIndex))){ return Container(); }
                  var list = ctl.getNumberCount(state.tabIndex)!;
                  var clm1 = List<String>.empty(growable: true);
                  var clm2 = List<String>.empty(growable: true);
                  var clm3 = List<String>.empty(growable: true);
                  clm1.add(Intr().tema);
                  clm2.add(Intr().geshangqi);
                  clm3.add(Intr().jinrikai);
                  list.forEach((element) {
                    if(element.length >= 3 ){
                     clm1.add(element[0].toString());
                     clm2.add(element[1].toString());
                     clm3.add(element[2].toString());
                    }
                  });
                  return DataTable2(
                    columnSpacing: 0,
                    horizontalMargin: 0,
                    fixedLeftColumns: 1,
                    fixedTopRows: 0,
                    dataRowHeight: 30.h,
                    headingRowHeight: 30.h,
                    dividerThickness: 0,
                    border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                    headingRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                    dataRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                    minWidth: clm1.length * 40.w + 1000.w,
                    columns: buildTotalTitle(clm1),
                    rows: [
                      DataRow(cells: buildTotalCell(clm2)),
                      DataRow(cells: buildTotalCell(clm3)),
                    ],
                  );
                },
              ),
            ),
            Container(height: 10.h,color: ColorX.pageBg2(),),
            Expanded(
              child: GetBuilder<RoomTendencyController>(
                id: RoomTendencyController.room_tendency_id,
                builder: (ctl){
                  if(isEmpty(ctl.data?.list)){ return Container(); }
                  var list = ctl.data!.list!;
                  var titles = logic.buildFormTitle(ctl.data!);
                  var minWidth = titles.length * 50.w + 100.w;
                  var items = logic.buildFormData(ctl.data!,list,state.tabIndex);
                  return DataTable2(
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      minWidth: minWidth,
                      dividerThickness: 0,
                      headingRowColor: MaterialStateProperty.all(ColorX.color_10_949),
                      dataRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                      fixedLeftColumns: 1,
                      dataRowHeight: 30.h,
                      headingRowHeight: 30.h,
                      fixedTopRows: 0,
                      border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                      columns: buildFormTitle(titles),
                      rows: List<DataRow>.generate(items.length,
                              (index) => DataRow(cells: buildFormCell(index,items[index]),)).reversed.toList()
                  );
                },
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