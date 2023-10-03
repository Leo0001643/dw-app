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

class FortuneWheelRecordZ01 extends BaseController {
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

class BoardRecordZ01 extends GetView<FortuneWheelRecordZ01> {
  const BoardRecordZ01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FortuneWheelRecordZ01());
    return Container(
      height: 280.r,
      margin: EdgeInsets.only(bottom: 10.r, top: 4.r),
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(color:const Color(0xFFffffff),width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        child: Obx(
              () => DataTable(
            columnSpacing: 0,
            horizontalMargin: 14.r,
            dataTextStyle: TextStyle(
              fontSize: 11.sp,
              color:const Color(0xFF505050),
              fontWeight: FontWeight.bold,
            ),
            headingTextStyle: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFFffffff),
              fontWeight: FontWeight.bold,
            ),
            headingRowColor: MaterialStateProperty.all(
              const Color(0xFF75B0E0),
            ),
            headingRowHeight: 30.r,
            columns: _columnLabels(['抽奖编号'.tr, '时间'.tr, '抽奖结果'.tr]),
            rows: _rowData(controller.wheelRecord),
          ),
        ),
      ),
    );
  }

  List<DataRow> _rowData(List<WheelRecord> items) {
    return items
        .mapIndexed(
          (e, index) => DataRow(
        color: MaterialStateProperty.resolveWith<Color?>((states) {
          return index.isOdd
              ? const Color.fromRGBO(227, 228, 230, 1)
              : const Color.fromRGBO(240, 241, 242, 1);
        }),
        cells: [
          DataCell(
            Center(
              child: SizedBox(
                width: 105.r,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        e.ordernumber!,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Clipboard.setData(ClipboardData(
                          text: e.ordernumber!,
                        ));
                        SmartDialog.showToast('复制成功'.tr);
                      },
                      child: Icon(
                        Icons.copy,
                        size: 20.r,
                        color: const Color(0xFF505050),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                timeStampIntToString(e.time!),
              ),
            ),
          ),
          DataCell(
            Center(
              child: Text(
                e.itemType == 1
                    ? e.rewardAmount != '0.0000'
                    ? double.parse(
                  e.rewardAmount!,
                ).toStringAsFixed(2)
                    : '未中奖'.tr
                    : e.rewardName!,
              ),
            ),
          )
        ],
      ),
    )
        .toList();
  }

  List<DataColumn> _columnLabels(List<String> text) {
    return text
        .map(
          (e) => DataColumn(
        label: Expanded(
          child: Text(
            e,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    )
        .toList();
  }
}
