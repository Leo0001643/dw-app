import 'package:aone_common/common.dart';

import 'package:get/get.dart';

import '../../data/model/entities/webui/sub_game_class.dart';

// 站点相关配置
class GlobalState {
  // 站点配置 （由后端配置）
  late final SiteHeadersEntity siteHeaders;

  // 导航配置 即首页展示的游戏列表
  // late final List<Navconfig> navConfig;
  final RxList<Navconfig> navConfig = RxList.empty();

  // 站点配置 （商户配置）
  late final HomeItems siteItems;

  // 公告列表
  final RxList<Notices> noticeList = RxList.empty();

  // 首页轮播列表
  final RxList<Slides> slideList = RxList.empty();

  // 滚动公告列表
  final RxList<ScrollNoticeItem> scrollNotices = RxList.empty();

  //首页的SubGame列表
  final RxList<SubGameClass> subGameClassList = RxList.empty();

  // 首页游戏提供商
  final RxList<AllGameItem> allGames = RxList.empty();


  // 带index的滚动公告
  String get scrollNoticeStr {
    return scrollNotices
        .where((p0) => p0.body != null || p0.body!.isNotEmpty)
        .mapIndexed((element, index) {
          return ((index + 1).toString() +
              "." +
              element.body!.replaceAll('\n', ""));
        })
        .toList()
        .join('    ');
  }

  // 支持试玩的游戏列表
  final RxList<String> trailGameList = RxList.empty();

  RxBool isGlobalSite = false.obs;
}
