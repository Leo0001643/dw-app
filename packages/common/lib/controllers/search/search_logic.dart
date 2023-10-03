import 'package:aone_common/common.dart';
import 'package:get/get.dart';

class SearchLogic extends BaseController {
  final GameProvider provider = GameProvider();

  final RxList<Info> hotSearchGames = RxList.empty();

  final RxList<AllGameItem> searchResult = RxList.empty();

  final RxString _searchValue = ''.obs;

  String get searchValue => _searchValue.value;

  set searchValue(String val) => _searchValue.value = val;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

    await getHotSearch();

    debounce(_searchValue, getSearchResult,
        time: const Duration(milliseconds: 300));
  }

  Future<void> getHotSearch() async {
    fetchHandler<HotSearchGameEntity>(
      provider.hotSearchGames(),
      loading: true,
      onSuccess: (res) {
        hotSearchGames.addAll(res.items!);
      },
    );
  }

  Future<void> getSearchResult(String __) async {
    if (searchValue != '') {
      fetchHandler<AllGameEntity>(
        provider.getAllGamesearch(searchValue),
        onSuccess: (res) {
          searchResult
            ..clear()
            ..addAllIf(res.items != null, res.items!);
        },
      );
    }
  }
}
