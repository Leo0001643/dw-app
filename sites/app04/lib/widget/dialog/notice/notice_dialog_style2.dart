import 'package:aone_common/data/model/entities/notice/Items.dart';
import 'package:aone_widget/aone_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/site_config.dart';
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

  double contentHeight = 380;

  @override
  Widget build(BuildContext context) {
    double h09Height = 380.r;
    double h09Width = 300.r;

    if (isSiteTagH09) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: h09Width,
            height: h09Height,
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: CarouselSlider(
              options: CarouselOptions(
                height: h09Height,
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
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.r),
                                child: HtmlRenderer(
                                  data: e.body!,
                                  style: {
                                    'p': Style(
                                      color: Colors.white,
                                    ),
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          Transform.translate(
            offset: Offset(0, ((h09Height / 2) - 40.r)),
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
          Transform.translate(
            offset: Offset(0, ((contentHeight / 2) - 10).r),
            child: GestureDetector(
              onTap: Get.back,
              child: Image.asset(
                'assets/images/home/dialog_close.png',
                color: Colors.white,
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300.w,
          height: (contentHeight).w,
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: CarouselSlider(
            options: CarouselOptions(
              height: (contentHeight).w,
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
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.r),
                              child: HtmlRenderer(
                                data: e.body!,
                                style: {
                                  'p': Style(
                                    color: Colors.white,
                                  ),
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        Transform.translate(
          offset: Offset(0, ((contentHeight / 2) - 90).r),
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
        Transform.translate(
          offset: Offset(0, ((contentHeight / 2) - 10).r),
          child: GestureDetector(
            onTap: Get.back,
            child: Image.asset(
              'assets/images/home/dialog_close.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
          ),
        )
      ],
    );
  }
}
