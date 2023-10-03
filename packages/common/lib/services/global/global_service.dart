import 'package:aone_common/common.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/entities/webui/sub_game_class.dart';
import 'global_state.dart';

class GlobalService extends BaseService {
  final GlobalState state = GlobalState();

  static GlobalService get to => Get.find();

  SiteConfigProvider provider = SiteConfigProvider();

  String get currencySymbol => state.siteHeaders.currencySymbol ?? '';

  Future<GlobalService> init() async {
    await getHomeEntity();
    await getSiteHeaders();
    await getScrollNotice();
    return this;
  }

  Future<void> getHomeEntity({bool isDouble = false}) async {
    await fetchHandler<HomeEntity>(
      provider.homeUI(),
      onSuccess: (res) async {
        state.navConfig.value = res.navconfig!;
        state.noticeList.value = res.itmes!.notices!;
        state.slideList.value = (res.itmes!.slides!);
        if (!isDouble) {
          state.siteItems = res.itmes!;
          SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString("contactKefuApp", res.itmes?.bases?.contactKefuApp ?? "");
        }
      },
    );
  }



  Future<void> getSiteHeaders() async {
    await fetchHandler<SiteHeadersEntity>(
      provider.siteHeaders(),
      onSuccess: (res) => state.siteHeaders = res,
    );
  }

  Future<void> getAllGames({int currentPage = 1}) async {
    await fetchHandler<AllGameEntity>(
      provider.getAllGames(currentPage: currentPage),
      onSuccess: (res) {
        if (currentPage == 1) {
          state.allGames.clear();
        }
        state.allGames.addAll(res.items!);
      },
    );
  }

  Future<void> getScrollNotice() async {
    await fetchHandler<ScrollNoticeEntity>(
      provider.scrollNotice(),
      onSuccess: (res) => state.scrollNotices.addAll(res.items!),
    );
  }

  Future<void> getSubGameClass() async {
    await fetchHandler<List<SubGameClass>>(
      provider.getSubGameClass(),
      onSuccess: (res) => {state.subGameClassList.value = res},
    );
  }

  Future<void> getSubGameClassZ01() async {
    state.subGameClassList.clear();
    await fetchHandler<List<SubGameClass>>(
      provider.getSubGameClass(),
      onSuccess: (res) => {state.subGameClassList.value = res},
    );
  }

  Future<void> getTrialGames() async {
    await fetchHandler<TrialEntity>(
      provider.trialGames(),
      onSuccess: (res) => state.trailGameList.addAll(res.items!),
    );
  }

  // 检查游戏是否支持试玩
  bool isTrialAble(String gameSubTag, String gameTag) {
    return state.trailGameList.contains(gameSubTag) || state.trailGameList.contains(gameTag) || (state.trailGameList.contains("zzsports") && AppEnv.config.isSports == 1);
  }
}
