import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/intl/intr.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/utils/data_utils.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';
import 'package:leisure_games/app/widget/line_painter.dart';

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
  final ScrollController _listViewController = ScrollController();
  final ScrollController _scrollViewController = ScrollController();
  bool _isScrolling = false;

  @override
  void initState() {
    _tabController = TabController(length: state.tabs.length, vsync: this)
    ..addListener(() {
      switch(_tabController.index){
        case 0://特码
          logic.refreshChart(0, 3, 28);
          break;
        case 1://第一球
          logic.refreshChart(1, 0, 10);
          break;
        case 2://第二球
          logic.refreshChart(2, 1, 10);
          break;
        case 3://第三球
          logic.refreshChart(3, 2, 10);
          break;
      }
    });
    _listViewController.addListener(_scrollListener);
    _scrollViewController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _listViewController.removeListener(_scrollListener);
    _scrollViewController.removeListener(_scrollListener);
    _listViewController.dispose();
    _scrollViewController.dispose();
    Get.delete<HistoryTrendLogic>();
    super.dispose();
  }

  void _scrollListener() {
    if (_isScrolling) return;

    if (_listViewController.position.activity is! IdleScrollActivity) {
      _isScrolling = true;
      _scrollViewController.position.jumpTo(_listViewController.offset);
    } else if (_scrollViewController.position.activity is! IdleScrollActivity) {
      _isScrolling = true;
      _listViewController.position.jumpTo(_scrollViewController.offset);
    }
    _isScrolling = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildRxAppBar(state.title,msg: true,),
      backgroundColor: ColorX.pageBg2(),
      body: Container(
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          color: ColorX.pageBg(),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
        ),
        child: Row(
          children: [
            Container(
              width: 86.w,
              child: Column(
                children: [
                  Container(
                    height: 76.h,
                    child: Text(Intr().qihao,style: TextStyle(fontSize: 14.sp,color: ColorX.text586(),),),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 1.h,child: Container(color: ColorX.color_10_949,),),
                  Expanded(
                    child: Obx(() {
                      if(isEmpty(state.leftData)){ return Container(); }
                      return ListView.builder(
                        controller: _listViewController,
                        itemCount: state.leftData.length,
                        itemBuilder: (context,index){
                          return Container(
                            height: 35.h,
                            alignment: Alignment.center,
                            color: index % 2 == 1 ? ColorX.color_10_949:Colors.white,
                            child: Text(state.leftData[index],style: TextStyle(fontSize: 12.sp,color: ColorX.color_3e3737,),),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(width: 1.w,child: Container(color: ColorX.color_10_949,),),
            Expanded(
              child: Column(
                children: [
                  LCTabBar(
                    length: state.tabs.length,
                    controller: _tabController,
                    tabBarHeight: 40.h,
                    tabBarColor: Colors.transparent,
                    isScrollable: false,
                    width: 288.w,
                    labelPadding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.only(top: 35.h,left: 30.w,right: 30.w,bottom: 3.h),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: ColorX.text0917(),
                    ),
                    labelColor: ColorX.text0917(),
                    unselectedLabelColor: ColorX.text586(),
                    // width: 289.w,
                    tabs: state.tabs.map((e) => Text(e,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600),),).toList(),
                  ),
                  Divider(height: 1.h,color: ColorX.color_10_949,),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection : Axis.vertical,
                        controller: _scrollViewController,
                        child: SingleChildScrollView(
                          scrollDirection : Axis.horizontal,
                          child: Obx(() {
                            var widgets = List<Widget>.empty(growable: true);
                            var screenWidth = (30.w + 1.w) * (isEmpty(state.data) ? 0 :state.data[0].length);
                            for (var element in state.data) {
                              var index = state.data.indexOf(element);
                              widgets.add(buildNumberRow(element,index));
                              if(index == 0){
                                widgets.add(Container(color: ColorX.color_10_949,alignment: Alignment.centerLeft,height: 1.h,width: screenWidth,));
                              }
                            }
                            return Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widgets,
                                ),
                                SizedBox(
                                  width: screenWidth,
                                  height:(35.h) * state.data.length ,
                                  child: Obx(() {
                                    return Stack(
                                      children: buildLineChart(state.lottoData),
                                    );
                                  }),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumberItem(String num, Color color) {
    return Container(
      width: 30.w,
      height: 35.h,
      color: color,
      alignment: Alignment.center,
      child: Text(num,style: TextStyle(fontSize: 12.sp,color: ColorX.color_949eb9,),),
    );
  }

  Widget buildNumberRow(List<String> element,int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(element.length, (i) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildNumberItem(element[i],index == 0 || (index%2 == 1) ? Colors.white : ColorX.color_f7f8fb),
            Container(height: 35.h,width:1.r,color: ColorX.color_10_949,),
          ],
        );
      }),
    );
  }

  Widget buildLine(Size start, Size end) {
    return CustomPaint(
      painter: LinePainter(
        color: ColorX.color_fc243b,
        start: Offset((30.w + 1.w) * start.width + 15.w, (35.h) * start.height + 17.5.h),
        end: Offset((30.w + 1.w) * end.width + 15.w, (35.h) * end.height + 17.5.h),
      ),
    );
  }

  Widget buildDrawNum(Size size,String num,Color bg) {
    return Positioned(
      top: (35.h) * size.height,
      left:  (30.w + 1.w) * size.width,
      child: Container(
        width: 30.w,
        height: 35.h,
        alignment: Alignment.center,
        child: Container(
          width: 24.r,height: 24.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bg,borderRadius: BorderRadius.circular(15.r),),
          child: Text(num, style: TextStyle(fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }

  List<Widget> buildLineChart(Map<int,int> value) {
    var list = List<Widget>.empty(growable: true);

    ///折线渲染
    value.forEach((k, v) {
      if(unEmpty(value[k+1])){
        list.add(buildLine(Size(v.toDouble(), k.toDouble()), Size((value[k+1])!.toDouble(), (k+1).toDouble())));
      }
    });


    ///最上层点渲染
    value.forEach((k, v) {
      var color = _tabController.index == 0 ? DataUtils.getBallColor2(v): ColorX.color_58698d;

      list.add(buildDrawNum(Size(v.toDouble(), k.toDouble()), "$v", color));
    });
    return list;
  }


}