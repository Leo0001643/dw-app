import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/game_category/game_category_state.dart';
import 'package:app04/views/general/controllers/home_page_controller.dart';
import 'package:app04/widget/tool/persistent_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GameChildController extends GameCategoryLogic {
  static GameChildController get to => Get.find();
  var isNormalListView = true.obs;
  late Navconfig navconfigCategory; //电子、棋牌
  late int type; //2电子   6棋牌
// 1收藏，0历史
  final RxInt _drawType = 0.obs;
  get drawType => _drawType.value;
  set drawType(value) => _drawType.value = value;

  final RxList _historyList = [].obs;
  get historyList => _historyList.value;
  set historyList(value) => _historyList.value = value;

  Rx<OnGameParams> _argsments = Rx<OnGameParams>(Get.arguments ?? TopGame());
  get argsments => _argsments.value;
  set argsments(value) => _argsments.value = value;

  void barBtnClick(int tag) {
    if (tag == 5) {
      isNormalListView.toggle();
    } else if (tag == 4) {
      Get.toNamed(Routes.gameSearch);
    } else if (tag == 3) {
    } else if (tag == 2) {
    } else if (tag == 1) {
    } else {}

    update();
  }

  //进来的当前分类
  getGameCategoryData() {
    HomePageController.to.navConfigList.forEach((element) {
      print('element.isYs == ${element.isYs}');
      print('element.nameCn == ${element.nameCn}');
      int subType = element.subChildren![0].type ?? 2;
      if (subType == GameChildController.to.argsments.type) {
        navconfigCategory = element;
        type = subType;
        print('进入了赋值');
      }
      print('subType == ${subType}');
    });
  }

  String gainImageUrl(int index) {
    print('下标2 == ${index}');

    if (index > 0) {
      print(
          'index -1 gameTag== ${HomePageController.to.navConfigList[HomePageController.to.selectIndex].subChildren![index - 1].nameCn}');
      print(
          'index - 1 nameCn== ${HomePageController.to.navConfigList[HomePageController.to.selectIndex].subChildren![index - 1].gameTag}');
    }
    for (int i = 0;
        i < GameChildController.to.navconfigCategory.subChildren!.length;
        i++) {
      SubChildren subChildren =
          GameChildController.to.navconfigCategory.subChildren![i];
      print('名称 == ${subChildren.nameCn}');
    }
    return staticImageResolver(
        '/static/comm/gameImage/${navconfigCategory.isYs}/${navconfigCategory.isYs == "egame" ? '60-118v6' : '50-100v5'}/${index == 0 ? "huodong" : navconfigCategory.subChildren![type == 2 ? index : index - 1].gameTag!}.png');
    // return staticImageResolver(
    //     '/static/comm/gameImage/${HomePageController.to.navConfigList[HomePageController.to.selectIndex].isYs}/${HomePageController.to.navConfigList[HomePageController.to.selectIndex].isYs == "egame" ? '60-118v6' : '50-100v5'}/${index == 0 ? "huodong" : HomePageController.to.navConfigList[HomePageController.to.selectIndex].subChildren![index].gameTag!}.png');
  }

  //顶部选项卡重置后数据
  void refreshNewFactoryTotalData() {
    state.pagingController.value = PagingState(nextPageKey: 1, itemList: []);
    state.providers = RxList<SubChildren>([]);
    state.payload.currentPage = 1;
    for (var current in navConfig) {
      current.subChildren?.forEach((element) {
        if (element.ischangshang == 1 &&
            argsments.type == element.type &&
            state.providers
                .where((p0) => p0.subTag == element.subTag)
                .isEmpty) {
          state.providers.add(element);
        }
      });
    }
    onSelectProvider(
      state.providers.where((p0) => p0.subTag == argsments.subTag).first,
    );
    //重置tab
    state.gameSubClasses = RxList<GameSubClassItem>([
      DefaultSubClassItem(
        tag: null,
        name: 'game.subClass.all'.tr,
      ),
      DefaultSubClassItem(
        tag: 2,
        name: 'game.subClass.hot'.tr,
      ),
      DefaultSubClassItem(
        tag: 4,
        name: 'game.subClass.new'.tr,
      ),
      DefaultSubClassItem(
        tag: 3,
        name: 'game.subClass.feature'.tr,
      ),
    ]);
    //重新获取二级tab
    getListData();
  }

  void getListData() async {
    await getGameSubClassList();
    update();
  }

  Future refreshCollectData() async {
    FavoriteLogic.to.getFavoriteList();
    update();
  }

  void resetArgumnet() {
    _argsments.value = Get.arguments ?? TopGame();
  }

  @override
  void onInit() {
    super.onInit();
    // SharePreferencesUtils.deleteFromLocalMap('history_collection');
    loadMyCollect();
    Get.lazyPut(() => FavoriteLogic());
    OnGameParams params = Get.arguments;
  }

  void loadMyCollect() {
    List<AllGameItem> histListR = [];
    SharePreferencesUtils.readFromLocalMap('history_collection').then((value) {
      if (value != null) {
        List his = value;
        his.forEach((element) {
          AllGameItem ite = AllGameItem.fromJson(element);
          histListR.add(ite);
        });
        historyList = histListR;
      }
    });
  }

  void addhistoryCollection(Map map) {
    SharePreferencesUtils.readFromLocalMap('history_collection').then((value) {
      if (value == null) {
        List histList = [map];
        SharePreferencesUtils.saveToLocalMap('history_collection', histList);
        List<AllGameItem> histListR = [];
        SharePreferencesUtils.readFromLocalMap('history_collection')
            .then((value) {
          if (value != null) {
            List his = value;
            his.forEach((element) {
              AllGameItem ite = AllGameItem.fromJson(element);
              histListR.add(ite);
            });
            historyList = histListR;
          }
        });
      } else {
        List histList = value as List;
        List newHistList = List.from(histList);
        bool canAdd = true;
        histList.forEach((element) {
          if (element["game_sub_id"] == map["game_sub_id"]) {
            canAdd = false;
          }
        });
        if (canAdd) {
          newHistList.add(map);
          SharePreferencesUtils.saveToLocalMap(
              'history_collection', newHistList);
          List<AllGameItem> histListR = [];
          SharePreferencesUtils.readFromLocalMap('history_collection')
              .then((value) {
            if (value != null) {
              List his = value;
              his.forEach((element) {
                AllGameItem ite = AllGameItem.fromJson(element);
                histListR.add(ite);
              });
              historyList = histListR;
            }
          });
        }
      }
    });
  }
}
