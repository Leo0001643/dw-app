import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'record_button.dart';

class BillTopMenu extends StatefulWidget {
  Color? bgColor;
  final bool isMainMenuOpen;
  final bool isSubMenuOpen;
  final ValueChanged<bool> onTypeChange;

  final bool isTypeOpen;
  final String? typeTitle;
  final VoidCallback isTypeTap;

  BillTopMenu(
      {Key? key,
      required this.isSubMenuOpen,
      required this.isMainMenuOpen,
      this.bgColor,
      required this.onTypeChange,
      required this.isTypeOpen,
      required this.isTypeTap,
      this.typeTitle})
      : super(key: key);

  @override
  State<BillTopMenu> createState() => _BillTopMenuState();
}

class _BillTopMenuState extends State<BillTopMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.r,
      padding: EdgeInsets.symmetric(horizontal: 19.r),
      margin: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(color: widget.bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: RecordArrowButton(
              title: widget.typeTitle ?? '',
              isOpen: widget.isTypeOpen,
              onTap: () {
                widget.isTypeTap();
              },
            ),
          ),
          RecordArrowButton(
            title: '今日',
            isOpen: widget.isMainMenuOpen,
          ),
        ],
      ),
    );
  }
}
