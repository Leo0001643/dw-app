import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';

import 'ds_dew_logic.dart';

///单双露珠
class DsDewPage extends StatefulWidget {
  const DsDewPage({Key? key}) : super(key: key);

  @override
  State<DsDewPage> createState() => _DsDewPageState();
}

class _DsDewPageState extends State<DsDewPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<DsDewLogic>();
  final state = Get.find<DsDewLogic>().state;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // Get.delete<DsDewLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.color_f7f8fb,
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          LCTabBar(
            length: 4,
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
            tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),).toList(),
          ),
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intr().dalu,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    buildDrawText(Intr().bet_dan, ColorX.color_fc243b,20.r,12.sp),
                    SizedBox(width: 5.w,),
                    Text("232",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                    SizedBox(width: 10.w,),
                    buildDrawText(Intr().bet_shuang, ColorX.color_5583e7,20.r,12.sp),
                    SizedBox(width: 5.w,),
                    Text("232",style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 110.h,
            child: Obx(() {
              if(isEmpty(state.bigRoads.value)){ return Container(); }
              return DataTable2(
                columnSpacing: 0,
                horizontalMargin: 0,
                fixedLeftColumns: 0,
                fixedTopRows: 0,
                dataRowHeight: 18.h,
                headingRowHeight: 18.h,
                dividerThickness: 0,
                border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                headingRowColor: MaterialStateProperty.all(Colors.white),
                dataRowColor: MaterialStateProperty.all(Colors.white),
                minWidth: 100.w + (state.bigRoads.value.length -1) * 40.w,
                columns: buildBigTitle(),
                rows: List<DataRow>.generate(5, (index)=> DataRow(cells: buildBigCell(index))),
              );
            }),
          ),
          Container(height: 30.h,color: Colors.white,),
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intr().zhupanlu,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
              ],
            ),
          ),
          SizedBox(
            height: 110.h,
            child: Obx(() {
              if(isEmpty(state.beadRoads.value)){ return Container(); }
              return DataTable2(
                columnSpacing: 0,
                horizontalMargin: 0,
                fixedLeftColumns: 0,
                fixedTopRows: 0,
                dataRowHeight: 18.h,
                headingRowHeight: 18.h,
                dividerThickness: 0,
                border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                headingRowColor: MaterialStateProperty.all(Colors.white),
                dataRowColor: MaterialStateProperty.all(Colors.white),
                minWidth: 100.w + (state.beadRoads.value.length -1) * 20.w,
                columns: buildBeadTitle(),
                rows: List<DataRow>.generate(5, (index)=> DataRow(cells: buildBeadCell(index))),
              );
            }),
          ),
          Expanded(
            child: Container(color: Colors.white,),
          ),
        ],
      ),
    );
  }

  List<DataColumn2> buildBigTitle() {
    var columns = List<DataColumn2>.empty(growable: true);
    state.bigRoads.value.forEach((element) {
      var index = state.bigRoads.value.indexOf(element);
      columns.add(DataColumn2(
        numeric: true,
        label: buildBigItem(ColorX.color_fc243b),
        fixedWidth: 18.w,
      ));
    });
    return columns;
  }

  List<DataCell> buildBigCell(int index) {
    var cells = List<DataCell>.empty(growable: true);
    state.bigRoads.value.forEach((element) {
      var i = state.bigRoads.value.indexOf(element);
      var text = i == 0 ? "23445673":element;
      cells.add(DataCell(
        buildBigItem(ColorX.color_5583e7),
      ));
    });
    return cells;
  }

  List<DataColumn2> buildBeadTitle() {
    var columns = List<DataColumn2>.empty(growable: true);
    state.bigRoads.value.forEach((element) {
      var index = state.bigRoads.value.indexOf(element);
      columns.add(DataColumn2(
        numeric: true,
        label: buildDrawText("双",ColorX.color_fc243b,14.r,8.sp),
        fixedWidth: 18.w,
      ));
    });
    return columns;
  }

  List<DataCell> buildBeadCell(int index) {
    var cells = List<DataCell>.empty(growable: true);
    state.bigRoads.value.forEach((element) {
      var i = state.bigRoads.value.indexOf(element);
      var text = i == 0 ? "23445673":element;
      cells.add(DataCell(
        buildDrawText("单",ColorX.color_5583e7,14.r,8.sp),
      ));
    });
    return cells;
  }

  Widget buildBigItem(Color color) {
    return Padding(
      padding: EdgeInsets.all(1.r),
      child: Container(
        width: 14.r,
        height: 14.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color,width: 2.r),
        ),
      ),
    );
  }


  Widget buildDrawText(String num,Color bg,double size,double tsize) {
    return Container(
      width: size,height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: bg,borderRadius: BorderRadius.circular(15.r),),
      child: Text(num, style: TextStyle(fontSize: tsize,color: Colors.white,fontWeight: FontWeight.w600),),
    );
  }


}