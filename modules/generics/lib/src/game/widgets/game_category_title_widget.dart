import 'package:aone_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/game_category_controller.dart';

class GameCategoryTitleWidget extends StatelessWidget {
  const GameCategoryTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 102.r,
            height: 26.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17.r)),
                border: Border.all(
                    color: AoneAppTheme.appTheme.categoryAppBarIconColor ??
                        Colors.white)),
            margin: EdgeInsets.only(left: 20.w),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    GameCategoryController.to.argsments.nameCn,
                    style: TextStyle(
                      color: AoneAppTheme.appTheme.categoryAppBarIconColor ??
                          Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    child: Image.asset(
                      GameCategoryController.to.showDialogOpen
                          ? 'assets/images/home/up.png'
                          : 'assets/images/home/down.png',
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
      onTap: () {
        GameCategoryController.to.getGameCategoryData();
        // print('type ==${GameCategoryController.to.type}');

        // for (int i = 0;
        //     i < GameCategoryController.to.navconfigCategory.subChildren!.length;
        //     i++) {
        //   SubChildren subChildren =
        //       GameCategoryController.to.navconfigCategory.subChildren![i];
        //   print('名称 ==${subChildren.nameCn}');
        // }
        GameCategoryController.to.showDialogOpen =
            !GameCategoryController.to.showDialogOpen;
        // Get.dialog(
        //   GestureDetector(
        //     onTap: () {
        //       Get.back();
        //       GameCategoryController.to.showDialogOpen =
        //           !GameCategoryController.to.showDialogOpen;
        //     },
        //     child: Container(
        //       color: Colors.transparent,
        //       alignment: Alignment.topCenter,
        //       child: Container(
        //           margin:
        //               EdgeInsets.only(top: 8.w + ScreenUtil().statusBarHeight),
        //           width: Get.width,
        //           padding:
        //               EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.w),
        //           decoration: _theme.categoryTitleWidgetDecoration,
        //           child: GridView.builder(
        //             shrinkWrap: true,
        //             itemCount: GameCategoryController.to.type == 2
        //                 ? GameCategoryController
        //                     .to.navconfigCategory.subChildren!.length
        //                 : GameCategoryController
        //                         .to.navconfigCategory.subChildren!.length +
        //                     1,
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 5,
        //               mainAxisSpacing: 15.w,
        //               crossAxisSpacing: 7.w,
        //             ),
        //             itemBuilder: (context, index) {
        //               return GestureDetector(
        //                 onTap: () {
        //                   Get.back();
        //                   GameCategoryController.to.showDialogOpen =
        //                       !GameCategoryController.to.showDialogOpen;
        //                   if (index == 0) {
        //                     Get.back();
        //                     Get.toNamed(Routes.strongActivity);
        //                     return;
        //                   }
        //                   // print('1111-222222-33333');
        //                   // print(GameCategoryController.to.argsments);
        //
        //                   GameCategoryController.to.argsments =
        //                       GameCategoryController
        //                           .to.navconfigCategory.subChildren![index];
        //                   GameCategoryController.to
        //                       .refreshNewFactoryTotalData();
        //                   // GameCategoryController.to.state.pagingController.refresh();
        //                 },
        //                 child: Opacity(
        //                   opacity: index == 0
        //                       ? 1
        //                       : GameCategoryController
        //                                   .to
        //                                   .navconfigCategory
        //                                   .subChildren![
        //                                       GameCategoryController.to.type ==
        //                                               2
        //                                           ? index
        //                                           : index - 1]
        //                                   .gameTag ==
        //                               GameCategoryController
        //                                   .to.argsments.gameTag!
        //                           ? 1
        //                           : 1,
        //                   child: Column(
        //                     children: [
        //                       Container(
        //                         width: 65.w,
        //                         height: 40.w,
        //                         child: DjImage.network(
        //                           GameCategoryController.to.gainImageUrl(index),
        //                           fit: BoxFit.contain,
        //                           loadingBuilder:
        //                               (context, child, loadingProgress) {
        //                             if (loadingProgress == null) return child;
        //                             return const GFLoader();
        //                           },
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 5.w,
        //                       ),
        //                       Text(
        //                         index == 0
        //                             ? "强档活动"
        //                             : GameCategoryController
        //                                 .to
        //                                 .navconfigCategory
        //                                 .subChildren![
        //                                     GameCategoryController.to.type == 2
        //                                         ? index
        //                                         : index - 1]
        //                                 .nameCn!,
        //                         style: TextStyle(
        //                             fontSize: 10.sp,
        //                             color: index == 0
        //                                 ? _theme.categoryTitleWidgetColor
        //                                 : GameCategoryController
        //                                             .to
        //                                             .navconfigCategory
        //                                             .subChildren![
        //                                                 GameCategoryController
        //                                                             .to.type ==
        //                                                         2
        //                                                     ? index
        //                                                     : index - 1]
        //                                             .gameTag ==
        //                                         GameCategoryController
        //                                             .to.argsments.gameTag!
        //                                     ? Colors.white
        //                                     : _theme.categoryTitleWidgetColor
        //                             // : AppTheme.hintColor
        //                             ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               );
        //             },
        //           )),
        //     ),
        //   ),
        // );
        // Get.defaultDialog(
        //   // onWillPop: () {
        //   //   print('');
        //   // },
        //   onWillPop: () async {
        //     Get.back();
        //     HomePageController.to.showDialogOpen =
        //         !HomePageController.to.showDialogOpen;
        //     return false;
        //   },
        //   title: '',
        //   titlePadding: EdgeInsets.zero,
        //   contentPadding: EdgeInsets.zero,
        //   backgroundColor: Colors.red,
        //   radius: 0.r,
        //   content: Container(
        //       width: Get.width,
        //       height: 389.w,
        //       padding: EdgeInsets.only(top: 15.r),
        //       decoration: BoxDecoration(
        //         gradient: LinearGradient(colors: [
        //           stringToColor('13805E'),
        //           stringToColor('06C285'),
        //         ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        //       ),
        //       child: GridView.builder(
        //         shrinkWrap: true,
        //         itemCount: GameCategoryController.to.type == 2
        //             ? GameCategoryController
        //                 .to.navconfigCategory.subChildren!.length
        //             : GameCategoryController
        //                     .to.navconfigCategory.subChildren!.length +
        //                 1,
        //         // physics: NeverScrollableScrollPhysics(),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 4,
        //           mainAxisSpacing: 2.w,
        //           crossAxisSpacing: 2.w,
        //           childAspectRatio: 0.7,
        //         ),
        //         itemBuilder: (context, index) {
        //           return GestureDetector(
        //             onTap: () {
        //               Get.back();
        //               HomePageController.to.showDialogOpen =
        //                   !HomePageController.to.showDialogOpen;
        //               if (index == 0) {
        //                 Get.back();
        //                 Get.toNamed(Routes.strongActivity);
        //                 return;
        //               }
        //               print('1111-222222-33333');
        //               print(GameCategoryController.to.argsments);
        //
        //               GameCategoryController.to.argsments =
        //                   GameCategoryController
        //                       .to.navconfigCategory.subChildren![index];
        //
        //               GameCategoryController.to.refreshNewFactoryTotalData();
        //               // GameCategoryController.to.state.pagingController.refresh();
        //             },
        //             child: Opacity(
        //               opacity: index == 0
        //                   ? 1
        //                   : GameCategoryController
        //                               .to
        //                               .navconfigCategory
        //                               .subChildren![
        //                                   GameCategoryController.to.type == 2
        //                                       ? index
        //                                       : index - 1]
        //                               .gameTag ==
        //                           GameCategoryController.to.argsments.gameTag!
        //                       ? 1
        //                       : 1,
        //               child: Column(
        //                 children: [
        //                   Container(
        //                     child: DjImage.network(
        //                       GameCategoryController.to.gainImageUrl(index),
        //                       width: 65.w,
        //                       height: 40.w,
        //                       fit: BoxFit.contain,
        //                       loadingBuilder:
        //                           (context, child, loadingProgress) {
        //                         if (loadingProgress == null) return child;
        //                         return const GFLoader();
        //                       },
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 5.w,
        //                   ),
        //                   LightText.buildColorFont(
        //                       index == 0
        //                           ? "强档活动"
        //                           : GameCategoryController
        //                               .to
        //                               .navconfigCategory
        //                               .subChildren![
        //                                   GameCategoryController.to.type == 2
        //                                       ? index
        //                                       : index - 1]
        //                               .nameCn!,
        //                       index == 0
        //                           ? AppTheme.hintColor
        //                           : GameCategoryController
        //                                       .to
        //                                       .navconfigCategory
        //                                       .subChildren![
        //                                           GameCategoryController
        //                                                       .to.type ==
        //                                                   2
        //                                               ? index
        //                                               : index - 1]
        //                                       .gameTag ==
        //                                   GameCategoryController
        //                                       .to.argsments.gameTag!
        //                               ? Colors.white
        //                               : AppTheme.hintColor,
        //                       10.sp)
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //       )),
        // );
      },
    );
  }
}
