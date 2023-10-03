import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static Widget loadImage(
    String url, {
    Color bgColor = Colors.grey,
    double? height,
    double? width,
  }) {
    return ExtendedImage.network(
      url,
      fit: BoxFit.fill,
      cache: true,
      height: height,
      width: width,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Container(
              color: bgColor,
              child: const CupertinoActivityIndicator(),
            );
          case LoadState.failed:
            if (url == '') {
              return Container(
                color: bgColor,
              );
            }
            return GestureDetector(
              onTap: () {
                state.reLoadImage();
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text('加载失败，点击重试'),
              ),
            );
          case LoadState.completed:
            return null;
        }
      },
    );
  }
}
