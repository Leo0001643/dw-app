import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../theme/color_schema.dart';

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
      return currencySymbol + NumberFormat.compact().format(int.parse(amount));
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.r),
        width: ((375 - 20 * 2 - 20 * 3 - 2) / 4).r,
        height: 36.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelect
              ? AppTheme.rechargeHighLightTextColor
              : AppTheme.rechargeUnselectedColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          NumberFormat.compact().format(int.parse(amount)),
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),
    );
  }
}
