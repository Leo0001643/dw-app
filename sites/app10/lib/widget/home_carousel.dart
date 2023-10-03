import 'package:aone_common/data/model/entities/webui/home.dart';
import 'package:aone_common/services/global/global_service.dart';
import 'package:aone_common/utils/assets.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  ValueNotifier<int> currentIndex = ValueNotifier<int>(1);
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Stack(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
                height: 125.r,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (value, reason) {
                  currentIndex.value = value + 1;
                }),
            itemCount: _slideList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final item = _slideList[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                  image: item.thumb != null ? DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      staticImageResolver(item.thumb),
                    ),
                  ) : null,
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 40.r,
              height: 18.r,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/home/num_bg.png',
                  ),
                ),
              ),
              child: Transform.translate(
                offset: Offset(3.r, 0),
                child: ValueListenableBuilder<int>(
                  builder: (_, value, __) {
                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: value.toString(),
                          ),
                          const TextSpan(text: '/'),
                          TextSpan(text: _slideList.length.toString()),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1.5.r,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    );
                  },
                  valueListenable: currentIndex,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}