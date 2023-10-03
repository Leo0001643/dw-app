import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/generics.dart';
import 'package:intl/intl.dart';

class AmountChips extends StatelessWidget {
  final bool isSelect;
  final String amount;
  final VoidCallback? onTap;

  const AmountChips({
    Key? key,
    required this.isSelect,
    required this.amount,
    this.onTap,
  }) : super(key: key);

  String formatContent(String val) {
    final currencySymbol = GlobalService.to.state.siteHeaders.currencySymbol!;
    if (int.tryParse(val) != null) {
      return currencySymbol + val;
      // return currencySymbol + NumberFormat.compact().format(int.parse(amount));
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    final RechargeTheme _theme = RechargeTheme();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.r),
        width: 96.r,
        height: 36.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelect
              ? _theme.amountMoneyChipsSelectedBgColor!
              : _theme.amountMoneyChipsBgColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // 阴影的颜色
              offset: const Offset(0, 2), // 阴影与容器的距离
              blurRadius: 10.0, // 高斯的标准偏差与盒子的形状卷积。
              spreadRadius: 0.0, // 在应用模糊之前，框应该膨胀的量。
            ),
          ],
          border: Border.all(
            width: 1,
            color: isSelect
                ? _theme.amountMoneyChipsSelectedBgColor!
                : _theme.amountMoneyChipsBgColor!,
          ),
        ),
        child: Text(
          formatContent(amount),
          style: TextStyle(
            fontSize: 12.sp,
            color: isSelect
                ? _theme.amountMoneyChipsSelectedTextColor
                : _theme.amountMoneyChipsTextColor,
          ),
        ),
      ),
    );
  }
}
