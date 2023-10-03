import 'package:aone_common/common.dart';
import 'package:aone_common/data/remote/providers/game_provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

class StrongActivityLogic extends BaseController {
  final RxList<StrongItem> strongList = RxList([
    StrongItem(id: -1, nameCn: '本站推荐'),
  ]);

  final RxBool _isTodayNoDisplayChecked = false.obs;

  bool get isTodayNoDisplayChecked => _isTodayNoDisplayChecked.value;

  set isTodayNoDisplayChecked(bool val) => _isTodayNoDisplayChecked.value = val;

  RxList<TopGame> topGames = RxList.empty();
  RxList<GameWapPopItems> popItems = RxList.empty();

  GameProvider provider = GameProvider();
  List<Navconfig> navConfig = GlobalService.to.state.navConfig;

  List<String> providersTagList = [];

  @override
  void onInit() async {
    for (var element in navConfig) {
      if (['egame', 'chess'].contains(element.isYs) &&
          element.subChildren!.isNotEmpty) {
        for (var child in element.subChildren!) {
          if (child.ischangshang == 1) {
            providersTagList.add(child.subTag!);
          }
        }
      }
    }

    await initGameWapPop();
    await _getStrongList();
    await initStrongGames();
    super.onInit();
  }

  Future<void> initGameWapPop() async {
    await fetchHandler<GameWapPopEntity>(
      provider.gameWapPop(),
      onSuccess: (res) {
        popItems.addAll(res.items!);
        print(res.items!.length);
        triggerWapPopup();
      },
    );
  }

  Future<void> initStrongGames() async {
    await _getHotSearch();
    await _getTopGames();
  }

  Future<void> _getStrongList() async {
    await fetchHandler<StrongActivityEntity>(
      provider.strongActivity(),
      onSuccess: (res) => strongList.addAll(res.items!),
    );
  }

  Future<void> _getHotSearch() async {
    await fetchHandler<HotSearchGameEntity>(
      provider.hotSearchGames(),
      onSuccess: (res) => topGames.add(
        TopGame(
          nameCn: "热门推荐",
          info: res.items!,
        ),
      ),
    );
  }

  Future<void> _getTopGames() async {
    await fetchHandler<TopGamesEntity>(
      provider.getTopGames(),
      onSuccess: (res) {
        res.items?.removeWhere(
          (element) => (element.info == null ||
              element.info!.isEmpty ||
              !providersTagList.contains(element.gameTag)),
        );

        topGames.addAll(res.items!);
      },
    );
  }

  void triggerWapPopup() {
    throw UnimplementedError();
  }
}
