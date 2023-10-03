import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widget/no_data.dart';
import '../controllers/game_search_controller.dart';

class GameSearchView extends GetView<GameSearchController> {
  const GameSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      appBar: _appBar(),
      body: _pageStateBuilder(),
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: SizedBox(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 25.w,
            color: Colors.white,
          ),
        ),
      ),
      flexibleSpace: Container(
        color: AppTheme.primaryOne,
      ),
      title: Container(
        padding: EdgeInsets.only(left: 15.r, right: 15.r),
        alignment: Alignment.center,
        color: const Color(0xFF252525),
        height: 35.r,
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(
              'assets/images/game_init/search.png',
              width: 15,
            ),
            SizedBox(width: 10.r),
            Expanded(
              child: TextField(
                controller: controller.textCn,
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
                onChanged: (val) => controller.searchValue = val,
                // focusNode: controller.accountFocus,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 0.r, bottom: 0.r),
                    iconColor: AppTheme.cardUnSelectColor,
                    hintStyle: TextStyle(
                        fontSize: 15.sp, color: const Color(0xFF464646)),
                    hintText: "游戏名称搜索"),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Obx(() {
          return controller.searchValue.isNotEmpty
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.textCn.clear();
                    controller.searchValue = '';
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Image.asset(
                        'assets/images/game_init/close.png',
                        width: 20,
                      )),
                )
              : const SizedBox.shrink();
        })
      ],
    );
  }

  Widget _pageStateBuilder() {
    return Obx(() {
      if (controller.pageState == PageState.loading) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
            valueColor: AlwaysStoppedAnimation(
              AppTheme.loadingColor,
            ),
          ),
        );
      }
      return Column(
        children: [
          if (controller.searchValue.isEmpty)
            Container(
              margin: EdgeInsets.only(top: 15.r, bottom: 8.r, left: 12.r),
              width: double.infinity,
              child: Text(
                controller.searchValue != '' ? '搜索结果' : '热门搜索',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          if (controller.searchValue == '') _hotSearch(),
          if (controller.searchValue != '') _resultSearch(),
        ],
      );
    });
  }

  Widget _hotSearch() {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          children: controller.hotSearchGames
              .map(
                (element) => GestureDetector(
                  onTap: () => onBeforeGameInit(onGameParams: element),
                  child: _itemWrap(element.gameTag!, element.nameCn ?? ''),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _resultSearch() {
    if (controller.searchResult.isEmpty) {
      return const Expanded(
        child: NoData(
          title: '未找到符合相关条件的游戏',
        ),
      );
    }
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          children: controller.searchResult
              .map(
                (element) => GestureDetector(
                  onTap: () => onBeforeGameInit(onGameParams: element),
                  child: _itemWrap(element.gameTag!, element.name ?? ''),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _itemWrap(String gameTag, String nameCn) {
    return Container(
        width: ScreenUtil().screenWidth / 2,
        height: 45.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
        decoration: BoxDecoration(
          color: const Color(0xFF171717),
          border: Border.all(
            width: 3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 25.w,
              height: 25.w,
              child: Image.network(
                staticImageResolver(
                  '/static/comm/gameImage/wap/140-104/' + gameTag + '.png',
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Text(
                nameCn,
                style: TextStyle(
                  fontSize: 14.w,
                  color: Colors.white,
                  height: 18 / 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ));
  }

  // Widget _searchResult() {
  //   return Expanded(
  //     child: GridView.builder(
  //       padding: EdgeInsets.only(
  //         top: 15.r,
  //         bottom: 15.r + Get.mediaQuery.viewPadding.bottom,
  //         left: 12.r,
  //         right: 12.r,
  //       ),
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       itemCount: controller.searchResult.length,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         childAspectRatio: 5.767,
  //         mainAxisSpacing: 8,
  //         crossAxisSpacing: 5,
  //       ),
  //       itemBuilder: (context, index) {
  //         var item = controller.searchResult[index];
  //         return GestureDetector(
  //           onTap: () => onBeforeGameInit(onGameParams: item),
  //           child: Container(
  //             height: 35.r,
  //             margin: EdgeInsets.only(bottom: 5.r),
  //             padding: EdgeInsets.symmetric(horizontal: 15.r),
  //             decoration: BoxDecoration(
  //               color: AppTheme.cardBg,
  //               borderRadius: BorderRadius.circular(5.r),
  //               boxShadow: const [
  //                 BoxShadow(
  //                   color: AppTheme.shadowColor,
  //                   blurRadius: 5,
  //                 ),
  //               ],
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Image.network(
  //                   staticImageResolver(
  //                     '/static/comm/gameImage/wap/140-104/' +
  //                         item.gameTag! +
  //                         '.png',
  //                   ),
  //                   width: 25.r,
  //                 ),
  //                 SizedBox(
  //                   width: 3.r,
  //                 ),
  //                 Expanded(
  //                   child: Text(
  //                     item.name ?? '',
  //                     style: AppTheme.header3,
  //                     overflow: TextOverflow.ellipsis,
  //                     maxLines: 1,
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

//
// AppBar(
//   elevation: 0,
//   leading: GestureDetector(
//     onTap: () {
//       Get.back();
//     },
//     child: const Icon(
//       Icons.arrow_back_ios_new,
//       color: Colors.white,
//     ),
//   ),
//   flexibleSpace: Container(
//     color: AppTheme.primaryOne,
//   ),
//   title: Container(
//     padding: EdgeInsets.only(right: 30.w),
//     alignment: Alignment.center,
//     height: 26.r,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(17.r),
//     ),
//     width: double.infinity,
//     child: TextField(
//       style: TextStyle(
//         fontSize: 12.w,
//       ),
//       onChanged: (val) => controller.searchValue = val,
//       decoration: InputDecoration(
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           disabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.transparent,
//             ),
//           ),
//           contentPadding:
//               EdgeInsets.only(left: 20.w, top: 0.r, bottom: 0.r),
//           iconColor: AppTheme.cardUnSelectColor,
//           hintText: "请输入需要搜索的游戏名称"),
//     ),
//   ),
// ),

}
