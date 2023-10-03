import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCheckRechargeWidget extends StatefulWidget {
  final ValueChanged<int>? changed;
  final bool isChecked;
  final int? selIndext;
  final String title;

  final Widget? iconChild;

  const ListCheckRechargeWidget(
      {Key? key,
      this.isChecked = false,
      required this.title,
      this.iconChild,
      this.changed,
      this.selIndext})
      : super(key: key);

  @override
  State<ListCheckRechargeWidget> createState() =>
      _ListCheckRechargeWidgetState();
}

class _ListCheckRechargeWidgetState extends State<ListCheckRechargeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        if (widget.changed != null) {
          widget.changed!.call(widget.selIndext!);
        }
      },
      child: Container(
        height: 42.r,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.isChecked
                  ? 'assets/images/common/left_checked_bg.png'
                  : 'assets/images/common/left_normal_bg.png'),
              fit: BoxFit.fill),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.r),
                child: widget.iconChild ?? const SizedBox.shrink()),
            Expanded(
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: widget.isChecked
                    ? TextStyle(
                        color: const Color(0xff2E1C07),
                        fontSize: 12.sp,
                      )
                    : TextStyle(
                        color: const Color(0xffE1CEAA),
                        fontSize: 12.sp,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
