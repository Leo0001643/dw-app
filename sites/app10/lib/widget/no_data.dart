import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoData extends StatelessWidget {
  final String title;
  final double? verticalOffset;
  final Color? titleColor;

  const NoData(
      {Key? key, this.verticalOffset, required this.title, this.titleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: (verticalOffset ?? 0) * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/common/no_data_img.png',
              width: 225.r,
              // height: 199,
            ),
            Text(
              title,
              style: TextStyle(color: titleColor ?? Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
