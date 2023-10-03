import 'package:aone_common/common.dart';
import 'package:aone_common/core/event_bus.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/utils/date_time.dart';
import 'package:aone_common/utils/history.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';
import 'package:generics/src/cashier/start_recharge/widget/no_data.dart';
import 'package:generics/src/cashier/utils/theme_scaffold.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'widgets/detail_body.dart';
import 'widgets/detail_header.dart';

class BetBackwaterDetailPage extends GetView<BetBackwaterController> {
  const BetBackwaterDetailPage({Key? key}) : super(key: key);

  bool get isEmpty =>
      (controller.subItems.length - 1) < controller.selectSubIndex ||
      controller.subItems[controller.selectSubIndex].fsInfo == null ||
      controller.subItems[controller.selectSubIndex].fsInfo!.rate == null ||
      controller.subItems[controller.selectSubIndex].fsInfo!.rate!.isEmpty;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BetBackwaterController>(
        init: controller,
        builder: (controller) {
          return ThemeScaffold(
            appBar: AppBar(
              title: Text(
                '返水比例',
                style: TextStyle(fontSize: 16.w, color: Colors.white),
              ),
              centerTitle: true,
              leading: GestureDetector(
                  onTap: Get.back,
                  child: Image.asset(
                    "assets/images/user/back.png",
                    width: 30,
                    height: 30,
                  )),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: AoneAppTheme.appTheme.fsAppbarGradient ??
                      const LinearGradient(
                        colors: [Color(0xff13805E), Color(0xff06C285)],
                      ),
                ),
              ),
              elevation: 0,
            ),
            backgroundColor:
                AoneAppTheme.appTheme.fsDetailBackgroundColor ?? Colors.white,
            body: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  DetailHeader(controller: controller),
                  if (isEmpty)
                    emptyBody()
                  else
                    DetailBody(controller: controller),
                ],
              ),
            ),
          );
        });
  }

  Widget emptyBody() {
    return NoData(
      title: "暂无数据",
      img: AoneAppTheme.appTheme.imgUrl,
      style: TextStyle(
        color: AoneAppTheme.appTheme.fsNoDataTextColor ?? Colors.white,
        fontSize: 14.w,
      ),
    );
  }
}
