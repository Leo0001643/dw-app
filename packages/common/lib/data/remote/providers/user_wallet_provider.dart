import 'package:aone_common/common.dart';
import 'package:aone_common/data/model/entities/record/total_count_entity.dart';
import 'package:get/get.dart';

import '../../model/dto/user/binding_bank_z01.dart';

abstract class _IUserWalletProvider {
  // 绑定银行卡
  Future<void> bindingBankCard(BindingBankDto dto);

  // 删除银行卡
  Future<void> deleteBankCard(BankInfos dto);

  // 退出登录
  Future<void> logout();

  // 用户银行卡
  Future<MyBankListInfoEntity> myBankList();

  // 用户余额
  Future<MoneyEntity> userMoney();

  // 用户余额
  Future<TotalCountEntity> totalCount();

  Future<CommonTipsEntity> initBinding(BindingBankCheckingDto dto);
}

class UserWalletProvider extends BaseProvider implements _IUserWalletProvider {
  @override
  Future<void> bindingBankCard(BindingBankDto dto) {
    final api = fetch.post(ApiUrl.bindingBankCard, data: dto.toJson());
    return fetchWithErrorHandler(api);
  }

  @override
  Future<void> bindingBankCardZ01(BindingBankDtoZ01 dto) {
    final api = fetch.post(ApiUrl.bindingBankCard, data: dto.toJson());
    return fetchWithErrorHandler(api);
  }

  @override
  Future<void> deleteBankCard(BankInfos dto) {
    final api = fetch.post(ApiUrl.deleteBankCard, data: dto.toJson());
    return fetchWithErrorHandler(api);
  }

  @override
  Future<MyBankListInfoEntity> myBankList() {
    final api = fetch.post(ApiUrl.myBankList);
    return fetchWithErrorHandler(api).then(
      (res) => MyBankListInfoEntity.fromJson(res.data['data']['items']),
    );
  }

  @override
  Future<MoneyEntity> userMoney() {
    final api = fetch.post(ApiUrl.userMoney);
    return fetchWithErrorHandler(api).then(
      (res) => MoneyEntity.fromJson(res.data['data']),
    );
  }

  @override
  Future<CommonTipsEntity> initBinding(BindingBankCheckingDto dto) {
    final api = fetch.post(
      ApiUrl.initBinding,
      data: dto.toJson(),
    );
    return fetchWithErrorHandler(api).then(
      (res) => CommonTipsEntity.fromJson(res.data),
    );
  }

  @override
  Future<TotalCountEntity> totalCount() {
    final api = fetch.post(
      ApiUrl.totalCount,
    );
    return fetchWithErrorHandler(api).then(
          (res){
            return TotalCountEntity.fromJson(res.data['data']);
          }
    );
  }

  @override
  Future<void> logout() {
    final api = fetch.post(ApiUrl.exit);
    return fetchWithErrorHandler(api);
  }
}
