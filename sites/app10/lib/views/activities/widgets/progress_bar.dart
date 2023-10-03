import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';

class TaskProgressBar extends StatelessWidget {
  final double percent;
  final String? total;
  final String? finish;
  const TaskProgressBar(
      {Key? key, required this.percent, required this.total, this.finish})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: RichText(
              text: TextSpan(
                  text: '${(percent * 100).toInt()}',
                  style: TextStyle(
                      color: AppTheme.primaryCardBackground,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  children: const [
                    TextSpan(
                      text: '/100',
                      style: TextStyle(
                          color: AppTheme.undeer_line_color1,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
            ),
          ),
          GFProgressBar(
            percentage: percent,
            padding: EdgeInsets.only(left: 0),
            lineHeight: 7.w,
//                progressHeadType: GFProgressHeadType.square,
//             child:Container(
//               child: Text(
//                 (percent*188).toString() + "%",
//                 textAlign: TextAlign.start,
//                 style: TextStyle(fontSize: 9.sp, color: Colors.white),
//               ),
//             ),
            backgroundColor: const Color(0xFFD9D9D9),
            linearGradient: const LinearGradient(colors: [
              const Color(0xFFD9D9D9),
              Color(0xFFFBE248),
              Color(0xFFD6AE33)
            ]),
            animation: true,
            animationDuration: 2000,
          ),
        ],
      ),
    );
  }
}
