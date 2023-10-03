import '../../../common.dart';
import '../../model/entities/user/get_bank_list.dart';
import '../../model/entities/webui/sub_game.dart';
import '../../model/entities/webui/sub_game_class.dart';
import '../../model/entities/webui/sub_game_total.dart';

abstract class _ISiteConfigProvider {
  // 首页UI数据
  Future<HomeEntity> homeUI();

  // 站点特殊配置
  Future<SiteHeadersEntity> siteHeaders();

  //首页的SubGame列表
  Future<List<SubGameClass>> getSubGameClass();


  //首页的SubGame列表
  Future<SubGameTotal> getSubGamesByClass({String categoriesId, String gameTag});

  // 游戏提供商
  Future<AllGameEntity> getAllGames({int currentPage = 1});

  // 支持试玩的游戏列表
  Future<TrialEntity> trialGames();

  // 游戏分类
  Future<Map<String,dynamic>> playMenu();

  // 滚动公告
  Future<ScrollNoticeEntity> scrollNotice();

  // 支持的银行列表
  Future<BankListEntity> bankList();

  // 支持的银行电子钱包虚拟币
  Future<GetBankListEntity> getBankList();

  // 文章
  Future<ArticleEntity> article(String id);

  Future<CheckUpdateEntity> checkUpdate(CheckUpdateDto dto);
}

class SiteConfigProvider extends BaseProvider implements _ISiteConfigProvider {
  @override
  Future<HomeEntity> homeUI() {
    var api = fetch.post(ApiUrl.homeUI);
    return fetchWithErrorHandler(api).then(
          (res) => HomeEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<SiteHeadersEntity> siteHeaders() {
    var api = fetch.post(ApiUrl.siteHeaders);
    return fetchWithErrorHandler(api).then(
          (res) => SiteHeadersEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<TrialEntity> trialGames() {
    var api = fetch.post(ApiUrl.trialGames);
    return fetchWithErrorHandler(api).then(
          (res) => TrialEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<List<SubGameClass>> getSubGameClass() {
    var api = fetch.post(ApiUrl.getSubGamesClass);
    return fetchWithErrorHandler(api).then(
          (res) => [...(res.data['data'] ?? []).map((o) => SubGameClass.fromJson(o))],
    );
  }

  @override
  Future<ScrollNoticeEntity> scrollNotice() {
    var api = fetch.post(ApiUrl.scrollNotice);
    return fetchWithErrorHandler(api).then(
          (res) => ScrollNoticeEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<BankListEntity> bankList() {
    var api = fetch.post(ApiUrl.bankList);
    return fetchWithErrorHandler(api).then(
          (res) => BankListEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<GetBankListEntity> getBankList() {
    var api = fetch.post(ApiUrl.getBankList);
    return fetchWithErrorHandler(api).then(
          (res) => GetBankListEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<ArticleEntity> article(String id) {
    final api = fetch.post(
      ApiUrl.articles,
      data: {"id": id},
    );
    return fetchWithErrorHandler(api).then(
          (res) => ArticleEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<CheckUpdateEntity> checkUpdate(CheckUpdateDto dto) {
    final api = fetch.post(
      ApiUrl.checkUpdate,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
          (res) => CheckUpdateEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<AllGameEntity> getAllGames({int currentPage = 1}) {
    var api = fetch.post(ApiUrl.getAllGames,
        data: {"changshang": "1", "currentPageTotal": "99999", "currentPage": currentPage.toString()});
    return fetchWithErrorHandler(api).then(
          (res) => AllGameEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<SubGameTotal> getSubGamesByClass({int page = 1,int pageSize = 50,String categoriesId = "", String gameTag = "",String type=""}) {
    Map<String, String> map = {};
    map["currentPageTotal"] = pageSize.toString();
    map["currentPage"] = page.toString();
    if (categoriesId.isNotEmpty) {
      map["frontend_menu_categories_id"] = categoriesId;
    }
    if (gameTag.isNotEmpty) {
      map["game_tag"] = gameTag;
    }
    if (type.isNotEmpty) {
      map["type"] = type;
    }
    var api = fetch.post(ApiUrl.getSubGamesByClass, data: map);
    return fetchWithErrorHandler(api).then(
          (res) {
            return SubGameTotal.fromJson(res.data['data']);
          }
    );
  }

  @override
  Future<Map<String,dynamic>> playMenu() {
    Map<String, String> map = {};
    map["only"] = "1";
    map["token"] = SpStorage.getSportToken??"";
    var api = fetch.post(ApiUrl.playMenu, data: map);
    return fetchWithErrorHandler(api).then(
          (res) => res.data['data'],
    );
  }
}
