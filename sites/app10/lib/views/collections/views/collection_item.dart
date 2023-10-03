import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_star/custom_rating.dart';
import 'package:flutter_star/star.dart';
import 'package:get/get.dart';

import '../../../widget/misc/dj_image.dart';

class CollectionItem extends StatelessWidget {
  final FavoriteItems gameChildren;

  const CollectionItem(this.gameChildren, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _itemWidget());
  }

  Widget _itemWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DjImage.network(
            gameChildren.imgCn!,
            width: 84.w,
            height: 84.w,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          child: Text(
            gameChildren.nameCn!,
            style: const TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(102, 102, 102, 1),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
