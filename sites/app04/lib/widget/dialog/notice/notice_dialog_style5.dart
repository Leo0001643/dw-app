import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

///首页，普通模式的弹窗，其他地方用不到
class NoticeDialogStyle5 extends StatelessWidget {
  final NoticeItems notices;

  const NoticeDialogStyle5({
    Key? key,
    required this.notices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double contentHeight = 348.r;
    double contentWidth = 300.r;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: contentWidth,
            height: contentHeight,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  height: 44.r,
                  width: 290.r,
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
                const Divider(
                  height: 1,
                ),
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 10.r, right: 10.r, bottom: 10),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: HtmlRenderer(
                        data: notices.body!,
                        style: {
                          'p': Style(
                            color: Colors.black,
                          ),
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0.r, 190.r),
            child: Container(
              color: Color(0xfffffff),
              child: GestureDetector(
                onTap: Get.back,
                child: Image.asset(
                  'assets/images/home/dialog_close.png',
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
