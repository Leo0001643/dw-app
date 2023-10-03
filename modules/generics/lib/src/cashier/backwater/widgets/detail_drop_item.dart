import 'package:aone_common/common.dart';
import 'package:aone_common/core/event_bus.dart';
import 'package:aone_common/data/model/entities/record/record_detail_entity.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:aone_common/utils/date_time.dart';
import 'package:aone_common/utils/history.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';
import 'package:generics/src/cashier/start_recharge/widget/no_data.dart';
import 'package:generics/src/cashier/utils/theme_scaffold.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailDropItem extends StatelessWidget {
  const DetailDropItem({
    Key? key,
    required this.hintText,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final List<DropdownMenuItem> items;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          width: 1.w,
          color:
              AoneAppTheme.appTheme.fsDetailPrimary1 ?? const Color(0xff13805E),
        ),
      ),
      child: DropdownButton2(
        isExpanded: true,
        alignment: Alignment.center,
        style: TextStyle(
          color:
              AoneAppTheme.appTheme.fsDetailPrimary1 ?? const Color(0xff13805E),
        ),
        hint: Text(hintText,
            style: TextStyle(
              color: AoneAppTheme.appTheme.fsDetailPrimary1 ??
                  const Color(0xff13805E),
              fontSize: 14.w,
            )),
        underline: Container(height: 1),
        items: items,
        itemPadding: EdgeInsets.zero,
        dropdownPadding: EdgeInsets.zero,
        onChanged: onChanged,
        buttonHeight: 32.w,
        buttonWidth: 136.w,
        dropdownMaxHeight: 252.w,
        dropdownWidth: 136.w,
        itemHeight: 36.w,
      ),
    );
  }
}
