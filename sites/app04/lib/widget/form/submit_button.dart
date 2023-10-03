import 'package:aone_common/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  final String title;

  const SubmitButton({
    Key? key,
    required this.onPress,
    required this.title,
  }) : super(key: key);

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 49),
            width: 279.w,
            height: 36.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(colors: [
                  stringToColor('429ffe'),
                  stringToColor('2f72f4')
                ])),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
