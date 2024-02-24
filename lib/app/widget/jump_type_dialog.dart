import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leisure_games/app/res/colorx.dart';
import 'package:leisure_games/app/res/imagex.dart';

import '../intl/intr.dart';

class JumpTypeDialog extends StatefulWidget {
  final String title;

  const JumpTypeDialog(this.title, {super.key});

  @override
  State<StatefulWidget> createState() => StateNoticeDialog();
}

class StateNoticeDialog extends State<JumpTypeDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                width: 0.9.sw,
                decoration: BoxDecoration(
                    color: ColorX.cardBg5(),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: ColorX.color_fc243b,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      width: 0.9.sw,
                      height: 42.h,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorX.textWhite(),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    InkWell(
                        child: jumpInApp(Intr().yingyongneijiazai),
                        onTap: () => Navigator.pop(context, true)),
                    InkWell(
                        child: jumpInApp(Intr().liulanqidakai),
                        onTap: () => Navigator.pop(context, false)),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  ImageX.icon_no,
                  width: 30.r,
                  height: 30.r,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget jumpInApp(text) {
    return Container(
      height: 46,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Color(0xFFE8E8E8),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16.0, color: ColorX.text3e3()),
          ),
          Expanded(
            child: Container(), // Add any widget you want here
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorX.color_fc243b, // You can change the color as needed
            ),
            child: Center(
              child: Text(
                Intr().xuanzhe,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
