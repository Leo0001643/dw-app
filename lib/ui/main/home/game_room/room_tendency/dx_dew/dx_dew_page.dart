import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/logger.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';

import 'dx_dew_logic.dart';

///大小露珠
class DxDewPage extends StatefulWidget {
  const DxDewPage({Key? key}) : super(key: key);

  @override
  State<DxDewPage> createState() => _DxDewPageState();
}

class _DxDewPageState extends State<DxDewPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  final logic = Get.find<DxDewLogic>();
  final state = Get.find<DxDewLogic>().state;
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
    state.horizontalScrollController = ScrollController();
    Future.delayed(const Duration(milliseconds: 100),(){
      if (state.horizontalScrollController?.hasClients == true) {
        state.horizontalScrollController!.jumpTo(state.horizontalScrollController!.position.maxScrollExtent);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    state.horizontalScrollController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.pageBg2(),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          LCTabBar(
            length: state.tabs.length,
            controller: _tabController,
            tabBarHeight: 40.h,
            tabBarColor: ColorX.cardBg(),
            width: 1.sw,
            tabAlignment:TabAlignment.fill,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(top: 34.h,left: 40.w,right: 40.w,bottom: 3.h),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: ColorX.text0917(),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),).toList(),
          ),
          GetBuilder<RoomTendencyController>(
            id: RoomTendencyController.room_tendency_id,
            builder: (ctl){
              if(isEmpty(ctl.getDxDsCount(state.tabIndex)) || ctl.getDxDsCount(state.tabIndex)!.length < 2){ return Container(); }
              var count = ctl.getDxDsCount(state.tabIndex)!;
              return Container(
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: ColorX.cardBg(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Intr().dalu,style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        buildDrawText(Intr().bet_da, ColorX.color_fc243b,20.r,12.sp),
                        SizedBox(width: 5.w,),
                        Text("${count[0]}",style: TextStyle(fontSize: 14.sp,color: ColorX.color_fc243b),),
                        SizedBox(width: 10.w,),
                        buildDrawText(Intr().bet_xiao, ColorX.color_5583e7,20.r,12.sp),
                        SizedBox(width: 5.w,),
                        Text("${count[1]}",style: TextStyle(fontSize: 14.sp,color: ColorX.color_5583e7),),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 150.h,
            child: GetBuilder<RoomTendencyController>(
              id: RoomTendencyController.room_tendency_id,
              builder: (ctl){
                if(isEmpty(ctl.data?.list)){ return Container(); }
                var list = ctl.changeDxTab(state.tabIndex);
                loggerArray(["内部数据",jsonEncode(list)]);
                var titleRow = list.first;
                var childsRow = list.sublist(1,list.length);
                return DataTable2(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  fixedLeftColumns: 0,
                  fixedTopRows: 0,
                  dataRowHeight: 25.h,
                  headingRowHeight: 25.h,
                  dividerThickness: 0,
                  horizontalScrollController: state.horizontalScrollController,
                  border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                  headingRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                  dataRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                  minWidth: titleRow.length * 30.w,
                  columns: buildBigTitle(titleRow),
                  rows: List<DataRow>.generate(childsRow.length,
                          (index)=> DataRow(cells: buildBigCell(index,childsRow[index]))),
                );
              },
            ),
          ),
          Container(height: 30.h,color: ColorX.cardBg(),),
          Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: ColorX.cardBg(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intr().zhupanlu,style: TextStyle(fontSize: 14.sp,color: ColorX.text0917()),),
              ],
            ),
          ),
          SizedBox(
            height: 110.h,
            child: GetBuilder<RoomTendencyController>(
              id: RoomTendencyController.room_tendency_id,
              builder: (ctl){
                if(isEmpty(ctl.data?.list)){ return Container(); }
                var list = ctl.changeZpTab(state.tabIndex);
                loggerArray(["内部数据",jsonEncode(list)]);
                var titleRow = list.first;
                var childsRow = list.sublist(1,list.length);
                return DataTable2(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  fixedLeftColumns: 0,
                  fixedTopRows: 0,
                  dataRowHeight: 18.h,
                  headingRowHeight: 18.h,
                  dividerThickness: 0,
                  border: TableBorder.all(color: ColorX.color_10_949,width: 1.r),
                  headingRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                  dataRowColor: MaterialStateProperty.all(ColorX.cardBg()),
                  minWidth: titleRow.length * 20.w,
                  columns: buildBeadTitle(titleRow),
                  rows: List<DataRow>.generate(childsRow.length,
                          (index)=> DataRow(cells: buildBeadCell(index,childsRow[index]))),
                );
              },
            ),
          ),
          Expanded(
            child: Container(color: ColorX.pageBg(),),
          ),
        ],
      ),
    );
  }

  List<DataColumn2> buildBigTitle(List<String> childs) {
    var columns = List<DataColumn2>.empty(growable: true);
    childs.forEach((element) {
      // var index = state.bigRoads.value.indexOf(element);
      if(isEmpty(element)){
        columns.add(DataColumn2(label: Container()));
      }else {
        columns.add(DataColumn2(
          numeric: true,
          label: buildBigItem(element == "1" ? ColorX.color_fc243b:ColorX.color_5583e7),
          fixedWidth: 30.w,
        ));
      }
    });
    return columns;
  }

  List<DataCell> buildBigCell(int index,List<String> childs) {
    var cells = List<DataCell>.empty(growable: true);
    childs.forEach((element) {
      if(isEmpty(element)){
        cells.add(DataCell(Container()));
      } else {
        cells.add(DataCell(
          buildBigItem(element == "1" ? ColorX.color_fc243b:ColorX.color_5583e7),
        ));
      }
    });
    return cells;
  }

  List<DataColumn2> buildBeadTitle(List<String> childs) {
    var columns = List<DataColumn2>.empty(growable: true);
    childs.forEach((element) {
      // var index = state.bigRoads.value.indexOf(element);
      if(isEmpty(element) || element == "-1"){
        columns.add(DataColumn2(
          numeric: true,
          label: Container(),
          fixedWidth: 18.w,
        ));
      } else {
        columns.add(DataColumn2(
          numeric: true,
          label: buildDrawText(element == "1"? Intr().bet_xiao:Intr().bet_da,
              element == "1" ? ColorX.color_5583e7:ColorX.color_fc243b,14.r,8.sp),
          fixedWidth: 18.w,
        ));
      }
    });
    return columns;
  }

  List<DataCell> buildBeadCell(int index,List<String> childs) {
    var cells = List<DataCell>.empty(growable: true);
    childs.forEach((element) {
      // var i = state.bigRoads.value.indexOf(element);
      // var text = i == 0 ? "23445673":element;
      if(isEmpty(element) || element == "-1"){
        cells.add(DataCell(Container(),));
      } else {
        cells.add(DataCell(
          buildDrawText(element == "1"? Intr().bet_xiao:Intr().bet_da,
              element == "1" ? ColorX.color_5583e7:ColorX.color_fc243b,14.r,8.sp),
        ));
      }
    });
    return cells;
  }

  Widget buildBigItem(Color color) {
    return Padding(
      padding: EdgeInsets.all(1.r),
      child: Container(
        width: 28.r,
        height: 28.r,
        alignment: Alignment.center,
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