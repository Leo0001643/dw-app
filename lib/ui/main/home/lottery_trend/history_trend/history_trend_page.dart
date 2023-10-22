import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'history_trend_logic.dart';

///历史走势
class HistoryTrendPage extends StatefulWidget {
  const HistoryTrendPage({Key? key}) : super(key: key);

  @override
  State<HistoryTrendPage> createState() => _HistoryTrendPageState();
}

class _HistoryTrendPageState extends State<HistoryTrendPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<HistoryTrendLogic>();
  final state = Get.find<HistoryTrendLogic>().state;
  late TabController _tabController;


  @override
  void initState() {
    state.formTitle.value.addAll(['期号','值','小','大','单','双','极小','极大']);
    for(var i=0;i<10;i++){
      state.formTitle.value.add('$i');
    }
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    Get.delete<HistoryTrendLogic>();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRxAppBar(state.title,msg: true,),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GFTabBar(
            length: 4,
            controller: _tabController,
            tabBarHeight: 40.h,
            tabBarColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(top: 33.h,left: 10.w,right: 10.w,bottom: 3.h),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: ColorX.color_091722,
            ),
            labelColor: ColorX.color_091722,
            unselectedLabelColor: ColorX.color_58698d,
            width: 300.w,
            tabs: [
              Text("特码",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
              Text("第一球",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
              Text("第二球",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
              Text("第三球",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),
            ],
          ),
          Divider(height: 1.h,color: ColorX.color_10_fc2,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("特码 统计",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
                Text("显示期数：50",style: TextStyle(fontSize: 14.sp,color: ColorX.color_091722),),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              var minWidth = (state.formTitle.value.length - 1) * 50.w + 100.w;
              return DataTable2(
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  minWidth: minWidth,
                  headingRowColor: MaterialStateProperty.all(ColorX.color_f7f8fb),
                  fixedLeftColumns: 1,
                  dataRowHeight: 30.h,
                  headingRowHeight: 30.h,
                  fixedTopRows: 0,
                  border: TableBorder(
                      verticalInside: BorderSide(color: ColorX.color_10_949,width: 1.r),
                      horizontalInside: BorderSide(color: ColorX.color_10_949,width: 1.r),
                  ),
                  columns: buildFormTitle(),
                  rows: List<DataRow>.generate(
                      100,
                          (index) => DataRow(cells: buildFormCell(index)))
              );
            }),
          ),
        ],
      ),
    );
  }

  List<DataColumn2> buildFormTitle() {
    var columns = List<DataColumn2>.empty(growable: true);
    state.formTitle.value.forEach((element) {
      var index = state.formTitle.value.indexOf(element);
      columns.add(DataColumn2(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(element,textAlign: TextAlign.center,),
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
      var color = i > 1 ? (text == "单" || text == "大" || text == "极大" ? ColorX.color_529aff:ColorX.color_e75555):ColorX.color_091722;
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