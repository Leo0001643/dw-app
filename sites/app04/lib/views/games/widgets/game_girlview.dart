import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/image_util.dart';
import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_star/custom_rating.dart';
import 'package:flutter_star/star.dart';
import 'package:get/get.dart';

class GameGridSpan extends StatelessWidget {
  final AllGameItem gameChildren;

  const GameGridSpan(this.gameChildren, {Key? key}) : super(key: key);

  bool get isMaintaining => gameChildren.state == 3;

  @override
  Widget build(BuildContext context) {
    return _itemWidget();
  }

  Widget _itemWidget() {
    printInfo(
        info: "名称 == ${gameChildren.nameCn} 图片链接 =  ${gameChildren.imgCn} ");

    return ClipRRect(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(
              height: 84.r,
              width: 84.r,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageUtil.loadImage(gameChildren.imgCn!,
                        height: 84.r, width: 84.r, bgColor: Colors.transparent),
                    if (isMaintaining)
                      Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              "assets/images/game_init/ic_game_maintaining.png",
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              '该游戏正在维护中',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.w,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.r,
            ),
            GestureDetector(
              onTap: () {
                if (isMaintaining) {
                  SmartDialog.showToast('${gameChildren.nameCn}  正在维护中');
                  return;
                }
                var model = FavoriteDto();
                model.gameSubId = gameChildren.gameSubId!;
                model.isCollect = gameChildren.isCollect!;
                GameCategoryController.to.toggleFavorite(
                    payload: model, subTag: Get.arguments.subTag);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 72.r,
                    child: Text(
                      gameChildren.nameCn!,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 12.r,
                        color: AppTheme.normalTextColor,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: gameChildren.isCollect == 1
                        ? Icon(
                            Icons.favorite,
                            size: 12.w,
                            color: const Color(0xffFF0406),
                          )
                        : Icon(
                            Icons.favorite_border,
                            size: 12.w,
                            color: const Color(0xff5A5A5A),
                          ),
                  ),
                ],
              ),
            )
          ],
        ));
    // return ClipRRect(
    //   clipBehavior: Clip.antiAlias,
    //   borderRadius: BorderRadius.circular(5.r),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       SizedBox(
    //         height: 84.r,
    //         width: 84.r,
    //         child: Stack(
    //           children: <Widget>[
    //             ImageUtil.loadImage(gameChildren.imgCn!,
    //                 height: 84.r, width: 84.r, bgColor: Colors.transparent),
    //           ],
    //         ),
    //       ),
    //       DecoratedBox(
    //         decoration: BoxDecoration(
    //           color: const Color.fromRGBO(242, 245, 248, 1),
    //           borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(5.r),
    //             bottomRight: Radius.circular(5.r),
    //           ),
    //         ),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             Container(
    //               margin: const EdgeInsets.all(4),
    //               child: Text(
    //                 gameChildren.nameCn!,
    //                 maxLines: 1,
    //                 overflow: TextOverflow.ellipsis,
    //                 style: const TextStyle(
    //                     fontSize: 14,
    //                     color: Color.fromRGBO(11, 33, 59, 1),
    //                     fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.only(left: 4, bottom: 4, right: 4),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Row(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       Container(
    //                         margin: const EdgeInsets.only(left: 4),
    //                         child: Text(
    //                           gameChildren.heat!.toString(),
    //                           style: const TextStyle(
    //                             fontSize: 10,
    //                             color: Color.fromRGBO(11, 33, 59, 1),
    //                             height: 1.3,
    //                           ),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                   Container(
    //                     width: 46,
    //                     height: 18,
    //                     margin: const EdgeInsets.only(right: 4),
    //                     alignment: Alignment.center,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(4),
    //                         gradient: const LinearGradient(colors: [
    //                           Color.fromRGBO(47, 114, 245, 1),
    //                           Color.fromRGBO(66, 160, 254, 1)
    //                         ])),
    //                     child: const Text(
    //                       '立即进入',
    //                       style: TextStyle(
    //                         fontSize: 8,
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.bold,
    //                         height: 1.3,
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
