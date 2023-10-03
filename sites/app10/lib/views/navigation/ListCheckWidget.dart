import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCheckWidget extends StatefulWidget {
  final ValueChanged<int>? changed;
  final bool isChecked;
  final int? selIndext;
  final String title;
  final double? itemHeight;

  final Widget? iconChild;

  final MainAxisAlignment aligenment;

  final double? titleWidth;

  const ListCheckWidget(
      {Key? key,
      this.isChecked = false,
      required this.title,
      this.iconChild,
      this.changed,
      this.selIndext,
      this.titleWidth,
      this.aligenment = MainAxisAlignment.center,
      this.itemHeight})
      : super(key: key);

  @override
  State<ListCheckWidget> createState() => _ListCheckWidgetState();
}

class _ListCheckWidgetState extends State<ListCheckWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.itemHeight ?? 44),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.isChecked
              ? 'assets/images/common/left_checked_bg.png'
              : 'assets/images/common/left_normal_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {

          if (widget.changed != null) {
            widget.changed!.call(widget.selIndext!);
          }
          setState(() {});
        },
        child: Row(
          mainAxisAlignment: widget.aligenment,
          children: [
            if (widget.iconChild != null)
              widget.iconChild!,
            SizedBox(
              width: widget.titleWidth,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  color: widget.isChecked
                      ? const Color(0xff2E1C07)
                      : const Color(0xffE1CEAA),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
