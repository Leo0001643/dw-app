import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/theme_scaffold.dart';
import '../../widget/misc/dj_image.dart';
import '../../widget/tool/light_text.dart';
import '../user/promotion_rebate/controllers/promotion_rebate_controller.dart';
import 'commission_description_controller.dart';

class CommissionDescriptionView
    extends GetView<CommissionDescriptionController> {
  const CommissionDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = PromotionRebateController.to;

    return GetBuilder<CommissionDescriptionController>(builder: (_) {
      return ThemeScaffold(
        title: '佣金说明',
        body: Container(
          color: AppTheme.normalBgColor,
          // padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50.w,
                child: Container(
                  color: Colors.white,
                  width: Get.width,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal, // 横向滚动
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return _categoryWrapWidget(
                              ctrl.state.quanmintgYiIntroduce.items![index]
                                      .className ??
                                  '',
                              index);
                        });
                      },
                      itemCount:
                          ctrl.state.quanmintgYiIntroduce.items?.length ?? 0,
                    ),
                  ),
                ),
              ),
              Expanded(
                // height: 500.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 15.w,
                        ),
                        const Text('佣金段位对照表',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 14)),
                        SizedBox(
                          height: 15.w,
                        ),
                        Obx(() {
                          return Container(
                            width: Get.width,
                            // padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 10.w),
                            child: DataTable(
                              columnSpacing: 5.w,
                              headingRowHeight: 40.r,
                              headingRowColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0x80F8F1F1),
                              ),
                              dataRowColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromRGBO(218, 227, 242, 0.3),
                              ),
                              columns: [
                                _tableColumn('popularize.segment'.tr,0),
                                _tableColumn('popularize.performance.range'.tr,1),
                                _tableColumn('popularize.one.level.team'.tr,2),
                                _tableColumn('popularize.two.level.team'.tr,3),
                                _tableColumn('popularize.three.level.team'.tr,4),
                              ],
                              rows: controller
                                          .state.quanmintgYiIntroduce.items !=
                                      null
                                  ? controller
                                      .state
                                      .quanmintgYiIntroduce
                                      .items![controller
                                          .tabIndexQuanmintgYiIntroduce]
                                      .item!
                                      .mapIndexed(
                                        (e, index) => DataRow(
                                          cells: [
                                            _dataCell('${index + 1}'),
                                            _dataCell('popularize.big'.tr +
                                                e.qujian.toString() +
                                                'popularize.wan_not_yuan.type'
                                                    .tr),
                                            _dataCell(e.fytotalYi.toString() +
                                                'popularize.wan.type'.tr),
                                            _dataCell(e.fytotalEr.toString() +
                                                'popularize.wan.type'.tr),
                                            _dataCell(e.fytotalSan.toString() +
                                                'popularize.wan.type'.tr),
                                          ],
                                        ),
                                      )
                                      .toList()
                                      .cast<DataRow>()
                                  : [],
                            ),
                          );
                        }),
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.back();
                        //   },
                        //   child: Image.asset(
                        //     'assets/images/home/back_icon.png',
                        //   ),
                        // )
                        Container(
                          height: 46.r,
                          width: Get.width,
                          color: AppTheme.backgroundColor,
                          alignment: Alignment.center,
                          child: const Text('返佣规则',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14)),
                        ),
                        SizedBox(height: 10.w,),
                        Row(children: [
                          SizedBox(width: 2.r,),
                          DjImage.asset(
                          'assets/images/home/person.png',
                          width: Get.width-2.r,
                          height: 231.r,
                          fit: BoxFit.contain,
                        )],),

                        //   DjImage.asset(
                        //     'assets/images/home/user_commission_description.png',
                        //     width: Get.width,
                        //     height: 231.h,
                        //   ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.r),
                          width: Get.width - 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LightText.buildColorFont(
                                  '说明：', Colors.black, 14.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont('我的业绩：所有旗下会员的自营业绩总和:',
                                  AppTheme.greenTextColor, 12.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont('自营业绩：每个会员自己的游戏有效投注额',
                                  AppTheme.textRedColor, 12.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '例如：', Colors.black, 14.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '总业绩为32万，对应佣金段位对照表，返佣比例是如下：',
                                  Colors.black,
                                  12.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '一级团队(100元/万)、二级团队(90元/万)、三级团队(80/万)',
                                  AppTheme.blueColor,
                                  12.sp),
                              SizedBox(
                                height: 15.r,
                              ),
                              LightText.buildColorFont(
                                  '所有', Colors.black, 14.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '一级团队返佣：4×100=400元；', Colors.black, 12.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '一级团队(100元/万)、二级团队(90元/万)、三级团队(80/万)',
                                  Colors.black,
                                  12.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '二级团队返佣：12×90=1080元；', Colors.black, 12.sp),
                              SizedBox(
                                height: 5.r,
                              ),
                              LightText.buildColorFont(
                                  '三级团队返佣：16×80=1280元；', Colors.black, 12.sp),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.w,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  DataColumn _tableColumn(String title,int index) {
    if (title == "业绩区间") {
      printInfo(info: "------>jett");
      title = " 业绩区间";
    }
    return DataColumn(
        label: Container(
      width: index==0?35.r:60.r,
      alignment: Alignment.center,
      child: Text(
        title,
        style: AppTheme.regularStyle,
      ),
    ));
  }

  DataCell _dataCell(String value) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        // width: (Get.width - 10) / 6,
        child: Text(
          value,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }

  Widget _categoryWrapWidget(String title, int index) {
    // final state = PopularizeController.to.state;
    // final ctrl = PopularizeController.to;

    return GestureDetector(
      child: Row(
        children: [
          Wrap(
            // spacing: 10.r, //两个widget之间横向的间隔
            direction: Axis.horizontal, //方向
            alignment: WrapAlignment.start,
            children: [
              Obx(() {
                // return TabBarTitle(
                //   title: title,
                //   isCheck: controller.tabIndexQuanmintgYiIntroduce == index,
                // );
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 50.w,
                        width: 60.w,
                        alignment: Alignment.center,
                        child: Text(title,
                            style:
                                controller.tabIndexQuanmintgYiIntroduce == index
                                    ? const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14)
                                    : const TextStyle(
                                        color: AppTheme.undeer_line_color1,
                                        fontSize: 14)),
                      ),
                    ),
                    controller.tabIndexQuanmintgYiIntroduce == index
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 2.r,
                              width: 30.r,
                              color: AppTheme.goldTextColor,
                            ),
                          )
                        : SizedBox()
                  ],
                );
              }),
            ],
          ),
        ],
      ),
      onTap: () {
        controller.tabIndexQuanmintgYiIntroduce = index;
      },
    );
  }
}
