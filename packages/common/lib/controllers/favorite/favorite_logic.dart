import 'dart:async';
import 'dart:io';

import 'package:aone_common/common.dart';
import 'package:aone_common/data/remote/providers/favorite_provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

class FavoriteState {
  RxList<FavoriteItems> favoriteList = RxList<FavoriteItems>([]);
}

class FavoriteLogic extends BaseController {
  FavoriteProvider favProvider = FavoriteProvider();
  final _userAuthLevel = UserService.to.state.authLevel;
  FavoriteState state = FavoriteState();
  FavoriteProvider provider = FavoriteProvider();

  static FavoriteLogic get to => Get.find();

  final _userState = UserService.to.state;

  @override
  void onInit() {
    super.onInit();
    if (_userState.authLevel == AuthLevel.regular) {
      try {
        String data = SpStorage.getValue("FavoriteList");
        printInfo(info: "----->jett 取到的数据 data ${data}");
        if (data != null && data != "") {
          Map<String, dynamic> favoriteEntityMap = convert.jsonDecode(data);
          FavoriteEntity favoriteEntity =
              FavoriteEntity.fromJson(favoriteEntityMap);
          state.favoriteList.clear();
          state.favoriteList.addAll(favoriteEntity.items!);
        }
      } catch (exception) {
        printInfo(info: "转化异常");
      }
      getFavoriteList();
    }
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
        if (_userState.authLevel == AuthLevel.regular) {
          sleep(Duration(milliseconds: 1000));
          getFavoriteList();
        }
      },
    );
  }

  Future<void> getFavoriteList() async {
    await fetchHandler<FavoriteEntity>(
      provider.favoriteList(),
      onSuccess: (res) {
        state.favoriteList.clear();
        state.favoriteList.addAll(res.items!);
        try {
          SpStorage.setValue("FavoriteList", convert.jsonEncode(res.toJson()));
        } catch (excetion) {
          printInfo(info: "存值失败");
        }
      },
    );
  }

  Future<void> removeFavorite({required int gameSubId, bool? showToast}) async {
    await fetchHandler(
      provider.setFavorite(
        FavoriteDto(
          gameSubId: gameSubId,
          isCollect: 0,
        ),
      ),
      onSuccess: (_) {
        state.favoriteList.removeWhere(
          (element) => element.gameSubId == gameSubId,
        );
        if (showToast == true) {
          SmartDialog.showToast('取消收藏成功');
        }
      },
    );
  }
}
