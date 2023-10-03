import 'package:aone_common/common.dart';
import 'package:app04/config/nav_handler.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdvertLayout extends StatelessWidget {
  final Widget? child;

  const AdvertLayout({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 需要过滤掉weizhi==1（轮播图）和没有图片的）
    final slideList = GlobalService.to.state.slideList.where(
      (p0) => p0.weizhi != 1 && p0.thumb != '',
    );
    return Stack(
      children: [
        child ?? const SizedBox.shrink(),
        ...slideList.map(
          (element) {
            Alignment? align;
            switch (element.weizhi) {
              case 2:
                align = Alignment.topLeft;
                break;
              case 3:
                align = Alignment.centerLeft;
                break;
              case 4:
                align = Alignment.bottomLeft;
                break;
              case 7:
                align = Alignment.topRight;
                break;
              case 6:
                align = Alignment.centerRight;
                break;
              case 5:
                align = Alignment.bottomRight;
                break;
            }
            return Align(
              alignment: align!,
              child: Obx(() {
                return Visibility(
                  visible: !element.isHidden.value,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 60.w),
                    child: _AdWidget(slide: element),
                  ),
                );
              }),
            );
          },
        ).toList()
      ],
    );
  }
}

class _AdWidget extends StatelessWidget {
  const _AdWidget({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final Slides slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (slide.path != null) {
              NavHandler().handle(slide.path!);
            }
          },
          child: CachedNetworkImage(
            imageUrl: staticImageResolver(slide.thumb!),
            width: 90.r,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        GestureDetector(
          onTap: () {
            slide.isHidden.value = true;
          },
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.grey,
              shape: CircleBorder(),
            ),
            child: Icon(
              Icons.close,
              size: 15.w,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
