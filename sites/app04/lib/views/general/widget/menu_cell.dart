// import 'package:app01/views/task_center/widgets/progress_bar.dart';
import 'package:aone_common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuCell extends StatelessWidget {
  final int index;
  final Navconfig? navconfig;
  final int listIcon;

  const MenuCell(
      {Key? key, required this.index, this.navconfig, required this.listIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.r,
      height: 60.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            listIcon == 0
                ? 'assets/images/home/item_select.png'
                : 'assets/images/home/item_unselect.png',
          )
        )
      ),
      child: Transform.translate(
        offset: const Offset(0, -3),
        child: Text(
          navconfig!.name!,
          style: TextStyle(
            color: listIcon == 0
                ? Colors.white
                : const Color.fromRGBO(157, 169, 183, 1),
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
