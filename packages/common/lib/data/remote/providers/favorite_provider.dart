

import 'package:aone_common/common.dart';

// 游戏收藏
abstract class _IFavoriteProvider {
  // 收藏列表
  Future<FavoriteEntity> favoriteList();

  // 设置收藏 // 1 = add  2 = remove
  Future<void> setFavorite(FavoriteDto dto);
}

class FavoriteProvider extends BaseProvider implements _IFavoriteProvider {
  @override
  Future<FavoriteEntity> favoriteList() {
    var api = fetch.post(ApiUrl.favoriteList);
    return fetchWithErrorHandler(api).then(
        (res) => FavoriteEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<void> setFavorite(FavoriteDto dto) {
    var api = fetch.post(ApiUrl.setFavorite, data:  dto.toJson());
    return fetchWithErrorHandler(api);
  }

}