import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leisure_games/app/global.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/widget/lc_tabbar.dart';

import 'dx_dew_logic.dart';

///大小露珠
class DxDewPage extends StatefulWidget {
  const DxDewPage({Key? key}) : super(key: key);

  @override
  State<DxDewPage> createState() => _DxDewPageState();
}

class _DxDewPageState extends State<DxDewPage> with SingleTickerProviderStateMixin{
  final logic = Get.find<DxDewLogic>();
  final state = Get.find<DxDewLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}