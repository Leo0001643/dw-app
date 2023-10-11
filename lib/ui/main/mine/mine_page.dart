import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateMinePage();

}

class StateMinePage extends State<MinePage>{
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }



}
