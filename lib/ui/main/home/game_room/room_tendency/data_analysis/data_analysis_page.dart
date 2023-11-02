import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

class _DataAnalysisPageState extends State<DataAnalysisPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<DataAnalysisLogic>();
  final state = Get.find<DataAnalysisLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: state.tabs.length, vsync: this);
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
        color: ColorX.color_f7f8fb,
        child: Column(
          children: [
            Container(height: 10.h,color: ColorX.color_f7f8fb,),
            LCTabBar(
              length: state.tabs.length,
              controller: _tabController,
              tabBarHeight: 40.h,
              tabBarColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(top: 34.h,left: 40.w,right: 40.w,bottom: 3.h),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: ColorX.color_091722,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),),
              labelColor: ColorX.color_091722,
              unselectedLabelColor: ColorX.color_58698d,
              // width: 300.w,
              tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),)).toList(),
            ),
            Divider(height: 1.h,color: ColorX.color_10_949,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Intr().lx_tongji(["特码"]),style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722),),
                  Text(Intr().xianshiqishu_(["50"]),style: TextStyle(fontSize: 13.sp,color: ColorX.color_091722),),
                ],
              ),
            ),
            SizedBox(
              height: 90.h,
              child: Obx(() {
                if(isEmpty(state.totalTitle.value)){ return Container(); }
                return DataTable2(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  fixedLeftColumns: 1,
                  fixedTopRows: 0,
                  dataRowHeight: 30.h,
                  headingRowHeight: 30.h,
                  dividerThickness: 0,
                  border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                  headingRowColor: MaterialStateProperty.all(Colors.white),
                  dataRowColor: MaterialStateProperty.all(Colors.white),
                  minWidth: (state.totalTitle.value.length) * 40.w + 1000.w,
                  columns: buildTotalTitle(),
                  rows: List<DataRow>.generate(2, (index)=> DataRow(cells: buildTotalCell(index))),
                );
              }),
            ),
            Container(height: 10.h,color: ColorX.color_f7f8fb,),
            Expanded(
              child: Obx(() {
                if(isEmpty(state.formTitle.value)){ return Container(); }
                var minWidth = (state.formTitle.value.length - 1) * 50.w + 100.w;
                return DataTable2(
                    columnSpacing: 0,
                    horizontalMargin: 0,
                    minWidth: minWidth,
                    dividerThickness: 0,
                    headingRowColor: MaterialStateProperty.all(ColorX.color_10_949),
                    dataRowColor: MaterialStateProperty.all(Colors.white),
                    fixedLeftColumns: 1,
                    dataRowHeight: 30.h,
                    headingRowHeight: 30.h,
                    fixedTopRows: 0,
                    border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                    columns: buildFormTitle(),
                    rows: List<DataRow>.generate(100,
                            (index) => DataRow(cells: buildFormCell(index),))
                );
              }),
            ),
          ],
        )
    );
  }

  List<DataColumn2> buildTotalTitle() {
    var columns = List<DataColumn2>.empty(growable: true);
    state.totalTitle.value.forEach((element) {
      var index = state.totalTitle.value.indexOf(element);
      columns.add(DataColumn2(
        numeric: true,
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(element,
              textAlign: TextAlign.center,
              style: TextStyle(color: index > 0 ? ColorX.color_58698d:ColorX.color_091722,fontSize: 12.sp),
            ),
          ],
        ),
        fixedWidth: index == 0 ? 80.w : 40.w,
      ));
    });
    return columns;
  }


  List<DataCell> buildTotalCell(int index) {
    var cells = List<DataCell>.empty(growable: true);
    state.totalTitle.value.forEach((element) {
      var i = state.totalTitle.value.indexOf(element);
      var text = i == 0 ? "23445673":element;
      cells.add(DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,style: TextStyle(color: i > 0 ? ColorX.color_58698d:ColorX.color_091722,fontSize: 12.sp),),
          ],
        ),
      ));
    });
    return cells;
  }



  List<DataColumn2> buildFormTitle() {
    var columns = List<DataColumn2>.empty(growable: true);
    state.formTitle.value.forEach((element) {
      var index = state.formTitle.value.indexOf(element);
      columns.add(DataColumn2(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(element,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorX.color_091722,fontSize: 12.sp),
            ),
          ],
        ),
        fixedWidth: index == 0 ? 80.w : 40.w,
      ));
    });
    return columns;
  }

  List<DataCell> buildFormCell(int index) {
    var cells = List<DataCell>.empty(growable: true);
    state.formTitle.value.forEach((element) {
      var i = state.formTitle.value.indexOf(element);
      var text = i == 0 ? "23445673":element;
      var color = i > 1 ? (text == "单" || text == "大" || text == "极大" ? ColorX.color_529aff:ColorX.color_e75555):( i == 0? ColorX.color_091722: ColorX.color_58698d);
      cells.add(DataCell(
        Container(
          height: 30.h,
          margin: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: i > 1 ? ColorX.color_f7f8fb:null,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: color),),
            ],
          ),
        ),
      ));
    });
    return cells;
  }



}