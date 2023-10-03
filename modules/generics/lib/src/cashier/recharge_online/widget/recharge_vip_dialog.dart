import 'package:aone_common/common.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/generics.dart';
import 'package:generics/src/cashier/recharge_online/widget/base_dialog.dart';
import 'package:generics/src/cashier/widgets/theme_button.dart';
import 'package:get/get.dart';

class RechargeVipDialog extends StatelessWidget {
  final VipPayProduct product;

  const RechargeVipDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  void onToWebPage() {
    if (product.href == null || product.href!.isEmpty) {
      onCustomerService();
      return;
    }
    if (GetUtils.isURL(product.href!)) {
      Get.toNamed(
        Routes.webPage,
        arguments: WebData(product.href!),
      );
    } else {
      onCustomerService();
    }
  }

  void onCustomerService() {
    if (RechargeTheme().onCustomerServiceTap != null) {
      Get.back();
      RechargeTheme().onCustomerServiceTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    RechargeTheme _theme = RechargeTheme();
    return BaseDialog(
      title: product.itemName,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r),
                child: ExtendedImage.network(
                  product.img ?? '',
                  fit: BoxFit.fill,
                  width: 150.r,
                  height: 150.r,
                ),
              ),
            ),
            Text(
              product.classname!,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                color: RechargeTheme().mainTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (product.href != null)
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: _theme.dialogCopyTextColor ?? _theme.primary!,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 5.r),
                      padding: EdgeInsets.symmetric(
                        vertical: 5.r,
                        horizontal: 11.r,
                      ),
                      child: Text(
                        product.href!,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: _theme.dialogCopyTextColor ?? _theme.primary!,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.r,
                  ),
                  ThemeButton(
                    textColor: Colors.black,
                    backgroundColor: RechargeTheme().borderColor,
                    boxDecoration: RechargeTheme().normalButtonDecoration,
                    onTap: () => copyToClipboard(product.href),
                    text: '复制',
                    height: 26.r,
                    radius: 26,
                  ),
                ],
              ),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 15.r),
              padding: EdgeInsets.symmetric(
                vertical: 8.r,
                horizontal: 10.r,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                // boxShadow: [
                //   BoxShadow(
                //     color: RechargeColors.shadowColor,
                //     blurStyle: BlurStyle.inner,
                //     blurRadius: 30.r,
                //   ),
                // ],
              ),
              child: Text(
                product.remarks ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: RechargeTheme().neutralColor,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ThemeButton(
                      onTap: Get.back,
                      text: '取消',
                      width: 110.r,
                      boxDecoration: RechargeTheme().cancelBtnDecoration,
                      textColor: RechargeTheme().dialogCancelTextColor),
                  ThemeButton(
                      onTap: onToWebPage,
                      text: '确认',
                      width: 110.r,
                      boxDecoration: RechargeTheme().confirmBtnDecoration,
                      textColor: RechargeTheme().dialogConfirmTextColor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
