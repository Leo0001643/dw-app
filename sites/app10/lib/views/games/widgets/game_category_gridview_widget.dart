import 'package:aone_common/common.dart';
import 'package:app10/theme/color_schema.dart';
import 'package:app10/views/games/controllers/game_category_controller.dart';
import 'package:app10/views/games/widgets/game_girlview.dart';
import 'package:app10/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:keframe/keframe.dart';

class GameCategoryGridviewWidget extends StatelessWidget {
  const GameCategoryGridviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeCacheWidget(
      child: AnimationLimiter(
        child: PagedGridView(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
          physics: const BouncingScrollPhysics(),
          pagingController: GameCategoryController.to.state.pagingController,
          showNewPageErrorIndicatorAsGridChild: false,
          showNewPageProgressIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
          cacheExtent: 1000,
          builderDelegate: PagedChildBuilderDelegate<AllGameItem>(
            transitionDuration: const Duration(milliseconds: 175),
            itemBuilder: (BuildContext context, item, int index) {
              return AnimationConfiguration.staggeredGrid(
                columnCount: ResponsiveValue<int>({
                      smallLandscapeScreenScope: 2,
                      largeLandscapeScreenScope: 3,
                    }).resolve(context) ??
                    2,
                position: index,
                duration: const Duration(milliseconds: 375),
                child: FadeInAnimation(
                  child: ScaleAnimation(
                    scale: 0.5,
                    child: GestureDetector(
                      child: GameGridSpan(item),
                      onTap: () {
                        if (item.state == 3) return;
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
            },
            firstPageProgressIndicatorBuilder: (_) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                  valueColor: AlwaysStoppedAnimation(AppTheme.loadingColor),
                ),
              );
            },
            newPageProgressIndicatorBuilder: (_) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                  valueColor: AlwaysStoppedAnimation(AppTheme.loadingColor),
                ),
              );
            },
            noItemsFoundIndicatorBuilder: (_) {
              return Center(
                child: SizedBox(
                  height: 200.r,
                  child: const Center(
                    child: NoData(
                      title: '该分类下暂无匹配内容',
                    ),
                  ),
                ),
              );
            },
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.77,
            crossAxisSpacing: 12.r,
            mainAxisSpacing: 12.r,
            crossAxisCount: ResponsiveValue<int>({
                  smallLandscapeScreenScope: 3,
                  largeLandscapeScreenScope: 2,
                }).resolve(context) ??
                2,
          ),
        ),
      ),
    );
  }
}
