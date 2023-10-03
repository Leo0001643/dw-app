import 'package:aone_common/common.dart';
import 'package:app04/theme/color_schema.dart';
import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';
import 'package:keframe/keframe.dart';

import 'like_view.dart';

class GameCategoryListviewWidget extends StatelessWidget {
  const GameCategoryListviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        margin: const EdgeInsets.only(left: 4, right: 4),
        child: SizeCacheWidget(
          child: AnimationLimiter(
            child: PagedListView(
              cacheExtent: 1000,
              physics: const BouncingScrollPhysics(),
              // scrollDirection: Axis.horizontal,
              pagingController:
                  GameCategoryController.to.state.pagingController,
              padding: EdgeInsets.only(
                  left: 12.r,
                  right: 12.r,
                  bottom: context.mediaQueryViewPadding.bottom,
                  top: 14.r),
              builderDelegate: PagedChildBuilderDelegate<AllGameItem>(
                  itemBuilder: (BuildContext context, item, int index) {
                return AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: index,
                  child: FadeInAnimation(
                    child: SlideAnimation(
                      horizontalOffset: 60,
                      child: GestureDetector(
                        child: LikeView(item),
                        onTap: () {
                          GameCategoryController.to
                              .addhistoryCollection(item.toJson());
                          onBeforeGameInit(
                            onGameParams: item,
                          );
                        },
                      ),
                    ),
                  ),
                );
              }, firstPageProgressIndicatorBuilder: (_) {
                return  Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                    valueColor: AlwaysStoppedAnimation(
                      AppTheme.primary,
                    ),
                  ),
                );
              }, newPageProgressIndicatorBuilder: (_) {
                return  Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                    valueColor: AlwaysStoppedAnimation(
                      AppTheme.primary,
                    ),
                  ),
                );
              }, noItemsFoundIndicatorBuilder: (_) {
                return const SizedBox(
                  height: 200,
                  child: NoData(
                    title: '该分类下暂无匹配内容',
                  ),
                );
              }),
            ),
          ),
        ),
      );
    });
  }
}
