import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_star/custom_rating.dart';
import 'package:flutter_star/star.dart';
import 'package:get/get.dart';

import '../../../widget/misc/dj_image.dart';
import '../controllers/collections_controller.dart';

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
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 84.w,
          height: 84.w,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: DjImage.network(
              gameChildren.imgCn!,
              fit: BoxFit.cover,
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            CollectionsController.to.removeFavorite(
                gameSubId: gameChildren.gameSubId!, showToast: true);
          },
          child: Container(
              constraints: BoxConstraints(maxWidth: 80.r),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    constraints: BoxConstraints(maxWidth: 64.r,minWidth: 0),
                    child: Text(
                      gameChildren.nameCn!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                    height: 16.w,
                    child: gameChildren.isCollect == 1
                        ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 15.w,
                    )
                        : Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 15.w,
                    ),
                  ),

                ],
              )),
        )
      ],
    );
  }

}
