import 'package:flutter/material.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fortune_wheel/fortune_wheel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///单独的抽奖记录弹窗,单独调用的 FortuneWheelService 内部的请求,防止耦合.
class ChoujiangRecordDialog extends StatelessWidget {
  const ChoujiangRecordDialog({Key? key}) : super(key: key);
  final double baseWidth = 260;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChoujiangRecordDialogController());
    return GetBuilder<ChoujiangRecordDialogController>(
        autoRemove: true,
        builder: (_) {
          return SizedBox(
            width: baseWidth.r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: baseWidth.r,
                  height: 320.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(124, 124, 195, 1),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(91, 54, 174, 1),
                        blurRadius: 35,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.r,
                      right: 12.r,
                      top: 4.r,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _boardTitle(),
                        _boardListView(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: Get.back,
                  child: Image.asset(
                    'assets/images/home/dialog_close.png',
                    color: Colors.white,
                    width: 30,
                    height: 30,
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _boardTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/landscape/title_left.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
        SizedBox(
          width: 10.r,
        ),
        Text(
          'fortuneWheel.record'.tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
          ),
        ),
        SizedBox(
          width: 10.r,
        ),
        Image.asset(
          'assets/images/landscape/title_right.png',
          package: 'fortune_wheel',
          width: 20.r,
        ),
      ],
    );
  }

  Widget _boardListView() {
    final controller = ChoujiangRecordDialogController.to;

    return Container(
        height: 280.r,
        margin: EdgeInsets.only(bottom: 10.r, top: 4.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
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
                  itemCount: controller.wheelRecords.length,
                  itemBuilder: (_, index) {
                    WheelRecord e = controller.wheelRecords[index];
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
                                        color: const Color.fromRGBO(
                                            91, 56, 174, 1)),
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
                                    color: const Color.fromRGBO(91, 56, 174, 1),
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
                                  fontSize: 10.sp,
                                  color: const Color.fromRGBO(91, 56, 174, 1)),
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
                                    fontSize: 10.sp,
                                    color:
                                        const Color.fromRGBO(91, 56, 174, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
            )
          ],
        ));
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
                      color: const Color.fromRGBO(91, 56, 174, 1),
                    ),
                  )))
              .toList()),
    );
  }
}

class ChoujiangRecordDialogController extends BaseController {
  static ChoujiangRecordDialogController to =
      Get.find<ChoujiangRecordDialogController>();

  final RxList<WheelRecord> wheelRecords = RxList.empty();

  Future<void> getRecord(int actInfoId) async {
    final FortuneWheelProvider provider = FortuneWheelProvider();
    await fetchHandler<WheelRecordEntity>(
        provider.wheelRecord(
          WheelRecordDto(
            id: actInfoId,
            limit: 50,
            page: 1,
          ),
        ), onSuccess: (res) {
      wheelRecords.clear();
      wheelRecords.addAll(res.items!);
      update();
    });
  }

  @override
  void onInit() async {
    super.onInit();
    int infoId = Get.arguments;
    await getRecord(infoId);
  }
}
