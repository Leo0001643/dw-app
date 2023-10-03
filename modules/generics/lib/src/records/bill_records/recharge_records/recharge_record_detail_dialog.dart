import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/records/bill_records/bill_records_controller.dart';
import 'package:get/get.dart';
import '../../../tool/space_util.dart';
import '../widgets/record_dialog_wrapper.dart';

///充值弹窗
class RechargeRecordDetailDialog extends Dialog {
  final Items item;
  final Color? statusColor;
  final String? status;

  const RechargeRecordDetailDialog(
      {required this.item, this.statusColor, this.status, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecordDialogWrapper(
      children: [
        RecordDialogRowItem(
          "user.center.ordernum".tr,
          orderNumberFormatter(item.ordernumber),
          canCopy: true,
          copyString: item.ordernumber,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecordDialogRowItem(
              "状态：",
              status,
              subTitleStyle: TextStyle(fontSize: 14.sp, color: statusColor),
            ),

            ///state ：1 未支付
            if (item.state == 1) _cancelOrderView()
          ],
        ),
        RecordDialogRowItem('充值时间：', timeStampIntToSecond(item.addTime ?? 0)),
        RecordDialogRowItem('会员账号：', item.userName),
        RecordDialogRowItem(
          "存款人：",
          filterZero(item.cunkuanren),
        ),
        RecordDialogRowItem('充值金额：', item.payTotal, isNumberType: true),
        RecordDialogRowItem('充值类型：', getTypeString(item.type ?? 3)),
        RecordDialogRowItem(
          "优惠金额：",
          item.yhtotal,
          isNumberType: true,
        ),
        RecordDialogRowItem("洗码量：", item.xml_total, isNumberType: true),
        RecordDialogRowItem("备注：", item.remarks, isRemark: true),
      ],
    );
  }

  _cancelOrderDialog(String orderId) {
    return RecordDialogWrapper(
        title: '提示',
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        isHideBottomActions: true,
        children: [
          _padding(Text(
            '请确认是否取消当前存款订单？',
            style: TextStyle(
                fontSize: 15.sp, color: Colors.black.withOpacity(0.6)),
          )),
          _padding(Text('存款订单号：$orderId'.composing,
              maxLines: 10,
              style: TextStyle(fontSize: 15.sp, color: Color(0xFF888888)))),
          heightSpace(10.r),
          _submitButton(orderId)
        ]);
  }

  ///取消充值
  _cancelOrderView() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.back();
        Get.dialog(
          _cancelOrderDialog(item.ordernumber!),
          barrierDismissible: false,
        );
      },
      child: Container(
        width: 52.r,
        height: 24.r,
        margin: EdgeInsets.only(right: 20.r),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xFFBB1100)),
            borderRadius: BorderRadius.circular(12.r)),
        alignment: Alignment.center,
        child: Text(
          '取消',
          style: TextStyle(fontSize: 13.sp, color: Color(0xFFBB1100)),
        ),
      ),
    );
  }

  _padding(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
      child: child,
    );
  }

  _submitButton(String orderId) {
    BillRecordsController ctrl = BillRecordsController.to;
    return Obx(() => RecordSubmitButton(
        onTap: () {
          ctrl.cancelOrder(orderId);
        },
        isSubmitting: ctrl.isCancelOrderSubmitting));
  }
}

///充值弹窗的submit按钮，提交中显示loading
class RecordSubmitButton extends StatelessWidget {
  final String? title;
  bool isSubmitting;
  final VoidCallback? onTap;

  RecordSubmitButton(
      {Key? key, this.title, required this.isSubmitting, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.r,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 12.r),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (isSubmitting) return;
          if (onTap != null) onTap!();
        },
        child: Container(
          width: 172.r,
          height: 44.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              gradient: LinearGradient(colors: [
                isSubmitting ? Colors.grey : Color(0xFFD3A372),
                isSubmitting ? Colors.grey : Color(0xFF9C7B5A),
              ])),
          alignment: Alignment.center,
          child: Center(
            child: isSubmitting
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title ?? '确定',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
          ),
        ),
      ),
    );
  }
}
