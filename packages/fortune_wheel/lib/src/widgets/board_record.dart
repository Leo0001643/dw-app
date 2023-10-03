import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../fortune_wheel.dart';
import '../logic/dto.dart';
import '../logic/entities/entities.dart';
import '../logic/provider.dart';
import '../utils/utils.dart';

class FortuneWheelRecord extends BaseController {
  final FortuneWheelProvider provider = FortuneWheelProvider();
  final RxList<WheelRecord> wheelRecord = RxList.empty();

  Future<void> getRecord() async {
    final FortuneWheelService _service = FortuneWheelService.to;

    await fetchHandler<WheelRecordEntity>(
        provider.wheelRecord(
          WheelRecordDto(
            id: _service.actInfo!.id,
            limit: 50,
            page: 1,
          ),
        ), onSuccess: (res) {
      wheelRecord.clear();
      wheelRecord.addAll(res.items!);
    });
  }

  @override
  void onInit() async {
    await getRecord();
    super.onInit();
  }
}

class BoardRecord extends GetView<FortuneWheelRecord> {
  const BoardRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FortuneWheelRecord());
    return Container(
        height: 280.r,
        margin: EdgeInsets.only(bottom: 10.r, top: 4.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: _contentView()
        // child: _oldView()
        );
  }

  Widget _titlesView(List<String> text) {
    return Container(
      padding: EdgeInsets.only(right: 5.r),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 1,
        color: Color.fromRGBO(227, 228, 230, 1),
      ))),
      child: Row(
          children: text
              .mapIndexed((e, index) => Expanded(
                  flex: index == 0 ? 5 : 4,
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: ColorSchema.primary,
                    ),
                  )))
              .toList()),
    );
  }

  _contentView() {
    return Stack(
      children: [
        SizedBox(
          height: 20.r,
          child: _titlesView(['抽奖编号', '时间', '抽奖结果']),
        ),
        Positioned(
          top: 20.r,
          left: 0,
          right: 0,
          bottom: 0,
          child: Obx(() => ListView.builder(
              itemCount: controller.wheelRecord.length,
              itemBuilder: (_, index) {
                WheelRecord e = controller.wheelRecord[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.r),
                  height: 44.r,
                  color: index % 2 != 0
                      ? const Color.fromRGBO(220, 221, 224, 0.5)
                      : null,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                e.ordernumber!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: ColorSchema.primary),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                  text: e.ordernumber!,
                                ));
                                SmartDialog.showToast('复制成功');
                              },
                              child: Icon(
                                Icons.copy,
                                size: 20.r,
                                color: ColorSchema.primary,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4.r,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          timeStampIntToString(e.time!),
                          style: TextStyle(
                              fontSize: 10.sp, color: ColorSchema.primary),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            e.itemType == 1
                                ? e.rewardAmount != '0.0000'
                                    ? double.parse(
                                        e.rewardAmount!,
                                      ).toStringAsFixed(2)
                                    : '未中奖'
                                : e.rewardName!,
                            style: TextStyle(
                                fontSize: 10.sp, color: ColorSchema.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
        )
      ],
    );
  }

  //tableview布局，头部要固定，修改了这里
  // _oldView() {
  //   return SingleChildScrollView(
  //     child: Obx(
  //       () => DataTable(
  //         columnSpacing: 0,
  //         horizontalMargin: 14.r,
  //         dataTextStyle: TextStyle(
  //           fontSize: 10.sp,
  //           color: ColorSchema.primary,
  //         ),
  //         headingTextStyle: TextStyle(
  //           fontSize: 10.sp,
  //           color: ColorSchema.primary,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         headingRowColor: MaterialStateProperty.all(
  //           const Color.fromRGBO(240, 241, 242, 1),
  //         ),
  //         headingRowHeight: 20.r,
  //         columns: _columnLabels(['抽奖编号', '时间', '抽奖结果']),
  //         rows: _rowData(controller.wheelRecord),
  //       ),
  //     ),
  //   );
  // }

  // List<DataRow> _rowData(List<WheelRecord> items) {
  //   return items
  //       .mapIndexed(
  //         (e, index) => DataRow(
  //           color: MaterialStateProperty.resolveWith<Color?>((states) {
  //             return index.isOdd
  //                 ? const Color.fromRGBO(227, 228, 230, 1)
  //                 : const Color.fromRGBO(240, 241, 242, 1);
  //           }),
  //           cells: [
  //             DataCell(
  //               Center(
  //                 child: SizedBox(
  //                   width: 105.r,
  //                   child: Row(
  //                     children: [
  //                       Expanded(
  //                         child: Text(
  //                           e.ordernumber!,
  //                           overflow: TextOverflow.ellipsis,
  //                           textAlign: TextAlign.center,
  //                         ),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () async {
  //                           await Clipboard.setData(ClipboardData(
  //                             text: e.ordernumber!,
  //                           ));
  //                           SmartDialog.showToast('复制成功');
  //                         },
  //                         child: Icon(
  //                           Icons.copy,
  //                           size: 20.r,
  //                           color: ColorSchema.primary,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             DataCell(
  //               Center(
  //                 child: Text(
  //                   timeStampIntToString(e.time!),
  //                 ),
  //               ),
  //             ),
  //             DataCell(
  //               Center(
  //                 child: Text(
  //                   e.itemType == 1
  //                       ? e.rewardAmount != '0.0000'
  //                           ? double.parse(
  //                               e.rewardAmount!,
  //                             ).toStringAsFixed(2)
  //                           : '未中奖'
  //                       : e.rewardName!,
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       )
  //       .toList();
  // }

  // List<DataColumn> _columnLabels(List<String> text) {
  //   return text
  //       .map(
  //         (e) => DataColumn(
  //           label: Expanded(
  //             child: Text(
  //               e,
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //         ),
  //       )
  //       .toList();
  // }
}
