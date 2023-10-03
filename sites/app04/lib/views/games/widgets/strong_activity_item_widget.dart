import 'package:aone_common/common.dart';
// import 'package:app04/widget/misc/b33_loading.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/b55_loading.dart';

class StrongActivityItemWidget extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String? titlePrefixImg;
  final VoidCallback? onPress;

  const StrongActivityItemWidget(
      {Key? key,
      required this.title,
      required this.imgUrl,
      this.titlePrefixImg,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: ExtendedImage.network(
              imgUrl,
              width: 84.w,
              height: 84.w,
              fit: BoxFit.cover,
              cache: true,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                  case LoadState.failed:
                    return const Center(child: B55Loading());
                  case LoadState.completed:
                    return state.completedWidget;
                }
              },
            ),
          ),
          SizedBox(
            height: 4.r,
          ),
          Row(
            children: [
              if (titlePrefixImg != null)
                Image.network(
                  staticImageResolver(
                    titlePrefixImg,
                  ),
                  height: 20.r,
                  width: 20.r,
                  fit: BoxFit.contain,
                ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: const Color.fromRGBO(51, 51, 51, 1),
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
