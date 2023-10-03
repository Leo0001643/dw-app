import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_task/src/red_task_service.dart';
import '../constants.dart';

bool isCN() => Get.locale?.languageCode == 'zh';

abstract class RedImage {
  static String fromStatic(String imgType) {
    print('imgType = ${imgType}');
    final _globalState = GlobalService.to.state;
    var url = _globalState.siteHeaders.necStaticUrl;
    String imageName = defaultPicEnum[int.parse(imgType)];
    print('红包椒图 $url/static/comm/activityImg/redAct/$imageName');
    return '$url/static/comm/activityImg/redAct/$imageName';
  }

  static Image redActStandard(
    String name, {
    double? width,
    double? height,
  }) {

    return Image.asset(
      'assets/images/redAct/${RedTaskService.to.showType == 2 ?'standardtow':'standard'}/$name',
      package: 'red_task',
      fit: BoxFit.fill,
      width: width,
      height: height,
    );
  }

  static Image redActStandardTow(
    String name, {
    double? width,
    double? height,
  }) {
    return Image.asset(
      'assets/images/redAct/standardtow/$name',
      package: 'red_task',
      fit: BoxFit.fill,
      width: width,
      height: height,
    );
  }

  static ImageProvider redActStandardProvider(String name) {
    return AssetImage(
      'assets/images/redAct/standard/$name',
      package: 'red_task',
    );
  }

  static ImageProvider redWarStandardProvider(String name) {
    return AssetImage(
      'assets/images/redwar/standard/$name',
      package: 'red_task',
    );
  }

  static Image redWarStandard(
    String name, {
    double? width,
    double? height,
  }) {
    return Image.asset(
      'assets/images/redwar/standard/$name',
      package: 'red_task',
      fit: BoxFit.fill,
      width: width,
      height: height,
    );
  }
}
