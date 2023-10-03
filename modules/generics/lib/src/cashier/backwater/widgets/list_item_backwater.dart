import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/user/ladder_fs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generics.dart';
import '../../utils/dj_image.dart';
import '../bet_backwater_detail_page.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.controller,
    required this.items,
    required this.index,
  }) : super(key: key);

  final BetBackwaterController controller;
  final SubItems items;
  final int index;

  String formatBottomValue(String? value) {
    return '${(100 * (double.tryParse(value ?? '0.00') ?? 0.00)).toStringAsFixed(2)}%';
  }

  bool get isZiZhuTiYu =>
      items.gameTag == 'zzsports' &&
      (AppEnv.config.siteTag == 'h09' ||
          AppEnv.config.siteTag == 'b97' ||
          AppEnv.config.siteTag == 'g83');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!controller.hasDetail) return;
        controller.selectSubIndex = index;
        controller.setYxCs();
        controller.setYxType();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const BetBackwaterDetailPage(),
          ),
        );
      },
      child: Container(
        height: 114.w,
        margin: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.w),
        padding: EdgeInsets.all(12.w).copyWith(bottom: 10.w),
        decoration: BoxDecoration(
          color: AoneAppTheme.appTheme.fsItemBgColor,
          gradient: AoneAppTheme.appTheme.fsItemBgGradient ??
              const LinearGradient(
                colors: [Color(0xff30652B), Color(0xff5A976C)],
              ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(children: [
          Row(
            children: [
              if (items.gameLogo != null)
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: isZiZhuTiYu
                      ? Image.asset(
                          'assets/images/zizhutiyu_${AppEnv.config.siteTag}.png',
                          width: 32.w,
                          height: 32.w,
                          package: 'generics',
                        )
                      : DjImage.network(
                          items.gameLogo ?? "",
                          width: 32.w,
                          height: 32.w,
                          fit: BoxFit.contain,
                          errorBuilder: (context, object, stack) => Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.04),
                            ),
                          ),
                        ),
                ),
              SizedBox(width: 12.w),
              Text(
                items.nameCn ?? "",
                style: TextStyle(
                  fontSize: 14.w,
                  color:
                      AoneAppTheme.appTheme.fsItemContentColor ?? Colors.white,
                ),
              ),
              if (controller.hasDetail) ...[
                const Spacer(),
                Image.asset(
                  'assets/images/generic_row_right.png',
                  width: 15.r,
                  height: 15.r,
                  color:
                      AoneAppTheme.appTheme.fsItemContentColor ?? Colors.white,
                  package: 'generics',
                ),
              ],
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BottomItem(
                "有效投注",
                '￥${items.betValid ?? "0"}',
              ),
              if (controller.isShowBackWater) ...[
                _BottomItem(
                  "可返水",
                  '￥${items.unReceive ?? "0"}',
                ),
                _BottomItem(
                  "返水比例",
                  formatBottomValue(items.fsInfo?.fsBl),
                ),
              ] else ...[
                _BottomItem(
                  "返水比例",
                  formatBottomValue(items.fsRate),
                ),
                _BottomItem(
                  "下一档",
                  formatBottomValue(items.fsNextRate),
                ),
              ],
            ],
          ),
        ]),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  final String topName;
  final String bottomName;

  const _BottomItem(
    this.topName,
    this.bottomName, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(topName,
            style: TextStyle(
              fontSize: 12.w,
              color: AoneAppTheme.appTheme.fsChildItemTextColor ?? Colors.white,
            )),
        SizedBox(height: 2.w),
        Text(bottomName,
            style: TextStyle(
              fontSize: 14.w,
              color: AoneAppTheme.appTheme.fsChildItemTextColor ?? Colors.white,
              fontWeight: FontWeight.w600,
            ))
      ],
    );
  }
}
