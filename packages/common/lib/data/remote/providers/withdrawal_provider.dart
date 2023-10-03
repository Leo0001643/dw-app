import 'package:aone_common/common.dart';


// 充值
abstract class _IWithdrawalProvider {
  // 获取用户余额及信息
  Future<MoneyInfoEntity> getUserMoney();

  //我的卡包
  Future<MyBankListInfoEntity> getBankList();

  // 提现
  Future<void> tixian(TixianDto dto);

  //提现所需条件
  Future<FactorNeedEntity> factorNeed();
}

class WithdrawalProvider extends BaseProvider implements _IWithdrawalProvider {
  @override
  Future<FactorNeedEntity> factorNeed() {
    var api = fetch.post(
      ApiUrl.userFactorNeed,
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => FactorNeedEntity.fromJson(res.data['data']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MyBankListInfoEntity> getBankList() {
    var api = fetch.post(
      ApiUrl.myBankList,
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => MyBankListInfoEntity.fromJson(res.data['data']['items']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<MoneyInfoEntity> getUserMoney() {
    var api = fetch.post(
      ApiUrl.userMoney,
    );

    try {
      return fetchWithErrorHandler(api).then(
        (res) => MoneyInfoEntity.fromJson(res.data['data']['info']),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<YongJinEntity> tixian(TixianDto dto) {
    var api = fetch.post(
      ApiUrl.userShenqingTixian,
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
}
