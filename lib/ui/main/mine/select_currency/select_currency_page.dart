import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'select_currency_logic.dart';

///
///选择币种
///author: Soushin
///2023/10/10 18:03
///
class SelectCurrencyPage extends StatelessWidget {
  final logic = Get.find<SelectCurrencyLogic>();
  final state = Get.find<SelectCurrencyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils().buildAppBar("选择您的币种"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
