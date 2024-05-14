import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/controller/room_tendency_controller.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_segment_tabs.dart';
import 'package:leisure_games/ui/main/home/game_room/room_tendency/number_trend/number_trend_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    _tabController.addListener(() {
      state.tabIndex = _tabController.index;
      Get.find<RoomTendencyController>().updateTabIndex();
    });
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
          LCSegmentTabs(
            length: state.tabs.length,
            tabController: _tabController,
            height: 40.h,
            width: 1.sw,
            tabBarColor: ColorX.cardBg(),
            border: Border.all(color: Colors.transparent),
            borderRadius:  BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.only(top: 32.h,left: 40.w,right: 40.w,bottom: 2.h),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              color: ColorX.text0917(),
            ),
            labelPadding: EdgeInsets.zero,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),),
            labelColor: ColorX.text0917(),
            unselectedLabelColor: ColorX.text586(),
            // width: 300.w,
            tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),)).toList(),
          ),
          Expanded(
            child: GetBuilder<RoomTendencyController>(
              id: RoomTendencyController.room_tendency_id,
              builder: (ctl){
                var data = ctl.getNumberTrend(state.tabIndex);
                var maximum = state.tabIndex == 0 ? 27.0:9.0;
                return SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelRotation: 90,
                      labelAlignment: LabelAlignment.center,
                      minimum: 0,//设置最小值
                      interval: 1,//设置步长
                      initialVisibleMinimum: data.length.toDouble()/4,//设置可见数量 数量50的时候 50/4合适
                      axisLine: AxisLine(color: ColorX.color_10_949,width: 1.w),
                      labelStyle: TextStyle(fontSize: 10.sp,color: ColorX.text5862()),
                      majorTickLines: MajorTickLines(size: 0,width: 1.w,color: ColorX.color_10_949),
                      // minorTickLines: const MinorTickLines(),
                      majorGridLines: MajorGridLines(width: 1.w,color: ColorX.color_10_949),
                      // minorGridLines: MinorGridLines(width: 1.w,color: ColorX.color_10_949),
                    ),
                    primaryYAxis: NumericAxis(
                      axisLine: AxisLine(color: ColorX.color_10_949,width: 1.w),
                      labelFormat: Intr().hao_value,
                      labelAlignment: LabelAlignment.center,
                      rangePadding: ChartRangePadding.none,
                      labelStyle: TextStyle(fontSize: 10.sp,color: ColorX.text5862()),
                      minimum: 0,//设置最小值
                      interval: 1,//设置步长
                      maximum: maximum,//设置最大值
                      anchorRangeToVisiblePoints: false,
                      majorTickLines: const MajorTickLines(size: 0),
                      minorTickLines: const MinorTickLines(size: 0),
                    ),
                    backgroundColor: ColorX.cardBg(),
                    zoomPanBehavior: zoomPanBehavior,
                    tooltipBehavior: TooltipBehavior(enable: false),
                    series: <CartesianSeries<NumberData, String>>[
                      AreaSeries<NumberData, String>(
                        dataSource: data,
                        xValueMapper: (NumberData sales, _) => sales.term,
                        yValueMapper: (NumberData sales, _) => sales.value,
                        color: ColorX.color_40_558,
                        name: 'AreaSeries',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            margin: EdgeInsets.all(3.r),
                            labelAlignment: ChartDataLabelAlignment.middle,
                            builder: (data,point,series,pointIndex,seriesIndex){
                              return Text((data as NumberData).value.toString(),style: TextStyle(fontSize: 12.sp,color: ColorX.text0917()),);
                            }
                        ),
                      ),
                    ]);
              },
            ),
          ),
          GetBuilder<RoomTendencyController>(
              id: RoomTendencyController.room_tendency_id,
              builder: (ctl){
                var height = state.tabIndex == 0 ? 0.0 : 300.h;
                return Container(
                  height: height,
                );
              }),
        ],
      ),
    );
  }




}