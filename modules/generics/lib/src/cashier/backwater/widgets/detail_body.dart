import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generics/src/cashier/backwater/bet_backwater_history_controller.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BetBackwaterController controller;

  @override
  Widget build(BuildContext context) {
    List<Rate> rateList =
        controller.subItems[controller.selectSubIndex].fsInfo?.rate ?? [];
    final child = Container(
      margin: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
            color:
                AoneAppTheme.appTheme.fsDetailPrimary1 ?? Colors.transparent),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Column(
          children: [
            Container(
              color: AoneAppTheme.appTheme.fsDetailTitleBgColor ??
                  AoneAppTheme.appTheme.fsDetailPrimary,
              padding: EdgeInsets.symmetric(vertical: 8.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '有效投注',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AoneAppTheme.appTheme.fsDetailItemTitleColor ??
                            AoneAppTheme.appTheme.fsDetailItemTextColor ??
                            Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.w,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '返水比例',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AoneAppTheme.appTheme.fsDetailItemTitleColor ??
                            AoneAppTheme.appTheme.fsDetailItemTextColor ??
                            Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.w,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ...rateList
                .mapIndexed((e, i) => Container(
                      decoration: BoxDecoration(
                        color: i % 2 == 0
                            ? AoneAppTheme.appTheme.fsDetailItemBg1 ??
                                const Color(0xff06C285)
                            : AoneAppTheme.appTheme.fsDetailItemBg2 ??
                                const Color(0xffEBEBEB),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildRowItem(
                                '${e.min}-${e.max == 0 ? '∞' : e.max}'),
                          ),
                          Expanded(
                            child: _buildRowItem(
                                '${(100 * (e.fsbl ?? 0.00)).toStringAsFixed(2)}%'),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
    if (AoneAppTheme.appTheme.fsDetailHasBackground ?? false) {
      return Container(
        margin: EdgeInsets.only(top: 20.w, left: 12.w, right: 12.w),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: AoneAppTheme.appTheme.fsDetailItemBackgroundColor ??
              Colors.transparent,
        ),
        child: child,
      );
    }
    return child;
  }

  Widget _buildRowItem(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
              color: AoneAppTheme.appTheme.fsDetailPrimary3 ??
                  AoneAppTheme.appTheme.fsDetailPrimary ??
                  Colors.white,
              width: .5.w),
          bottom: BorderSide(
              color:
                  AoneAppTheme.appTheme.fsDetailPrimary3 ?? Colors.transparent,
              width: .5.w),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AoneAppTheme.appTheme.fsDetailItemTextColor ?? Colors.white,
          fontSize: 12.w,
        ),
      ),
    );
  }
}
