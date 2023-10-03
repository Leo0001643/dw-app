import 'package:aone_common/common.dart';
import 'package:app10/tab/controllers/main_tabbar_controller.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widget/dialog/envelope/envelope_dialog.dart';
import '../../../widget/dialog/envelope/envelope_field_cell.dart';
import '../controllers/tack_center_controller.dart';

class ApplyFailedDialog extends StatelessWidget {
  final TaskCenterApplyEntities item;

  static final calculateTotal = TackCenterController.to.calculateTotal;
  static final calculateTotalWith = TackCenterController.to.calculateTotalWith;

  const ApplyFailedDialog({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 330.r,
        child: EnvelopeDialog(
          title: '条件未满足',
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 15.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildUndoneConditions(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildUndoneConditions() {
    List<Widget> _list = [];
    var index = 0;

    if (item.deposit != null) {
      index++;
      _list.add(
        EnvelopeFieldCell(
          label: '条件 $index',
          // content: '充值量达到: ¥${item.deposit!}',
          content:
              '充值量达到: ¥${decimalString(item.deposit)} 当前充值量:¥${decimalString(item.depositFinish!)} ',
          sencondContent: '当前已充值: ',
          sencondContentHighlight: '¥${item.depositFinish!}',
          percent: calculateTotal(item.depositFinish!, item.deposit!) / 100,
          percentStr: calculateTotalWith(item.depositFinish!, item.deposit!, 2),
          isprocess: true,
          finish: item.depositFinish,
          total: item.deposit,
        ),
      );
    }

    if (item.dml != null) {
      index++;
      _list.add(
        EnvelopeFieldCell(
          label: '条件 $index',
          // content: '打码量达到: ¥${item.dml!}',
          content:
              '打码量达到: ¥${decimalString(item.dml)} 当前打码量:¥${decimalString(item.dmlFinish!)} ',
          sencondContent: '当前打码量: ',
          sencondContentHighlight: '¥${item.dmlFinish!}',
          percent: calculateTotal(item.dmlFinish!, item.dml!) / 100,
          percentStr: calculateTotalWith(item.dmlFinish!, item.dml!, 2),
          isprocess: true,
          finish: item.dmlFinish,
          total: item.dml,
        ),
      );
    }

    _list.add(
      UnconstrainedBox(
        child: GestureDetector(
          onTap: () {
            if (item.deposit != null) {
              Get.toNamed(Routes.recharge);
            } else {
              Get.until((route) => Get.currentRoute == Routes.main);
              MainTabbarController.to.jumpToPage(0);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: const Text(
              '立即去完成',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return _list;
  }
}
