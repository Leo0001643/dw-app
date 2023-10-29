import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}