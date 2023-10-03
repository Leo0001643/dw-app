import 'package:aone_common/common.dart';

import '../../model/entities/webui/quanmintg_echoImg.dart';

// 全民推广
abstract class _IPromotingProvider {
  // 佣金说明
  Future<QuanmintgYiIntroduce> getCommissionInfo();

  // 历史业绩
  Future<QuanmintgYiOrderList> getSalesHistory(YiOrderListDto dto);

  // 领取佣金
  Future<YongJinEntity> getCommission(YongJinDto dto);

  // 推广列表
  Future<QuanmintgUserYjInfo> getPromoList();

  // 推广图片
  Future<QuanmintgEchoImgEntity> echoImg();
}

class PromotingProvider extends BaseProvider implements _IPromotingProvider {
  @override
  Future<QuanmintgYiIntroduce> getCommissionInfo() async {
    var api = fetch.post(ApiUrl.quanmintgYjIntroduce);
    try {
      return fetchWithErrorHandler(api).then(
        (res) => QuanmintgYiIntroduce.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<QuanmintgYiOrderList> getSalesHistory(YiOrderListDto dto) async {
    var api = fetch.post(
      ApiUrl.quanmintgYjOrderList,
      data: dto.toJson(),
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => QuanmintgYiOrderList.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<YongJinEntity> getCommission(YongJinDto dto) async {
    var api = fetch.post(
      ApiUrl.quanmintgGetYongJin,
      data: dto.toJson(),
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => YongJinEntity.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<QuanmintgUserYjInfo> getPromoList() async {
    var api = fetch.post(
      ApiUrl.quanmintgUserYjInfo,
    );
    try {
      return fetchWithErrorHandler(api).then(
        (res) => QuanmintgUserYjInfo.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<QuanmintgEchoImgEntity> echoImg() async {
    var api = fetch.post(
      ApiUrl.quanmintgEchoImg,
    );
    try {
      return fetchWithErrorHandler(api).then(
        (res) => QuanmintgEchoImgEntity.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }
}
