import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_schema.dart';

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
    return Container(
       // height: 50.r,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 15.r,right: 15.r),
      child: Column(
        children: [
          SizedBox(height: 18.r,),
          Text(
            title,
            style: TextStyle(
              color: isCheck ? AppTheme.activityTabSelect : AppTheme.activityTabNormal,
              fontSize: 16.sp,
              fontWeight: isCheck ? FontWeight.w600:FontWeight.w400,
              height: 1,
            ),
          ),
          SizedBox(height: 17.r,),
          isCheck ?Container(
            width: 75.r,
            height:2.r ,
            color: AppTheme.activityTabSelect,
          ):const SizedBox()
        ],
      )
    );
  }
}