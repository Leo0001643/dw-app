import 'package:flutter/material.dart';

//针对图片加载异常导致app黑屏问题
class DjImage extends StatelessWidget {
  final Image image;

//加载网络图片
  DjImage.network(String src,
      {Key? key, ImageErrorWidgetBuilder? errorBuilder,
        BoxFit? fit,
        double? height,
        double? width,
        Alignment alignment = Alignment.center,
        ImageLoadingBuilder? loadingBuilder})
      : image = Image.network(
    src,
    fit: fit,
    alignment: alignment,
    height: height,
    width: width,
    loadingBuilder: loadingBuilder,
    errorBuilder: errorBuilder ?? (context, object, stack) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
        ),
      );
    },
  ), super(key: key);

//加载本地图片
  DjImage.asset(String src,
      {Key? key, ImageErrorWidgetBuilder? errorBuilder,
        BoxFit? fit,
        double? height,
        double? width,
        Color? color,
        Alignment alignment = Alignment.center})
      : image = Image.asset(
    src,
    fit: fit,
    alignment: alignment,
    height: height,
    width: width,
    color: color,
    errorBuilder: errorBuilder ?? (context, object, stack) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
        ),
      );
    },
  ), super(key: key);

  @override
  Widget build(BuildContext context) {
    return image;
  }
}
