import 'package:aone_common/common.dart';
import 'package:app04/views/games/bindings/strong_activity_binding.dart';
import 'package:app04/views/games/views/game_child_view.dart';
import 'package:app04/views/games/views/game_search_view.dart';
import 'package:get/get.dart';

import 'bindings/game_category_binding.dart';
import 'bindings/game_search_binding.dart';
import 'views/game_category_view.dart';
import 'views/game_init_view.dart';
import 'views/game_view.dart';
import 'views/strong_activity_page.dart';

final List<GetPage> gamesRoutes = [
  //游戏加载路由
  GetPage(
    name: Routes.gameInit,
    page: () => const GameInitView(),
  ),
  //游戏详情页
  GetPage(
    name: Routes.gameWebView,
    page: () => const GameView(),
    transition:Transition.noTransition
  ),

  //游戏分类
  GetPage(
    name: Routes.gameCategory,
    page: () => const GameCategoryView(),
    binding: GameCategoryBinding(),
  ),

  //游戏搜索
  GetPage(
    name: Routes.gameSearch,
    page: () => const GameSearchView(),
    binding: GameSearchBinding(),
  ),

  //强档活动
  GetPage(
    name: Routes.strongActivity,
    page: () => const StrongActivityPage(),
    binding: StrongActivityBinding(),
  ),

  GetPage(
    name: Routes.childGame,
    page: () => const GameChildView(),
    binding: GameCategoryBinding(),
  ),
];
