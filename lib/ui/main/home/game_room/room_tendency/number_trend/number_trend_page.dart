import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/number_trend/number_trend_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'number_trend_logic.dart';

///号码走势
class NumberTrendPage extends StatefulWidget {
  const NumberTrendPage({Key? key}) : super(key: key);

  @override
  State<NumberTrendPage> createState() => _NumberTrendPageState();
}

class _NumberTrendPageState extends State<NumberTrendPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<NumberTrendLogic>();
  final state = Get.find<NumberTrendLogic>().state;
  late TabController _tabController;
  //enablePinching: true, zoomMode: ZoomMode.x,
  var zoomPanBehavior = ZoomPanBehavior(zoomMode: ZoomMode.x, enablePanning: true,);

  @override
  void initState() {
    _tabController = TabController(length: state.tabs.length, vsync: this);
    super.initState();
  }


  @override
  void dispose() {
    _tabController.dispose();
    // Get.delete<NumberTrendLogic>();
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
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(top: 34.h,left: 40.w,right: 40.w,bottom: 3.h),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: ColorX.text0917(),
            ),
            labelPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            // width: 300.w,
            tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),)).toList(),
          ),
          Expanded(
            child: Obx(() {
              return SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    labelRotation: 90,
                    labelAlignment: LabelAlignment.center,
                    minimum: 0,//设置最小值
                    interval: 1,//设置步长
                    visibleMaximum: state.data.length.toDouble()/4,//设置可见数量 数量50的时候 50/4合适
                    axisLine: AxisLine(color: ColorX.color_10_949,width: 1.w),
                    labelStyle: TextStyle(fontSize: 10.sp,color: ColorX.text5862()),
                    majorTickLines: MajorTickLines(size: 0),
                    minorTickLines: MinorTickLines(size: 0),
                    majorGridLines: MajorGridLines(width: 1.w,color: ColorX.color_10_949),
                    minorGridLines: MinorGridLines(width: 1.w,color: ColorX.color_10_949),
                  ),
                  primaryYAxis: NumericAxis(
                    axisLine: AxisLine(color: ColorX.color_10_949,width: 1.w),
                    labelFormat: Intr().hao_value,
                    labelAlignment: LabelAlignment.center,
                    labelStyle: TextStyle(fontSize: 10.sp,color: ColorX.text5862()),
                    minimum: 1,//设置最小值
                    interval: 1,//设置步长
                    anchorRangeToVisiblePoints: false,
                    majorTickLines: MajorTickLines(size: 0),
                    minorTickLines: MinorTickLines(size: 0),
                  ),
                  backgroundColor: ColorX.cardBg(),
                  // Chart title
                  // title: ChartTitle(text: 'Half yearly sales analysis'),
                  // Enable legend
                  // legend: Legend(isVisible: false),
                  // Enable tooltip
                  zoomPanBehavior: zoomPanBehavior,
                  tooltipBehavior: TooltipBehavior(enable: false),
                  series: <ChartSeries<SalesData, String>>[
                    AreaSeries<SalesData, String>(
                        dataSource: state.data.value,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        color: ColorX.color_40_558,
                        name: 'AreaSeries',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            margin: EdgeInsets.all(3.r),
                            labelAlignment: ChartDataLabelAlignment.middle,
                            builder: (data,point,series,pointIndex,seriesIndex){
                              return Text((data as SalesData).sales.toString(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                            }
                        ))
                  ]);
            }),
          )
        ],
      ),
    );
  }




}