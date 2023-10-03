import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoData extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final bool? isHideImage;

  const NoData(
      {Key? key, required this.title, this.titleColor, this.isHideImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (isHideImage != true)

            ///项目必须包含这种图片
            Image.asset('assets/images/common/no_data_img.png'),
          SizedBox(height: 10.r),
          Text(
            title,
            style: TextStyle(color: titleColor),
          ),
        ],
      ),
    );
  }
}
