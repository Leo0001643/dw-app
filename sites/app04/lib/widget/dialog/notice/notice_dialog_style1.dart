import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../config/site_config.dart';
import '../../../theme/color_schema.dart';

///非首页，普通弹窗
class NoticeDialogStyle1 extends StatelessWidget {
  final NoticeItems notices;

  const NoticeDialogStyle1({
    Key? key,
    required this.notices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = 364.r;
    final double width = 289.r;
    final double padding = 10.r;

    if (isSiteTagH09) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 289.r,
            height: 336.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/home/${AppTheme.siteTag}_pop_bg.png",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.w,
                ),
                SizedBox(
                  height: 40.r,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30.w,
                          width: 30.w,
                          child: SvgPicture.asset(
                            'assets/images/home/pop_tip.svg',
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '温馨提示',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.w),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    physics: const BouncingScrollPhysics(),
                    child: HtmlRenderer(
                      data: notices.body!,
                      globalStyle: Style(
                        fontSize: FontSize.medium,
                      ),
                      style: {
                        'p': Style(
                          fontSize: FontSize.small,
                          color: Colors.white,
                        ),
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.w),
                      decoration: BoxDecoration(
                        gradient: AppTheme.primaryGradient,
                        borderRadius: const BorderRadius.all(Radius.circular(32)),
                      ),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(Get.context!).pop();
                        },
                        child: const Text(
                          '我知道了',
                          style: TextStyle(color: Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
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
                  height: 15.r,
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
                  height: 30.r,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: width - 2 * padding),
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
                  height: 210.r,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: padding, right: padding),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: HtmlRenderer(
                      data: notices.body,
                      style: {
                        'p': Style(
                          color: Colors.black,
                        ),
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.r,
                ),
                Container(
                  width: 135.r,
                  height: 28.r,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFF8B352),
                          Color(0xFFEF861D),
                        ]),
                    borderRadius: BorderRadius.all(Radius.circular(14)),
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
                )
              ],
            ),
          ),
          // Transform.translate(
          //   offset: Offset(0.r, 190.r),
          //   child: Container(
          //     color: const Color(0xfffffff),
          //     child: GestureDetector(
          //       onTap: Get.back,
          //       child: SvgPicture.asset(
          //         'assets/images/home/close.svg',
          //       ),
          //     ),
          //   ),
          // )
        ],
      );
    }
  }
}
