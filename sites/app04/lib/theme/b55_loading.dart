import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../config/site_config.dart';
import 'color_schema.dart';

class B55Loading extends StatelessWidget {
  const B55Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        // "assets/json/lottie_loading.json",
        "assets/json/${AppRuntimeConfig.siteTag}_loading.json",

        fit: BoxFit.contain,
        width: 250.r,
        animate: true,
      ),
    );
  }
}
