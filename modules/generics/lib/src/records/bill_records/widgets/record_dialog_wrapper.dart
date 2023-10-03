import 'package:aone_common/core/core.dart';
import 'package:aone_common/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import '../../../tool/space_util.dart';
import 'record_button.dart';

///去除0 和 '',替换为 --
filterZero(String? title) {
  if (title == null) return '--';
  if (title == '0') {
    return '--';
  }
  return title;
}

///游戏平台剩余金额是个特殊
gameLastMoney(String? title) {
  if (title == null) return '--';
  if (title == '0') {
    return '--';
  }
  double dd = double.tryParse(title) ?? 0;
  if (dd <= 0) {
    return '--';
  }
  return decimalString(title);
}

///保留2位，如果为0，返回0
String filterRecordNumber(String? title) {
  if (title == null || title.isEmpty) return '0';
  double d = double.tryParse(title) ?? 0;
  if (d == 0) {
    return '0';
  }
  String result = decimalString(title);
  return result;
}

// ///保留2位，如果为0，返回0
// String filterRecordDoubleNumber(double? title) {
//   if (title == null) return '0';
//   if (title == 0) {
//     return '0';
//   }
//   String result = decimalString(title);
//   return result;
// }

///记录弹窗的包裹样式
class RecordDialogWrapper extends Dialog {
  final List<Widget> children;
  final String? title;

  ///是否隐藏底部操作按钮
  final bool? isHideBottomActions;
  final EdgeInsets? padding;

  const RecordDialogWrapper(
      {required this.children,
      this.title,
      this.isHideBottomActions,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330.r,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 44.r,
              color: const Color(0xFFC7A07B),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.r,
                    height: 35.r,
                  ),
                  Text(
                    title ?? '订单详情',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 50.r,
                      height: 35.r,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/records/close.png',
                        width: 15.r,
                      ),
                    ),
                  )
                ],
              ),
            ),
            heightSpace(10.r),
            ...children,
            heightSpace(15.r),
            if (isHideBottomActions != true) _bottomTwoActions()
          ],
        ),
      ),
    );
  }

  ///底部操作按钮 (联系客服 和 确定)
  _bottomTwoActions() {
    return Container(
        height: 44.r,
        // decoration: BoxDecoration(
        //     border: Border(
        //         top: BorderSide(
        //             width: 0.5, color: AppTheme.borderColor.withOpacity(0.5)))),
        child: RecordCancelAndDoneWidget(
          cancelTitle: '联系客服',
          doneTitle: '确定',
          onCancelTap: () {
            // AppService.to.toCustomerService();
            EventBus.emit(EventType.onOpenCustomerService);
          },
          onDoneTap: () {
            Get.back();
          },
        ));
  }
}

///记录弹窗每一行的样式
class RecordDialogRowItem extends StatelessWidget {
  final String? title;
  final String? titleValue;
  final TextStyle? subTitleStyle;
  final bool? canCopy;
  final String? copyString;
  final bool? isRemark;

  ///是否是number类型
  bool? isNumberType;

  RecordDialogRowItem(this.title, this.titleValue,
      {Key? key,
      this.subTitleStyle,
      this.canCopy,
      this.copyString,
      this.isRemark,
      this.isNumberType = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleValueTrue = '';
    if (isNumberType == true) {
      titleValueTrue = filterRecordNumber(titleValue);
    } else {
      titleValueTrue = filterZero(titleValue);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 12.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title ?? '',
              style: TextStyle(fontSize: 14.sp, color: Color(0xFFB8B8B8))),
          Container(
            constraints: BoxConstraints(
              maxWidth:
                  isRemark == true ? 250.r : (canCopy == true ? 190.r : 220.r),
            ),
            child: Text(titleValueTrue,
                maxLines: isRemark == true ? 15 : 1,
                overflow: TextOverflow.ellipsis,
                style: subTitleStyle ??
                    TextStyle(fontSize: 14.sp, color: Color(0xFF888888))),
          ),
          SizedBox(
            width: 10.r,
          ),
          if (canCopy == true) const Spacer(),
          if (canCopy == true)
            Padding(
              padding: EdgeInsets.only(right: 10.r),
              child: GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: copyString));
                  SmartDialog.showToast('user.center.success.copy'.tr);
                },
                child: Image.asset(
                  'assets/images/records/copy.png',
                  width: 20.r,
                  height: 20.r,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
