import 'package:app10/theme/color_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YouHuiTabBarTitle extends StatelessWidget {
  final String title;
  final bool isCheck;

  const YouHuiTabBarTitle({
    Key? key,
    required this.title,
    this.isCheck = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          height: 34.r,
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          decoration: BoxDecoration(
            color: isCheck
                ? AppTheme.activityMenuSelectedBg
                : AppTheme.activityItemBg,
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
            border: Border.all(width: 1, color: AppTheme.activityBorderColor),
          ),
          child: Text(
            title,
            style: TextStyle(
              color:
                  isCheck ? const Color(0xffFFFFFF) : const Color(0xFF999999),
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}

// class YouHuiTabBarTitle extends StatelessWidget {
//   final String title;
//   final bool isCheck;
//   const YouHuiTabBarTitle({
//     Key? key,
//     required this.title,
//     this.isCheck = false,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 40.r,
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(left: 15.r),
//         padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 10.r),
//         decoration: BoxDecoration(
//             color: isCheck
//                 ? AppTheme.activityMenuSelectedBg
//                 : AppTheme.activityMenuUnselectedBg,
//             borderRadius: BorderRadius.circular(4.r)),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: isCheck
//                 ? AppTheme.activityMenuUnselectedBg
//                 : AppTheme.activityMenuSelectedBg,
//             fontSize: 16.sp,
//             fontWeight: isCheck ? FontWeight.w600 : FontWeight.w400,
//             height: 1,
//           ),
//         ));
//   }
// }
