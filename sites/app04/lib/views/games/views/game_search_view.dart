import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/theme/theme_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/site_config.dart';
import '../controllers/game_search_controller.dart';

class GameSearchView extends GetView<GameSearchController> {
  const GameSearchView({Key? key}) : super(key: key);

  bool  isZiZhuTiYu(String? gameTag) =>
      gameTag == 'zzsports' &&
          (AppEnv.config.siteTag == 'h09' ||
              AppEnv.config.siteTag == 'b97' ||
              AppEnv.config.siteTag == 'g83');

  @override
  Widget build(BuildContext context) {
    return ThemeScaffold(
      appBar: AppBar(
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
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(left: 15.r, right: 15.r),
          alignment: Alignment.center,
          height: 26.r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17.r),
          ),
          width: double.infinity,
          child: TextField(
            style: TextStyle(
              fontSize: 12.sp,
            ),
            onChanged: (val) => controller.searchValue = val,
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
                hintText: "请输入需要搜索的游戏名称"),
          ),
        ),
      ),
      body: _pageStateBuilder(),
    );
  }

  Widget _pageStateBuilder() {
    return Obx(() {
      if (controller.pageState == PageState.loading) {
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
            valueColor: AlwaysStoppedAnimation(
              AppTheme.primary,
            ),
          ),
        );
      }
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.r, bottom: 8.r, left: 12.r),
            width: double.infinity,
            child: Text(
              controller.searchValue != '' ? '搜索结果' : '热门搜索',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.r,
              ),
            ),
          ),
          if (controller.searchValue == '') _hotSearch(),
          if (controller.searchValue != '') _searchResult(),
        ],
      );
    });
  }

  Widget _hotSearch() {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: controller.hotSearchGames
              .map(
                (element) => GestureDetector(
                  onTap: () => onBeforeGameInit(onGameParams: element),
                  child: SizedBox(
                    width: Get.width / 3,
                    child: Container(
                        alignment: Alignment.center,
                        height: 45.r,
                        padding: EdgeInsets.symmetric(horizontal: 12.r),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffCCCCCC), width: 0.5.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              staticImageResolver(
                                '/static/comm/gameImage/wap/140-104/' +
                                    element.gameTag! +
                                    '.png',
                              ),
                              width: 25.r,
                              height: 25.r,
                            ),
                            SizedBox(
                              width: 8.r,
                            ),
                            Expanded(
                              child: Text(
                                element.nameCn ?? '',
                                style: AppTheme.header3,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // Widget _hotSearch() {
  //   return Expanded(
  //     child: GridView.builder(
  //       padding: EdgeInsets.only(
  //         top: 15.r,
  //         bottom: 15.r + Get.mediaQuery.viewPadding.bottom,
  //         left: 12.r,
  //         right: 12.r,
  //       ),
  //       physics: NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       itemCount: controller.hotSearchGames.length,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         childAspectRatio: 5.767,
  //         mainAxisSpacing: 8,
  //         crossAxisSpacing: 5,
  //       ),
  //       itemBuilder: (context, index) {
  //         var item = controller.hotSearchGames[index];
  //         return GestureDetector(
  //           onTap: () => onBeforeGameInit(onGameParams: item),
  //           child: Container(
  //             height: 35.r,
  //             margin: EdgeInsets.only(bottom: 7.r),
  //             padding: EdgeInsets.symmetric(horizontal: 10.r),
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
  //                 Image.network(staticImageResolver(
  //                   '/static/comm/gameImage/wap/140-104/' +
  //                       item.gameTag! +
  //                       '.png',
  //                 )),
  //                 SizedBox(
  //                   width: 9.r,
  //                 ),
  //                 Text(
  //                   item.nameCn ?? '',
  //                   style: AppTheme.header3,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _searchResult() {
    return Expanded(
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          children: controller.searchResult
              .map(
                (element) => GestureDetector(
                  onTap: () => onBeforeGameInit(onGameParams: element),
                  child: SizedBox(
                    width: Get.width / 3,
                    child: Container(
                        alignment: Alignment.center,
                        height: 45.r,
                        padding: EdgeInsets.symmetric(horizontal: 12.r),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffCCCCCC), width: 0.5.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isZiZhuTiYu(element.gameTag))
                              ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                child: Image.asset(
                                  'assets/images/common/zizhutiyu.jpg',
                                  width: 25.r,
                                  height: 25.r,
                                ),
                              )
                            else
                              Image.network(
                                staticImageResolver(
                                  '/static/comm/gameImage/wap/140-104/' +
                                      element.gameTag! +
                                      '.png',
                                ),
                                width: 25.r,
                                height: 25.r,
                              ),
                            SizedBox(
                              width: 8.r,
                            ),
                            Expanded(
                              child: Text(
                                element.name ?? '',
                                style: AppTheme.header3,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.searchResult.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5.767,
          mainAxisSpacing: 8,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          var item = controller.searchResult[index];
          return GestureDetector(
            onTap: () => onBeforeGameInit(onGameParams: item),
            child: Container(
              height: 45.r,
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              decoration: BoxDecoration(
                color: AppTheme.cardBg,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: const [
                  BoxShadow(
                    color: AppTheme.shadowColor,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    staticImageResolver(
                      '/static/comm/gameImage/wap/140-104/' +
                          item.gameTag! +
                          '.png',
                    ),
                    width: 25.r,
                  ),
                  SizedBox(
                    width: 3.r,
                  ),
                  Expanded(
                    child: Text(
                      item.name ?? '',
                      style: AppTheme.header3,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
