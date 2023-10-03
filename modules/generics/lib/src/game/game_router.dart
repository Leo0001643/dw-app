import 'package:aone_common/common.dart';
import 'package:generics/src/game/views/game_view.dart';
import 'package:get/get.dart';

import '../../generics.dart';
import 'bindings/game_search_binding.dart';
import 'bindings/strong_activity_binding.dart';
import 'views/game_child_view.dart';
import 'views/game_init_view.dart';
import 'views/game_search_view.dart';
import 'views/strong_activity_page.dart';

final List<GetPage> gameRoutes = [
  //游戏搜索
  GetPage(
    name: Routes.gameSearch,
    page: () => const GameSearchView(),
    binding: GameSearchBinding(),
  ),

  //游戏加载路由
  GetPage(
    name: Routes.gameInit,
    page: () => GameInitView(),
  ),

  //游戏详情页
  GetPage(
      name: Routes.gameWebView,
      page: () => const GameView(),
      transition: Transition.noTransition),

  //强档活动
  GetPage(
    name: Routes.strongActivity,
    page: () => const StrongActivityPage(),
    binding: StrongActivityBinding(),
  ),

  //游戏分类
  GetPage(
    name: Routes.gameCategory,
    page: () => const GameCategoryView(),
    binding: GameCategoryBinding(),
  ),

  GetPage(
    name: Routes.childGame,
    page: () => const GameChildView(),
    binding: GameCategoryBinding(),
  ),
];
