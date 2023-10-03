import 'package:aone_common/common.dart';
import 'package:aone_common/utils/colors.dart';
import 'package:app04/views/games/controllers/game_category_controller.dart';
import 'package:app04/widget/misc/dj_image.dart';
import 'package:app04/widget/tool/light_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LikeHistoryDrawerView extends StatelessWidget {
  const LikeHistoryDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context, removeTop: true,
      child: Obx(() {
        return Drawer(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        GameCategoryController.to.drawType = 0;
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: 25.w,
                          color: GameCategoryController.to.drawType == 0
                              ? Colors
                              .blueAccent
                              : Colors.transparent,
                          child: LightText.buildColorFont("历史记录",
                              GameCategoryController.to.drawType == 0 ? Colors
                                  .white : Colors.blueAccent, 12.sp),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        GameCategoryController.to.drawType = 1;
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: 25.w,
                          color: GameCategoryController.to.drawType == 1
                              ? Colors
                              .blueAccent
                              : Colors.transparent,
                          child: LightText.buildColorFont("我的收藏",
                              GameCategoryController.to.drawType == 1 ? Colors
                                  .white : Colors.blueAccent, 12.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
              Expanded(child: GameCategoryController.to.drawType == 0
                  ? _historyConain()
                  : _contentView())
            ],
          ),
        );
      }),
    );
  }

  Widget _historyConain() {
    return GameCategoryController.to.historyList.length != 0 ? ListView.builder(
        physics: new AlwaysScrollableScrollPhysics(),
        itemCount: GameCategoryController.to.historyList.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            child: _histItem(GameCategoryController.to.historyList[index]),
            onTap: () {
              onBeforeGameInit(
                onGameParams: FavoriteLogic.to.state.favoriteList[index],
              );
            },
          );
        }
    ) : Center(
      child: LightText.buildColorFont("暂无数据", Colors.black45, 12.sp),
    );
  }

  Widget _histItem(AllGameItem item) {
    return Column(
      children: [
        Container(
            height: 84,
            margin: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(242, 245, 248, 1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                DjImage.network(
                  item.imgCn!,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(4),
                        child: Text(
                          item.nameCn!,
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(11, 33, 59, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 46,
                        height: 18,
                        margin: const EdgeInsets.only(right: 4, top: 7),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: const LinearGradient(colors: [
                              Color.fromRGBO(47, 114, 245, 1),
                              Color.fromRGBO(66, 160, 254, 1)
                            ])),
                        child: const Text(
                          '立即进入',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )

        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }


  Widget _contentView() {
    return FavoriteLogic.to.state.favoriteList.length != 0 ? Obx(() {
      return ListView.builder(
        // physics: new AlwaysScrollableScrollPhysics(),
          itemCount: FavoriteLogic.to.state.favoriteList.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              child: _listItem(FavoriteLogic.to.state.favoriteList[index]),
              onTap: () {
                onBeforeGameInit(
                  onGameParams: FavoriteLogic.to.state.favoriteList[index],
                );
              },
            );
          }
      );
    }) : Center(
      child: LightText.buildColorFont("暂无数据", Colors.black45, 12.sp),
    );
  }


  Widget _listItem(FavoriteItems item) {
    return Column(
      children: [
        Container(
          height: 84,
          margin: const EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 245, 248, 1),
              borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      DjImage.network(
                        item.imgCn!,
                        width: 70.w,
                        height: 70.w,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(4),
                              child: Text(
                                item.nameCn!,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(11, 33, 59, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 46,
                              height: 18,
                              margin: const EdgeInsets.only(right: 4, top: 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(47, 114, 245, 1),
                                    Color.fromRGBO(66, 160, 254, 1)
                                  ])),
                              child: const Text(
                                '立即进入',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                right: 8,
                top: 9,
                child: GestureDetector(
                  onTap: () {
                    FavoriteLogic.to.removeFavorite(gameSubId: item.gameSubId!)
                        .then((value) {
                      FavoriteLogic.to.getFavoriteList();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                        'assets/images/home/like_select.png'
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
