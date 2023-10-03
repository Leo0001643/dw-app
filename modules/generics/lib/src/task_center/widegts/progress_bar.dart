import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///传统样式
///指示器比slider条更大一些
class TaskProgressBar extends StatelessWidget {
  ///percent 为 1-100
  final double percent;
  const TaskProgressBar({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (percent < 0.000001) {
    //   return const SizedBox.shrink();
    // }
    return FlutterSlider(
      disabled: true,
      values: [percent],
      handler: FlutterSliderHandler(
        disabled: true,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          height: 20,
          // width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFe6ae4f),
          ),
          child: Text(
            '${percent.round()}%',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: stringToColor('433103'),
            ),
          ),
        ),
      ),
      min: 0,
      max: 100.0,
      handlerHeight: 20,
      handlerWidth: 40,
      trackBar: FlutterSliderTrackBar(
        inactiveDisabledTrackBarColor: Color(0Xff3d3d3d),
        activeDisabledTrackBarColor: Color(0xFFe6ae4f),
        activeTrackBar: BoxDecoration(
          color: const Color.fromRGBO(148, 118, 83, 1),
          borderRadius: BorderRadius.circular(12.5),
        ),
        activeTrackBarDraggable: true,
        activeTrackBarHeight: 10,
        inactiveTrackBar: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        inactiveTrackBarHeight: 10,
      ),
      tooltip: FlutterSliderTooltip(
        disabled: true,
        textStyle: const TextStyle(color: Colors.transparent),
        boxStyle: FlutterSliderTooltipBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

///新样式
///背景条和进度条一样高，进度指示器文字在进度条的后面，如果进度达到80%以上，
///进度指示器文字在进度条的前面
class TaskProgressBar1 extends StatelessWidget {
  /// percent 为 0-100
  final double percent;
  final double? barWidth;
  final double? barHeight;
  final Color? bgColor;
  final Color? barColor;
  final Color? titleColor;
  final Color? titleColor1;

  const TaskProgressBar1(
      {Key? key,
      required this.percent,
      required this.barWidth,
      this.barHeight,
      this.bgColor,
      this.barColor,
      this.titleColor,
      this.titleColor1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = barWidth ?? 200.r;
    final height = barHeight ?? 14.r;
    late Widget rows;

    if (percent < 80) {
      String percentStr = percent.toString();
      if (percentStr.length > 3) {
        percentStr = percentStr.substring(0, 4);
      }
      if (percent == 0) {
        percentStr = '0';
      }

      rows = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width * percent / 100,
            clipBehavior: Clip.hardEdge,
            height: height,
            decoration: BoxDecoration(
                color: barColor ?? const Color(0xff249672),
                borderRadius: BorderRadius.circular(height / 2)),
          ),
          SizedBox(
            width: 5.r,
          ),
          Text(
            '$percentStr%',
            style:
                TextStyle(color: titleColor ?? Colors.yellow, fontSize: 10.sp),
          )
        ],
      );
    } else {
      rows = Container(
        width: width * percent / 100,
        height: height,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: barColor ?? const Color(0xff249672),
            borderRadius: BorderRadius.circular(height / 2)),
        padding: EdgeInsets.only(right: 8.r),
        child: Text(
          '${percent.round()}%',
          style: TextStyle(color: titleColor1 ?? Colors.blue, fontSize: 10.sp),
        ),
      );
    }
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: bgColor ?? const Color(0xFF003927),
          borderRadius: BorderRadius.circular(height / 2)),
      alignment: Alignment.centerLeft,
      child: rows,
    );
  }
}
