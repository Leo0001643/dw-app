import 'dart:async';

import 'package:aone_common/common.dart';
import 'package:aone_common/controllers/game_category/game_category_state.dart';
import 'package:aone_common/data/remote/providers/favorite_provider.dart';
import 'package:aone_common/data/remote/providers/game_provider.dart';
import 'package:get/get.dart';

class GameCategoryLogic extends BaseController {
  Rx<String?> keyword = ' '.obs;

  static GameCategoryLogic get to => Get.find();

  GameProvider provider = GameProvider();
  FavoriteProvider favProvider = FavoriteProvider();

  GameCategoryLogicState state = GameCategoryLogicState();

  List<Navconfig> navConfig = GlobalService.to.state.navConfig;

  final _userAuthLevel = UserService.to.state.authLevel;

  @override
  void onInit() {
    OnGameParams args = Get.arguments;

    _initProviderList(args);

    onSelectProvider(
      state.providers.where((p0) => p0.subTag == args.subTag).first,
    );
    getGameSubClassList();

    state.pagingController.addPageRequestListener((pageKey) {
      getAllGameList(pageKey);
    });


    debounce(
      keyword,
      (callback) {
        state.payload.gameSubName = keyword.value;
        state.pagingController.refresh();
      },
      time: const Duration(seconds: 1),
    );

    super.onInit();
  }

  // 二级分类点击
  void onSelectSubClass(GameSubClassItem item, int index) {
    if (item is DefaultSubClassItem) {
      state.payload
        ..classId = null
        ..tag = item.tag;
    } else {
      state.payload
        ..classId = item.classId
        ..tag = null;
    }
    state.activeSubClass = index;
    state.pagingController.refresh();
  }

  void onSelectProvider(SubChildren args) {
    state.selectedProvider = args;
    state.payload.gameTag = args.gameTag;
    state.payload.type = args.type;
    state.pagingController.refresh();
  }

  // 初始化厂商列表
  void _initProviderList(OnGameParams args) {
    for (var current in navConfig) {
      current.subChildren?.forEach((element) {
        if (element.ischangshang == 1 &&
            args.type == element.type &&
            state.providers
                .where((p0) => p0.subTag == element.subTag)
                .isEmpty) {
          state.providers.add(element);
        }
      });
    }
  }

  // 二级分类
  var loadGameSubClassList = false;
  Future<void> getGameSubClassList() async {
    if (loadGameSubClassList) {
      return;
    }
    loadGameSubClassList = true;
    await fetchHandler<GameSubClassEntity>(
      provider.gameSubClass(state.selectedProvider.type!),
      onSuccess: (res) => {
        state.gameSubClasses.addAll(res.items!),
        loadGameSubClassList = false
      },
    );
  }

  // 游戏列表
  Future<void> getAllGameList(int page) async {
    state.payload.currentPage = page;
    await fetchHandler<AllGameEntity>(
      provider.allGame(state.payload),
      onSuccess: (res) {
        if (res.items!.isEmpty) pageEmpty();
        var isLastPage = res.items!.length < state.payload.currentPageTotal!;
        if (isLastPage) {
          state.pagingController.appendLastPage(res.items!);
        } else {
          var nextPage = page + 1;
          state.pagingController.appendPage(res.items!, nextPage);
        }
      },
      onError: (error) => state.pagingController.error = error,
      loading: true,
    );
  }

  // 切换收藏状态
  Future<void> toggleFavorite({
    required FavoriteDto payload,
    required String subTag,
  }) async {
    if (_userAuthLevel != AuthLevel.regular) {
      return;
    }
    payload.isCollect = payload.isCollect == 1 ? 0 : 1;
    await fetchHandler(
      favProvider.setFavorite(payload),
      onSuccess: (_) {
        changeFavoriteState(
          payload.gameSubId!,
          subTag,
          payload.isCollect!,
        );
      },
    );
  }

  //搜索
  Future<void> postAllGameSearchData(String searchText) async {
    await fetchHandler<AllGameEntity>(provider.getAllGamesearch(searchText),
        onSuccess: (res) {
      print('搜索的个数${res.items!.length}');
      pageEmpty();
      if (res.items!.isNotEmpty) {
        state.pagingSearchController.appendPage(res.items!, 1);
      }
      update();
    });
  }

  // 修改列表内的收藏状态并更新视图
  void changeFavoriteState(int gameSubId, String subTag, int isCollect) {
    var index = state.pagingController.itemList!.indexWhere(
      (element) => element.gameSubId == gameSubId,
    );

    state.pagingController.itemList![index].isCollect = isCollect;
    state.pagingController.notifyListeners();
  }

  void searchKey(String? key) {
    print('传过来的值 == ${key}');
    keyword.value = key;
  }
}
