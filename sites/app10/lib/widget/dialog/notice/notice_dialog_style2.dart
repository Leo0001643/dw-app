import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../theme/color_schema.dart';

///首页，滚动弹窗

class NoticeDialogStyle2 extends StatefulWidget {
  final List<NoticeItems> notices;

  const NoticeDialogStyle2({
    Key? key,
    required this.notices,
  }) : super(key: key);

  @override
  State<NoticeDialogStyle2> createState() => _NoticeDialogStyle2State();
}

class _NoticeDialogStyle2State extends State<NoticeDialogStyle2> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double contentHeight = 348.r;
    double contentWidth = 300.r;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: contentWidth,
                height: contentHeight,
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: contentHeight,
                    viewportFraction: 1,
                    reverse: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  items: widget.notices
                      .map(
                        (e) => Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Container(
                              // color: Colors.teal,
                              padding: EdgeInsets.symmetric(vertical: 15.r),
                              child: HtmlRenderer(
                                data: e.body!,
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
                  )
                      .toList(),
                ),),
            Transform.translate(
              offset: Offset(0, ((contentHeight / 2) -50).r),
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: widget.notices.length,
                effect: ScrollingDotsEffect(
                  dotColor: AppTheme.disabled,
                  activeDotColor: AppTheme.primary,
                  dotHeight: 8.sp,
                  dotWidth: 8.sp,
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Image.asset(
              'assets/images/home/dialog_close.png',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
          ),
        )
      ],
    );
  }
}
