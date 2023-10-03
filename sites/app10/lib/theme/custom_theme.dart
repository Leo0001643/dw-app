/*
 * @Author: your name
 * @Date: 2022-02-23 20:29:55
 * @LastEditTime: 2022-02-23 22:15:53
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /aone_flutter/lib/packages/e01/theme/customer_theme.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_schema.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
            backgroundColor: const Color.fromRGBO(2, 194, 133, 1),
          ),
      primaryColor: Color.fromRGBO(2, 194, 133, 1),
    );
  }

  static ThemeData get lightTheme {
    final _theme = ThemeData.light();
    return ThemeData(
      appBarTheme: _theme.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      splashColor: const Color.fromRGBO(217, 232, 255, 1),
      highlightColor: const Color.fromRGBO(228, 239, 255, 1),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      tabBarTheme: _theme.tabBarTheme.copyWith(),
    );
  }
}
