import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';

import '../../../theme/color_schema.dart';

class EnvelopeFieldCell extends StatelessWidget {
  final MainAxisAlignment mainAxis;
  final CrossAxisAlignment crossAxis;
  final String label;
  final String? content;
  final Widget? child;
  double? percent;
  String? percentStr;
  final String? total;
  final String? finish;
  final bool? isprocess;
  final String? sencondContentHighlight;
  final String? sencondContent;

  EnvelopeFieldCell(
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
    double percentTemp = percent ?? 0;
    var offset =
        percentTemp * 300 > 30 ? percentTemp * 300 - 30 : percentTemp * 300;
    return Column(
      mainAxisAlignment: mainAxis,
      crossAxisAlignment: crossAxis,
      children: [
        SizedBox(
          height: 15.w,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primaryCardBackground,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: TextStyle(
              color: Colors.black,
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
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
        if (percent != null)
          Container(
            margin: EdgeInsets.only(top: 9.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0, bottom: 5),
                  child: RichText(
                    text: TextSpan(
                        text: double.parse(finish ?? "0.00").toStringAsFixed(2),
                        style: TextStyle(
                            color: AppTheme.primaryCardBackground,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: "/" +
                                double.parse(total ?? "0.00")
                                    .toStringAsFixed(2),
                            style: const TextStyle(
                                color: AppTheme.undeer_line_color1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GFProgressBar(
                      percentage: percent!,
                      lineHeight: 9,
                      backgroundColor: stringToColor('D9D9D9'),
                      type: GFProgressType.linear,
                      progressBarColor: AppTheme.primary,
                    ),
                    Positioned(
                        top: -4,
                        left: offset,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 5, top: 2, bottom: 1, right: 5),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryCardBackground,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Text(
                            percentStr!.toString() + '%',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ))
                  ],
                ),
              ],
            ),
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
                            color: AppTheme.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: '/100',
                            style: TextStyle(
                                color: AppTheme.undeer_line_color1,
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
                    progressBarColor: AppTheme.primary,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
