import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/image_util.dart';
import 'package:app10/views/games/controllers/game_category_controller.dart';
import 'package:app10/widget/misc/dj_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class LikeView extends StatelessWidget {
  final AllGameItem gameChildren;

  const LikeView(this.gameChildren, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rate = double.parse(gameChildren.heat!) / 2.0;
    return Column(
      children: [
        Container(
          width: Get.width,
          height: 84.w,
          padding:
              EdgeInsets.only(left: 5.r, right: 10.r, top: 5.r, bottom: 5.r),
          decoration: BoxDecoration(
              color: AppTheme.gameCardColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageUtil.loadImage(
                    gameChildren.imgCn!,
                    width: 70.w,
                    height: 70.w,
                  ),
                  SizedBox(
                    width: 5.r,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            gameChildren.nameCn!,
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppTheme.gameTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!UserService.to.state.isRegularUser) {
                                SmartDialog.showToast('请登录正式账号');
                                return;
                              } else {
                                var model = FavoriteDto();
                                model.gameSubId = this.gameChildren.gameSubId!;
                                model.isCollect = this.gameChildren.isCollect!;
                                GameCategoryController.to.toggleFavorite(
                                    payload: model,
                                    subTag: Get.arguments.subTag);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.r),
                              child: DjImage.asset(
                                gameChildren.isCollect == 1
                                    ? 'assets/images/home/like_select.png'
                                    : 'assets/images/home/like_unselect.png',
                                width: 17.w,
                                height: 17.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              ""
                              "同时在线人数:",
                              style: TextStyle(
                                  color: AppTheme.gameTextColor,
                                  fontSize: 12.sp)),
                          SizedBox(
                            width: 5.r,
                          ),
                          Text(gameChildren.number!.toString(),
                              style: TextStyle(
                                  color: AppTheme.textRedColor,
                                  fontSize: 12.sp)),
                          if (rate != 0)
                            Row(
                              children: [
                                Text("评分:",
                                    style: TextStyle(
                                        color: AppTheme.gameTextColor,
                                        fontSize: 12.sp)),
                                Text("$rate",
                                    style: TextStyle(
                                        color: AppTheme.textRedColor,
                                        fontSize: 12.sp))
                              ],
                            )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     rate != 0
              //         ? Row(
              //             children: [
              //               Text("评分:",
              //                   style: TextStyle(
              //                       color: AppTheme.normalTextColor,
              //                       fontSize: 12.sp)),
              //               Text("$rate",
              //                   style: TextStyle(
              //                       color: AppTheme.textRedColor,
              //                       fontSize: 12.sp))
              //             ],
              //           )
              //         : SizedBox()
              //   ],
              // ),
            ],
          ),
          // child: Stack(
          //   children: [
          //     Positioned(
          //         left: 0,
          //         top: 0,
          //         bottom: 0,
          //         right: 0,
          //         child: Row(
          //           children: [
          //             ImageUtil.loadImage(
          //               gameChildren.imgCn!,
          //               width: 84.w,
          //               height: 84.w,
          //               bgColor: Colors.transparent,
          //             ),
          //             Container(
          //               margin: const EdgeInsets.only(left: 8, top: 8),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Container(
          //                     margin: const EdgeInsets.all(4),
          //                     child: Text(
          //                       gameChildren.nameCn!,
          //                       style: const TextStyle(
          //                           fontSize: 14,
          //                           color: Color.fromRGBO(11, 33, 59, 1),
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                   ),
          //                   Container(
          //                       margin: const EdgeInsets.all(4),
          //                       child: Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Row(
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.end,
          //                             children: [
          //                               CustomRating(
          //                                   max: 5,
          //                                   score: double.parse(
          //                                           gameChildren.heat!) /
          //                                       2.0,
          //                                   star: const Star(
          //                                       num: 5,
          //                                       fillColor: Color.fromRGBO(
          //                                           255, 208, 92, 1),
          //                                       fat: 0.6,
          //                                       size: 12,
          //                                       emptyColor: Color.fromRGBO(
          //                                           11, 33, 59, 0.3)),
          //                                   onRating: (s) {}),
          //                               Container(
          //                                 margin:
          //                                     const EdgeInsets.only(left: 4),
          //                                 child: Text(
          //                                   gameChildren.heat!.toString(),
          //                                   style: TextStyle(
          //                                     fontSize: 10,
          //                                     color:
          //                                         Color.fromRGBO(11, 33, 59, 1),
          //                                     height: 1.3,
          //                                   ),
          //                                 ),
          //                               ),
          //                               GestureDetector(
          //                                 onTap: () {
          //                                   var model = FavoriteDto();
          //                                   model.gameSubId =
          //                                       this.gameChildren.gameSubId!;
          //                                   model.isCollect =
          //                                       this.gameChildren.isCollect!;
          //                                   GameCategoryController.to
          //                                       .toggleFavorite(
          //                                           payload: model,
          //                                           subTag:
          //                                               Get.arguments.subTag);
          //                                 },
          //                                 child: Container(
          //                                   margin: EdgeInsets.only(left: 4),
          //                                   child: DjImage.asset(
          //                                     this.gameChildren.isCollect == 1
          //                                         ? 'assets/images/home/like_select.png'
          //                                         : 'assets/images/home/like_unselect.png',
          //                                     width: 12.w,
          //                                     height: 12.w,
          //                                     fit: BoxFit.fill,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       )),
          //                   Container(
          //                     padding: EdgeInsets.all(3.w),
          //                     margin: const EdgeInsets.only(left: 2, top: 5),
          //                     decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(4),
          //                         gradient: const LinearGradient(colors: [
          //                           Color.fromRGBO(47, 114, 245, 1),
          //                           Color.fromRGBO(66, 160, 254, 1)
          //                         ])),
          //                     child: Row(
          //                       mainAxisAlignment: MainAxisAlignment.center,
          //                       children: [
          //                         DjImage.asset(
          //                           'assets/images/home/people.png',
          //                           width: 17.w,
          //                           height: 17.w,
          //                           fit: BoxFit.fill,
          //                         ),
          //                         Container(
          //                           margin: const EdgeInsets.only(
          //                               left: 2, right: 4),
          //                           child: Text(
          //                             gameChildren.number!.toString(),
          //                             style: TextStyle(
          //                                 color:
          //                                     Color.fromRGBO(255, 255, 255, 1),
          //                                 fontSize: 10,
          //                                 fontWeight: FontWeight.bold),
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         )),
          //     Positioned(
          //         right: 14,
          //         bottom: 10,
          //         child: Container(
          //           width: 46,
          //           height: 18,
          //           margin: const EdgeInsets.only(right: 4),
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(4),
          //               gradient: const LinearGradient(colors: [
          //                 Color.fromRGBO(47, 114, 245, 1),
          //                 Color.fromRGBO(66, 160, 254, 1)
          //               ])),
          //           child: const Text(
          //             '立即进入',
          //             style: TextStyle(
          //               fontSize: 8,
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               height: 1.3,
          //             ),
          //           ),
          //         ))
          //   ],
          // ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
