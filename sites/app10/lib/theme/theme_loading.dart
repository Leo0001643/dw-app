import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ThemeLoading extends StatelessWidget {
  const ThemeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/json/loading.json",
        fit: BoxFit.contain,
        width: 250.r,
        animate: true,
      ),
    );
  }
}

class ThemeImageErrorWidget extends StatelessWidget {
  const ThemeImageErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/common/image_error.png'));
  }
}
