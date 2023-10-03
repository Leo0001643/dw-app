import 'package:aone_common/common.dart';
import 'package:app04/config/nav_handler.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final RxList<Slides> _slideList = RxList.empty();

  @override
  void initState() {
    if (GlobalService.to.state.slideList.isEmpty) {
      _slideList.add(Slides());
    } else {
      GlobalService.to.state.slideList.forEach((element) {
        if (element.weizhi == 1) {
          _slideList.add(element);
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('滚动的个数：${_slideList.length}');
    return Stack(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(milliseconds: 1500),
              height: 160.r,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (value, reason) {
                currentIndex.value = value;
              }),
          itemCount: _slideList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final item = _slideList[index];
            return GestureDetector(
              onTap: () {
                if (item.path != null) {
                  NavHandler().handle(item.path!);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  image: item.thumb != null
                      ? DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            staticImageResolver(item.thumb),
                          ),
                        )
                      : null,
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Container(
            width: 40.r,
            height: 18.r,
            alignment: Alignment.center,
            child: ValueListenableBuilder<int>(
              builder: (_, value, __) {
                return CarouselIndicator(
                  cornerRadius: 40,
                  width: 10,
                  height: 10,
                  activeColor: AppTheme.primary,
                  count: _slideList.length,
                  index: currentIndex.value,
                );
              },
              valueListenable: currentIndex,
            ),
          ),
        )
      ],
    );
  }
}
