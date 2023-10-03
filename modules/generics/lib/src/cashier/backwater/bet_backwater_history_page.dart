import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/utils/date_time.dart';
import 'package:aone_common/utils/history.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_detail_page.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';
import 'package:generics/src/cashier/backwater/widgets/list_item_backwater.dart';
import 'package:generics/src/cashier/start_recharge/widget/no_data.dart';
import 'package:generics/src/cashier/utils/dj_image.dart';
import 'package:generics/src/cashier/utils/theme_scaffold.dart';
import 'package:get/get.dart';

import 'widgets/list_header.dart';
import 'widgets/list_title.dart';

//返水记录
class BetBackwaterHistoryPage extends GetView<BetBackwaterController> {
  const BetBackwaterHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BetBackwaterController());
    return GetBuilder<BetBackwaterController>(
        init: controller,
        builder: (controller) {
          return ThemeScaffold(
            appBar: AppBar(
              title: Text(
                '投注返水',
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
                AoneAppTheme.appTheme.fsBgColor ?? Colors.transparent,
            body: controller.isLoading
                ? Container()
                : controller.isShowEmptyView
                    ? _getNoData()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListHeader(controller: controller),
                          ListTitle(controller: controller),
                          Expanded(
                            child: _buildRecordList(context),
                          ),
                        ],
                      ),
          );
        });
  }

  Widget _getNoData() {
    if (AppEnv.config.siteTag == 'g87') {
      return const SizedBox();
    }
    return Row(
      children: [
        Expanded(
          child: NoData(
            title: "暂无数据",
            img: AoneAppTheme.appTheme.imgUrl,
            style: TextStyle(
              color: AoneAppTheme.appTheme.fsNoDataTextColor ?? Colors.black,
              fontSize: 14.w,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRecordList(BuildContext context) {
    if (controller.subItems.isEmpty) {
      if (AppEnv.config.siteTag == 'g87') {
        return const SizedBox();
      }
      return NoData(
        title: "暂无数据",
        img: AoneAppTheme.appTheme.imgUrl,
        style: TextStyle(
          color: AoneAppTheme.appTheme.fsNoDataTextColor ?? Colors.white,
          fontSize: 14.w,
        ),
      );
    }
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: controller.subItems.mapIndexed(
          (subItems, index) {
            return ListItem(
              controller: controller,
              items: subItems,
              index: index,
            );
          },
        ).toList(),
      ),
    );
  }

  @override
  void onClick(String dateS, String dateE) {
    final mController = Get.find<BetBackwaterController>();
    mController.backCurPage = 1;
    //达到最大滚动位置
    mController.confirmBackStart(dateS);
    mController.confirmBackEnd(dateE);
  }
}
