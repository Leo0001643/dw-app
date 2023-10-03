import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import 'progress_bar.dart';

class EnvelopeFieldCell extends StatelessWidget {
  final MainAxisAlignment mainAxis;
  final CrossAxisAlignment crossAxis;
  final String label;
  final String? content;
  final Widget? child;
  final double? percent;
  final String? percentStr;
  final String? total;
  final String? finish;
  final bool? isprocess;
  final String? sencondContentHighlight;
  final String? sencondContent;

  const EnvelopeFieldCell(
      {Key? key,
      this.mainAxis = MainAxisAlignment.center,
      this.crossAxis = CrossAxisAlignment.start,
      required this.label,
      this.content,
      this.child,
      this.percent,
      this.percentStr,
      this.total,
      this.finish,
      this.isprocess,
      this.sencondContent,
      this.sencondContentHighlight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _commenWidget();
  }

  Widget _commenWidget() {
    return Column(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: AoneAppTheme.appTheme.tcDialogMenuBgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: TextStyle(
              color: AoneAppTheme.appTheme.tcDialogMenuTitleColor,
              fontSize: 12.sp,
              height: 1.4,
            ),
          ),
        ),
        SizedBox(
          height: 5.w,
        ),
        child ??
            Text(
              content ?? '',
              textHeightBehavior: const TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even,
              ),
              style: TextStyle(
                  color: AoneAppTheme.appTheme.tcDialogMenuSubTitleColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
        if (percent != null)
          Container(
            margin: EdgeInsets.only(top: 9.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 5.0, bottom: 5),
                //   child: RichText(
                //     text: TextSpan(
                //         text: double.parse(finish ?? "0.00").toStringAsFixed(2),
                //         style: TextStyle(
                //             color: AppTheme.primary,
                //             fontSize: 12,
                //             fontWeight: FontWeight.w400),
                //         children: [
                //           TextSpan(
                //             text: "/" +
                //                 double.parse(total ?? "0.00")
                //                     .toStringAsFixed(2),
                //             style: const TextStyle(
                //                 color: AppTheme.undeer_line_color1,
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w400),
                //           )
                //         ]),
                //   ),
                // ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    TaskProgressBar1(
                      percent: percent!,
                      barWidth: 250.r,
                      barHeight: 12.r,
                      barColor: AoneAppTheme.appTheme.tcCellSliderColor,
                      bgColor: AoneAppTheme.appTheme.tcCellSliderBgColor,
                      titleColor: AoneAppTheme.appTheme.tcCellSliderTitleColor,
                      titleColor1:
                          AoneAppTheme.appTheme.tcCellSliderTitleColor1,
                    ),

                    // GFProgressBar(
                    //   percentage: percent!,
                    //   lineHeight: 9,
                    //   backgroundColor: stringToColor('D9D9D9'),
                    //   type: GFProgressType.linear,
                    //   progressBarColor: AppTheme.primary,
                    // ),

                    // Positioned(
                    //     top: -4,
                    //     left: offset,
                    //     child: Container(
                    //       padding: const EdgeInsets.only(
                    //           left: 5, top: 2, bottom: 1, right: 5),
                    //       decoration: BoxDecoration(
                    //         color: AppTheme.primary,
                    //         borderRadius:
                    //             const BorderRadius.all(Radius.circular(10)),
                    //       ),
                    //       child: Text(
                    //         percentStr!.toString() + '%',
                    //         style: TextStyle(fontSize: 10, color: Colors.white),
                    //       ),
                    //     ))
                  ],
                ),
              ],
            ),
          ),
        SizedBox(
          height: 15.w,
        ),
      ],
    );
  }

  Widget _cardWidget() {
    return Container(
      width: 200.w,
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.w,
          ),
          Container(
            child: Text(
              label,
              textHeightBehavior: const TextHeightBehavior(
                leadingDistribution: TextLeadingDistribution.even,
              ),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  height: 1.4,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          child ??
              Text(
                content ?? '',
                textHeightBehavior: const TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.even,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  height: 1.4,
                ),
              ),
          if (percent != null)
            Container(
              margin: EdgeInsets.only(top: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '10',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: '/100',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                  GFProgressBar(
                    percentage: percent!,
                    lineHeight: 9,
                    backgroundColor: stringToColor('D9D9D9'),
                    type: GFProgressType.linear,
                    progressBarColor: Colors.green,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
