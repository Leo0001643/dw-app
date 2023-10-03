import 'package:app10/theme/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordSearchButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  const RecordSearchButton(this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 60.r,
        // margin: const EdgeInsets.only(top: 0, left: 6),
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: AppTheme.primaryGradient),
        height: 30.r,
        child: const Text("搜索",
            style: TextStyle(color: Colors.white, fontSize: 12)),
      ),
    );
  }
}
