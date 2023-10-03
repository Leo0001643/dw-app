import 'package:aone_common/common.dart';
import 'package:dio/dio.dart';

abstract class _IGameProvider {
  // 游戏二级分类
  Future<GameSubClassEntity> gameSubClass(int type);

  // 游戏列表
  Future<AllGameEntity> allGame(AllGameDto dto);

  // 进入游戏初始化
  Future<Response> gameInit(GameInitDto dto);

  // 厂商活动弹窗内容
  Future<GameWapPopEntity> gameWapPop();

  // 热门推荐厂商
  Future<TopGamesEntity> getTopGames();

  // 热门推荐游戏
  Future<HotSearchGameEntity> hotSearchGames();

  // 强档活动
  Future<StrongActivityEntity> strongActivity();

  Future<AllGameImageEntities> getAllGameImage();

  //搜索
  Future<AllGameEntity> getAllGamesearch(String searchText);
}

class GameProvider extends BaseProvider implements _IGameProvider {
  @override
  Future<GameSubClassEntity> gameSubClass(int type) {
    var api = fetch.post(ApiUrl.gameSubClass, data: {"type": type});
    return fetchWithErrorHandler(api).then(
      (res) => GameSubClassEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<AllGameEntity> allGame(AllGameDto dto) {
    var api = fetch.post(ApiUrl.allGames, data: dto.toJson());
    return fetchWithErrorHandler(api).then(
      (res) => AllGameEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<Response> gameInit(GameInitDto dto) {
    var api = fetch.post(
      ApiUrl.gameInit,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) {
        return res;
      },
    );
  }

  @override
  Future<GameWapPopEntity> gameWapPop() {
    var api = fetch.post(ApiUrl.gameWapPop, data: {"do_action": 1});
    return fetchWithErrorHandler(api).then(
      (res) => GameWapPopEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<TopGamesEntity> getTopGames() {
    var api = fetch.post(
      ApiUrl.getTopGames,
    );
    return fetchWithErrorHandler(api).then(
      (res) => TopGamesEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<HotSearchGameEntity> hotSearchGames() {
    var api = fetch.post(
      ApiUrl.hotSearchGames,
    );
    return fetchWithErrorHandler(api).then(
      (res) => HotSearchGameEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<StrongActivityEntity> strongActivity() {
    var api = fetch.post(
      ApiUrl.strongActivity,
    );
    return fetchWithErrorHandler(api).then(
      (res) => StrongActivityEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<AllGameImageEntities> getAllGameImage() {
    var api = fetch.post(
      ApiUrl.getAllGameImage,
    );
    return fetchWithErrorHandler(api).then(
      (res) => AllGameImageEntities.fromJson(res.data['data']),
    );
  }

  @override
  Future<AllGameEntity> getAllGamesearch(String searchText) {
    var api = fetch.post(ApiUrl.gameSearch, data: {'game': searchText});
    return fetchWithErrorHandler(api).then(
      (res) => AllGameEntity.fromJson(res.data['data']),
    );
  }
}
