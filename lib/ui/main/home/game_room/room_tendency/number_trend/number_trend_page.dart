import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
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


  @override
  Widget build(BuildContext context) {
    return Container();
  }


}