


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AoneNetworkImage extends StatelessWidget {
   final String imageUrl;

  const AoneNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Widget current;
    current = CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      errorWidget: (_, __, ___) => const SizedBox.shrink(),
    );
    return current;
  }
}

