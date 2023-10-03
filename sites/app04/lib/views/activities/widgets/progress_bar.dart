import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///背景条和进度条一样高，进度指示器文字在进度条的后面，如果进度达到80%以上，
///进度指示器文字在进度条的前面
///进度为0，自动隐藏
class TaskProgressBar extends StatelessWidget {
  final double percent;
  final double? barWidth;
  final double? barHeight;
  final Color? bgColor;
  final Color? barColor;
  const TaskProgressBar(
      {Key? key,
      required this.percent,
      this.barWidth,
      this.barHeight,
      this.bgColor,
      this.barColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = barWidth ?? 200.r;
    final height = barHeight ?? 14.r;
    //
    // if (percent < 0.0001) {
    //   return const SizedBox.shrink();
    // }

    late Widget rows;
    if (percent < 0.8) {
      rows = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * percent,
            height: height,
            decoration: BoxDecoration(
                color: barColor ?? const Color(0xff249672),
                borderRadius: BorderRadius.circular(height / 2)),
          ),
          SizedBox(
            width: 5.r,
          ),
          Text(
            '${(percent * 100).round()}%',
            style: TextStyle(
                color: AoneAppTheme.appTheme.tcCellSliderTitleColor,
                fontSize: 10.sp),
          )
        ],
      );
    } else {
      rows = Container(
        width: width * percent,
        height: height,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: barColor ?? const Color(0xff249672),
            borderRadius: BorderRadius.circular(height / 2)),
        padding: EdgeInsets.only(right: 8.r),
        child: Text(
          '${(percent * 100).round()}%',
          style: TextStyle(
              color: AoneAppTheme.appTheme.tcCellSliderTitleColor1,
              fontSize: 10.sp),
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: bgColor ?? const Color(0xFF003927),
          borderRadius: BorderRadius.circular(height / 2)),
      alignment: Alignment.centerLeft,
      child: rows,
    );

    // return FlutterSlider(
    //   disabled: true,
    //   values: [percent],
    //   handler: FlutterSliderHandler(
    //     disabled: true,
    //     child: Container(
    //       alignment: Alignment.center,
    //       padding: EdgeInsets.zero,
    //       height: 12,
    //       // width: 60,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         color: const Color(0xFF249672),
    //       ),
    //       child: Text(
    //         '${percent.round()}%',
    //         style: const TextStyle(
    //           fontSize: 10,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    //   min: 0,
    //   max: 100.0,
    //   handlerHeight: 12,
    //   handlerWidth: 30,
    //   trackBar: FlutterSliderTrackBar(
    //     inactiveDisabledTrackBarColor: Color(0Xff3d3d3d),
    //     activeDisabledTrackBarColor: const Color(0xFF249672),
    //     activeTrackBar: BoxDecoration(
    //       color: const Color.fromRGBO(148, 118, 83, 1),
    //       borderRadius: BorderRadius.circular(12.5),
    //     ),
    //     activeTrackBarDraggable: true,
    //     activeTrackBarHeight: 12,
    //     inactiveTrackBar: BoxDecoration(
    //       color: Colors.transparent,
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     inactiveTrackBarHeight: 12,
    //   ),
    //   tooltip: FlutterSliderTooltip(
    //     disabled: true,
    //     textStyle: const TextStyle(color: Colors.transprearent),
    //     boxStyle: FlutterSliderTooltipBox(
    //       decoration: BoxDecoration(
    //         color: Colors.transparent,
    //         borderRadius: BorderRadius.circular(6),
    //       ),
    //     ),
    //   ),
    // );
  }
}
