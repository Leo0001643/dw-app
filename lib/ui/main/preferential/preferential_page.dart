import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'preferential_logic.dart';

class PreferentialPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StatePreferentialPage();

}


class StatePreferentialPage extends State<PreferentialPage>{

  final logic = Get.find<PreferentialLogic>();
  final state = Get.find<PreferentialLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}


