import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

///非首页，普通弹窗
class NoticeDialogStyle1 extends StatelessWidget {
  final NoticeItems notices;

  const NoticeDialogStyle1({
    Key? key,
    required this.notices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double contentHeight = 320.r;
    double contentWidth = 282.r;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: contentWidth,
            height: contentHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/home/pop_bg.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20.r,
                ),
                SizedBox(
                  height: 40.r,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 33.r,
                          width: 33.r,
                          child: SvgPicture.asset(
                            'assets/images/home/pop_tip.svg',
                          ),
                        ),
                        SizedBox(
                          width: 5.r,
                        ),
                        Text(
                          '温馨提示',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.r,
                ),
                Container(
                  height: 35.r,
                  width: 286.r,
                  child: Center(
                    child: Text(
                      notices.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: contentHeight - 115.r - 50.r,
                  margin: EdgeInsets.only(left: 10.r, right: 10.r),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: HtmlRenderer(
                      data: notices.body!,
                      style: {
                        'p': Style(
                          color: Colors.black,
                          fontSize: FontSize(17),
                        ),
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.r,
                ),
                Container(
                  width: 134,
                  height: 35.r,
                  decoration: BoxDecoration(
                    color: const Color(0xffC19E52),
                    // gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(17.5.r)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(Get.context!).pop();
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero)),
                    child: const Text(
                      '我知道了',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Transform.translate(
          //   offset: Offset(0.r, 190.r),
          //   child: Container(
          //     color: Color(0xfffffff),
          //     child: GestureDetector(
          //       onTap: Get.back,
          //       child: Image.asset(
          //         'assets/images/home/dialog_close.png',
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
