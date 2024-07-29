import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:leisure_games/app/config_manager.dart';
import 'package:leisure_games/app/res/imagex.dart';
import 'package:leisure_games/app/routes.dart';
import 'package:leisure_games/app/utils/widget_utils.dart';

import 'splash_logic.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final logic = Get.find<SplashLogic>();
  final state = Get.find<SplashLogic>().state;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Get.offAndToNamed(Routes.main);
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SplashLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: WidgetUtils().buildImage(ConfigManager.getSplashImage(), 1.sw, 1.sh,fit: BoxFit.fill),
    );
  }





}